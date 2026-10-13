using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using RimWorks.Pickle;
using RimWorld;
using RimWorld.Planet;
using Verse;
using Verse.Sound;

namespace FunnyCreaturesRenew.PickleSteps
{
    /// <summary>
    /// What the engine does with the numbers of the two animals: taming, milk and wool, butchering, training,
    /// wild spawning, trade, the dessicated corpse and the sounds (scenarios D to K, M and O of TESTING.md).
    ///
    /// Each step reads a figure the game computes itself, so that no scenario waits for days of game time or
    /// for a die roll: the handling skill stat and the taming curve instead of a taming attempt, the comp's
    /// own properties instead of a six-day milking, the butcher products of the live animal instead of a
    /// corpse (nothing dies, so no death action fires), the biome commonality instead of a wildlife roll.
    /// </summary>
    public partial class FunnyCreaturesSteps
    {
        private static void CompareFloat(PickleContext ctx, string what, float value, string comparison, float limit)
        {
            ctx.Require(comparison == "above" || comparison == "below",
                "the comparison is 'above' or 'below', not '" + comparison + "'");
            bool ok = comparison == "above" ? value > limit : value < limit;
            ctx.Assert(ok, $"{what} is {value:0.###}, expected it {comparison} {limit:0.###}");
        }

        // ---- D: taming ----

        /// <summary>
        /// The handling skill a handler needs, the engine's own stat over wildness. A wildness the game did not
        /// read (the 1.6 trap) gives a skill of 0, which is how an animal tames for almost nothing.
        /// </summary>
        [Then("Funny Creatures Renew: the race {string} needs a handling skill {word} {float}")]
        public void RaceNeedsHandlingSkill(PickleContext ctx, string raceDefName, string comparison, float limit)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            CompareFloat(ctx, "the minimum handling skill of " + raceDefName,
                race.GetStatValueAbstract(StatDefOf.MinimumHandlingSkill), comparison, limit);
        }

        /// <summary>
        /// The factor a taming attempt multiplies the handler's chance by: a curve over wildness, read from the
        /// private field of InteractionWorker_RecruitAttempt (1.6: 0 at wildness 1, 1 at 0.5, 2 at 0).
        /// </summary>
        [Then("Funny Creatures Renew: the taming chance factor of the race {string} is {word} {float}")]
        public void TamingFactor(PickleContext ctx, string raceDefName, string comparison, float limit)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            FieldInfo field = typeof(InteractionWorker_RecruitAttempt).GetField("TameChanceFactorCurve_Wildness",
                BindingFlags.Static | BindingFlags.NonPublic);
            ctx.Require(field != null, "InteractionWorker_RecruitAttempt has no TameChanceFactorCurve_Wildness field in this game");
            SimpleCurve curve = (SimpleCurve)field.GetValue(null);
            float wildness = race.GetStatValueAbstract(StatDefOf.Wildness);
            CompareFloat(ctx, $"the taming chance factor of {raceDefName} (wildness {wildness:0.##})",
                curve.Evaluate(wildness), comparison, limit);
        }

        [Then("Funny Creatures Renew: the race {string} turns manhunter on a failed taming {float} of the time")]
        public void ManhunterOnTameFail(PickleContext ctx, string raceDefName, float expected)
        {
            float actual = PawnUtility.GetManhunterOnTameFailChance(RequireRace(ctx, raceDefName));
            ctx.Assert(Math.Abs(actual - expected) < 0.001f,
                $"{raceDefName} turns manhunter on a failed taming {actual:0.###} of the time, expected {expected:0.###}");
        }

        // ---- E, F, G: milk and wool ----

        [Given("Funny Creatures Renew: the animal {string} is tamed")]
        public void AnimalIsTamed(PickleContext ctx, string nickname)
        {
            Pawn animal = RequireAnimal(ctx, nickname);
            animal.SetFaction(Faction.OfPlayer);
            ctx.Assert(animal.Faction == Faction.OfPlayer, nickname + " did not join the colony");
        }

        [Given("Funny Creatures Renew: the animal {string} is male")]
        public void AnimalIsMale(PickleContext ctx, string nickname)
        {
            Pawn animal = RequireAnimal(ctx, nickname);
            animal.gender = Gender.Male;
            ctx.Assert(animal.gender == Gender.Male, nickname + " is not male");
        }

        private static CompHasGatherableBodyResource GatherComp(PickleContext ctx, Pawn animal, string kind)
        {
            ctx.Require(kind == "milk" || kind == "wool", "the resource is 'milk' or 'wool', not '" + kind + "'");
            CompHasGatherableBodyResource comp = kind == "milk"
                ? (CompHasGatherableBodyResource)animal.TryGetComp<CompMilkable>()
                : animal.TryGetComp<CompShearable>();
            ctx.Require(comp != null, $"{animal.Name?.ToStringShort} carries no {kind} comp");
            return comp;
        }

        private static T ProtectedValue<T>(object comp, string name)
        {
            PropertyInfo property = typeof(CompHasGatherableBodyResource).GetProperty(name,
                BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
            return (T)property.GetValue(comp, null);
        }

        /// <summary>The comp's own answers: what it hands over, how much, and how often. The engine reads the
        /// comp properties, so an unresolved or lost field shows here.</summary>
        [Then("Funny Creatures Renew: the animal {string} yields {int} of {string} of {word} every {int} days")]
        public void AnimalYields(PickleContext ctx, string nickname, int amount, string productDefName, string kind, int days)
        {
            CompHasGatherableBodyResource comp = GatherComp(ctx, RequireAnimal(ctx, nickname), kind);
            ThingDef product = ProtectedValue<ThingDef>(comp, "ResourceDef");
            ctx.Assert(product != null && product.defName == productDefName,
                $"{nickname} yields {product?.defName ?? "nothing"} of {kind}, expected {productDefName}");
            int actualAmount = ProtectedValue<int>(comp, "ResourceAmount");
            ctx.Assert(actualAmount == amount, $"{nickname} yields {actualAmount} of {kind}, expected {amount}");
            int actualDays = ProtectedValue<int>(comp, "GatherResourcesIntervalDays");
            ctx.Assert(actualDays == days, $"{nickname} yields every {actualDays} days, expected {days}");
        }

        [Given("Funny Creatures Renew: the animal {string} is full of {word}")]
        public void AnimalIsFull(PickleContext ctx, string nickname, string kind)
        {
            CompHasGatherableBodyResource comp = GatherComp(ctx, RequireAnimal(ctx, nickname), kind);
            FieldInfo field = typeof(CompHasGatherableBodyResource).GetField("fullness",
                BindingFlags.Instance | BindingFlags.NonPublic);
            field.SetValue(comp, 1f);
        }

        [Then("Funny Creatures Renew: the animal {string} can be gathered from for {word}")]
        public void AnimalCanBeGathered(PickleContext ctx, string nickname, string kind)
        {
            CompHasGatherableBodyResource comp = GatherComp(ctx, RequireAnimal(ctx, nickname), kind);
            ctx.Assert(comp.ActiveAndFull, $"{nickname} is not ready to give {kind}: the comp is not active and full");
        }

        [Then("Funny Creatures Renew: the stuff {string} has the factor {float} on the stat {string}")]
        public void StuffFactor(PickleContext ctx, string defName, float expected, string statDefName)
        {
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Require(def != null && def.stuffProps != null, "no stuff def named '" + defName + "'");
            StatDef stat = DefDatabase<StatDef>.GetNamedSilentFail(statDefName);
            ctx.Require(stat != null, "no stat named '" + statDefName + "'");
            StatModifier modifier = def.stuffProps.statFactors?.FirstOrDefault(f => f.stat == stat);
            float actual = modifier != null ? modifier.value : 1f;
            ctx.Assert(Math.Abs(actual - expected) < 0.001f,
                $"{defName} has a {statDefName} factor of {actual:0.###}, expected {expected:0.###}");
        }

        // ---- H: butchering ----

        /// <summary>What a butcher would take from the animal, asked of the live pawn: nothing dies, so no death
        /// action fires. The corpse path calls this same method.</summary>
        [Then("Funny Creatures Renew: butchering the animal {string} gives {string} and meat")]
        public void ButcherGives(PickleContext ctx, string nickname, string leatherDefName)
        {
            Pawn animal = RequireAnimal(ctx, nickname);
            Pawn butcher = PawnsFinder.AllMaps_FreeColonists.FirstOrDefault();
            ctx.Require(butcher != null, "no colonist to butcher with");
            List<Thing> products = animal.ButcherProducts(butcher, 1f).ToList();
            string seen = string.Join(", ", products.Select(t => t.def.defName + " x" + t.stackCount));
            ctx.Assert(products.Any(t => t.def.defName == leatherDefName), $"butchering {nickname} gives {seen}, no {leatherDefName}");
            ctx.Assert(products.Any(t => t.def.IsMeat), $"butchering {nickname} gives {seen}, no meat");
        }

        // ---- I: training, pack, herd ----

        [Then("Funny Creatures Renew: the animal {string} can be trained in {string}")]
        public void CanTrain(PickleContext ctx, string nickname, string trainableDefName)
        {
            Pawn animal = RequireAnimal(ctx, nickname);
            TrainableDef trainable = DefDatabase<TrainableDef>.GetNamedSilentFail(trainableDefName);
            ctx.Require(trainable != null, "no TrainableDef named '" + trainableDefName + "'");
            ctx.Require(animal.training != null, nickname + " has no training tracker");
            AcceptanceReport report = animal.training.CanAssignToTrain(trainable);
            ctx.Assert(report.Accepted, $"{nickname} cannot be trained in {trainableDefName}: {report.Reason}");
        }

        [Then("Funny Creatures Renew: the race {string} is {word} a pack animal")]
        public void RacePackAnimal(PickleContext ctx, string raceDefName, string polarity)
        {
            bool expected = PolarityIsAlways(ctx, polarity);
            bool actual = RequireRace(ctx, raceDefName).race.packAnimal;
            ctx.Assert(actual == expected, $"{raceDefName} is{(actual ? "" : " not")} a pack animal, expected it {(expected ? "is" : "is not")}");
        }

        [Then("Funny Creatures Renew: the race {string} is {word} a herd animal")]
        public void RaceHerdAnimal(PickleContext ctx, string raceDefName, string polarity)
        {
            bool expected = PolarityIsAlways(ctx, polarity);
            bool actual = RequireRace(ctx, raceDefName).race.herdAnimal;
            ctx.Assert(actual == expected, $"{raceDefName} is{(actual ? "" : " not")} a herd animal, expected it {(expected ? "is" : "is not")}");
        }

        private static bool PolarityIsAlways(PickleContext ctx, string polarity)
        {
            ctx.Require(polarity == "always" || polarity == "never", "the word is 'always' or 'never', not '" + polarity + "'");
            return polarity == "always";
        }

        [Then("Funny Creatures Renew: the animal {string} carries {word} than a {string}")]
        public void CarriesMoreThan(PickleContext ctx, string nickname, string comparison, string otherKindDefName)
        {
            Pawn animal = RequireAnimal(ctx, nickname);
            Pawn other = PawnGenerator.GeneratePawn(RequireKind(ctx, otherKindDefName), null, (PlanetTile?)null);
            try
            {
                CompareFloat(ctx, "the carrying capacity of " + nickname, MassUtility.Capacity(animal), comparison,
                    MassUtility.Capacity(other));
            }
            finally
            {
                other.Destroy();
            }
        }

        // ---- J: wild spawning ----

        [Then("Funny Creatures Renew: the kind {string} lives in exactly the biomes {string}")]
        public void LivesInBiomes(PickleContext ctx, string kindDefName, string biomes)
        {
            PawnKindDef kind = RequireKind(ctx, kindDefName);
            List<string> actual = DefDatabase<BiomeDef>.AllDefsListForReading
                .Where(b => b.CommonalityOfAnimal(kind) > 0f).Select(b => b.defName).OrderBy(n => n).ToList();
            List<string> expected = biomes.Split(',').Select(s => s.Trim()).OrderBy(n => n).ToList();
            ctx.Assert(actual.SequenceEqual(expected),
                $"{kindDefName} lives in {string.Join(", ", actual)}, expected {string.Join(", ", expected)}");
        }

        [Then("Funny Creatures Renew: the kind {string} wanders in groups of {int} to {int}")]
        public void WildGroupSize(PickleContext ctx, string kindDefName, int min, int max)
        {
            PawnKindDef kind = RequireKind(ctx, kindDefName);
            ctx.Assert(kind.wildGroupSize.min == min && kind.wildGroupSize.max == max,
                $"{kindDefName} wanders in groups of {kind.wildGroupSize.min} to {kind.wildGroupSize.max}, expected {min} to {max}");
        }

        // ---- K: traders ----

        [Then("Funny Creatures Renew: some trader of the game can stock the race {string}")]
        public void SomeTraderStocks(PickleContext ctx, string raceDefName)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            bool any = DefDatabase<TraderKindDef>.AllDefsListForReading.Any(t => t.stockGenerators != null
                && t.stockGenerators.Any(g => g is StockGenerator_Animals && g.HandlesThingDef(race)));
            ctx.Assert(any, $"no trader kind of the game has an animal stock that handles {raceDefName}");
        }

        // ---- M: the dessicated corpse ----

        /// <summary>The dessicated graphic of every life stage loads and draws from the four sides, none of them
        /// the game's missing-texture material (the pink box). One texture facing east is enough: the game turns it.</summary>
        [Then("Funny Creatures Renew: the kind {string} draws a dessicated corpse from every side")]
        public void DessicatedDraws(PickleContext ctx, string kindDefName)
        {
            PawnKindDef kind = RequireKind(ctx, kindDefName);
            int drawn = 0;
            foreach (PawnKindLifeStage stage in kind.lifeStages)
            {
                foreach (GraphicData data in new[] { stage.dessicatedBodyGraphicData, stage.femaleDessicatedBodyGraphicData })
                {
                    if (data == null)
                    {
                        continue;
                    }
                    Graphic graphic = data.Graphic;
                    ctx.Assert(graphic != null && graphic != BaseContent.BadGraphic,
                        $"{kindDefName}: the dessicated graphic did not load ({data.texPath})");
                    foreach (Rot4 rot in new[] { Rot4.North, Rot4.East, Rot4.South, Rot4.West })
                    {
                        ctx.Assert(graphic.MatAt(rot, null) != BaseContent.BadMat,
                            $"{kindDefName}: the dessicated graphic {data.texPath} shows the missing-texture material facing {rot}");
                    }
                    drawn++;
                }
            }
            ctx.Assert(drawn > 0, $"{kindDefName} declares no dessicated graphic on any life stage");
        }

        // ---- O: sounds ----

        private static SoundDef RaceSound(PickleContext ctx, string raceDefName, string which)
        {
            LifeStageAge race = RequireRace(ctx, raceDefName).race.lifeStageAges.Last();
            switch (which)
            {
                case "call": return race.soundCall;
                case "angry": return race.soundAngry;
                case "wounded": return race.soundWounded;
                case "death": return race.soundDeath;
                default:
                    ctx.Require(false, "the sound is call, angry, wounded or death, not '" + which + "'");
                    return null;
            }
        }

        [Then("Funny Creatures Renew: the race {string} has a {word} sound with clips that load")]
        public void SoundHasClips(PickleContext ctx, string raceDefName, string which)
        {
            SoundDef sound = RaceSound(ctx, raceDefName, which);
            ctx.Assert(sound != null, $"{raceDefName} has no {which} sound");
            int clips = sound.subSounds.SelectMany(s => s.grains).SelectMany(g => g.GetResolvedGrains()).Count();
            ctx.Assert(clips > 0, $"the {which} sound of {raceDefName} ({sound.defName}) resolves no clip: its folder is empty or missing");
        }

        [Then("Funny Creatures Renew: the {word} sound of the race {string} is pitched {word} {float}")]
        public void SoundPitch(PickleContext ctx, string which, string raceDefName, string comparison, float limit)
        {
            SoundDef sound = RaceSound(ctx, raceDefName, which);
            ctx.Require(sound != null && sound.subSounds.Count > 0, $"{raceDefName} has no {which} sound");
            CompareFloat(ctx, $"the highest pitch of the {which} sound of {raceDefName}",
                sound.subSounds.Max(s => s.pitchRange.max), comparison, limit);
        }

        [Then("Funny Creatures Renew: the {word} sound of the race {string} is that of the race {string}")]
        public void SoundIsThatOf(PickleContext ctx, string which, string raceDefName, string otherRaceDefName)
        {
            SoundDef sound = RaceSound(ctx, raceDefName, which);
            SoundDef other = RaceSound(ctx, otherRaceDefName, which);
            ctx.Assert(sound != null && sound == other,
                $"the {which} sound of {raceDefName} is {sound?.defName ?? "none"}, not that of {otherRaceDefName} ({other?.defName ?? "none"})");
        }
    }
}
