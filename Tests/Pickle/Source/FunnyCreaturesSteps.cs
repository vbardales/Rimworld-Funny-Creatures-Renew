using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using RimWorks.Pickle;
using RimWorld;
using RimWorld.Planet;
using Verse;

namespace FunnyCreaturesRenew.PickleSteps
{
    /// <summary>
    /// What Pickle's own steps cannot say about this mod.
    ///
    /// Every step text starts with "Funny Creatures Renew:". Pickle loads the steps of every active
    /// suite into one namespace, and two suites declaring the same text make healthy scenarios fail with
    /// "Ambiguous step". No text uses parentheses or slashes, which Cucumber expressions read as optional
    /// text and alternatives: cells are spelled x=.. z=...
    ///
    /// WHY THERE IS AN ASSEMBLY AT ALL. Two limits of the built-in steps, both read from the installed
    /// Pickle 4.9.1 (2026-09-28):
    ///
    ///   - Its pawn steps resolve a pawn by NICKNAME among FREE COLONISTS only (PawnLookup.FindLiving).
    ///     Neither animal is ever a colonist, so "I kill", "is dead" and "has hediff" cannot name one.
    ///   - Its def steps resolve a defName across every def database and THROW when it names more than
    ///     one def (DefLookup.RequireAny). Meffalo and Boomsloth are both a ThingDef and a PawnKindDef,
    ///     as are the vanilla animals the crossbreeding patch names, so "def X field ..." cannot be used.
    ///
    /// NOTHING HERE REFERENCES AN OPTIONAL MOD. The three mods this suite looks at are read by NAME through
    /// reflection: a modExtension is found by its full type name, and its fields by their names. So this
    /// assembly compiles against the game alone, and a rename in one of those mods makes its scenario fail
    /// with a message that says what was not found, instead of making the whole suite fail to load.
    /// </summary>
    [PickleSteps]
    public class FunnyCreaturesSteps
    {
        private const string CrossbreedingExtension = "DZY.CrossBreeding.Extension";
        private const string NocturnalExtension = "NocturnalAnimals.ExtendedRaceProperties";
        private const float TicksPerYear = 3600000f;

        // -------------------------------------------------------------------------------------
        // Animals and colonists in the scene
        // -------------------------------------------------------------------------------------

        [Given("Funny Creatures Renew: a {string} named {string} is spawned at x={int} z={int}")]
        public void SpawnAdult(PickleContext ctx, string kindDefName, string nickname, int x, int z)
        {
            Spawn(ctx, kindDefName, nickname, x, z, calf: false);
        }

        [Given("Funny Creatures Renew: a {string} calf named {string} is spawned at x={int} z={int}")]
        public void SpawnCalf(PickleContext ctx, string kindDefName, string nickname, int x, int z)
        {
            Spawn(ctx, kindDefName, nickname, x, z, calf: true);
        }

        /// <summary>
        /// A wild animal of the kind, of a fixed age, so that the life stage is not left to chance. The
        /// stage matters twice: the boomsloth's explosion radius is chosen by it (1.9, 2.9 or 4.9), and a
        /// calf is exactly the case the predator protection exists for.
        /// </summary>
        private static void Spawn(PickleContext ctx, string kindDefName, string nickname, int x, int z, bool calf)
        {
            Map map = Find.CurrentMap;
            ctx.Require(map != null, "no current map: load a save first");
            PawnKindDef kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(kindDefName);
            ctx.Require(kind != null, "no PawnKindDef named '" + kindDefName + "'");
            IntVec3 cell = new IntVec3(x, 0, z);
            ctx.Require(cell.InBounds(map), $"cell ({x}, {z}) is outside the map, which is {map.Size.x} by {map.Size.z}");

            Pawn pawn = PawnGenerator.GeneratePawn(kind, null, (PlanetTile?)null);
            List<LifeStageAge> stages = kind.RaceProps.lifeStageAges;
            float years = calf
                ? Math.Min(0.1f, stages[1].minAge * 0.5f)
                : stages[stages.Count - 1].minAge + 0.25f;
            pawn.ageTracker.AgeBiologicalTicks = (long)(years * TicksPerYear);
            pawn.ageTracker.AgeChronologicalTicks = (long)(years * TicksPerYear);
            pawn.Name = new NameSingle(nickname);
            GenSpawn.Spawn(pawn, cell, map);
            int stage = pawn.ageTracker.CurLifeStageIndex;
            ctx.Require(calf ? stage == 0 : stage == stages.Count - 1,
                $"{nickname} was given age {years:0.###} and is at life stage {stage} of {stages.Count} instead of the "
                + (calf ? "first" : "last"));
        }

        [Given("Funny Creatures Renew: the colonist {string} stands at x={int} z={int}")]
        public void PlaceColonist(PickleContext ctx, string nickname, int x, int z)
        {
            Pawn pawn = PawnsFinder.AllMaps_FreeColonists.FirstOrDefault(p =>
                string.Equals(p.Name?.ToStringShort, nickname, StringComparison.OrdinalIgnoreCase));
            ctx.Require(pawn != null, "no colonist nicknamed '" + nickname + "'; use \"a colonist ... exists\" first");
            IntVec3 cell = new IntVec3(x, 0, z);
            ctx.Require(cell.InBounds(pawn.Map), $"cell ({x}, {z}) is outside the map");
            pawn.Position = cell;
            pawn.Notify_Teleported();
            // Pinned: a free colonist walks away from the blast site between two steps.
            if (pawn.drafter != null)
            {
                pawn.drafter.Drafted = true;
            }
            ctx.Assert(pawn.Position == cell, $"{nickname} is at {pawn.Position}, not at {cell}");
        }

        [When("Funny Creatures Renew: {string} is killed")]
        public void Kill(PickleContext ctx, string nickname)
        {
            RequireAnimal(ctx, nickname).Kill(null);
        }

        private static Pawn RequireAnimal(PickleContext ctx, string nickname)
        {
            Map map = Find.CurrentMap;
            ctx.Require(map != null, "no current map: load a save first");
            List<Pawn> spawned = map.mapPawns.AllPawnsSpawned.ToList();
            Pawn found = spawned.FirstOrDefault(p =>
                string.Equals(p.Name?.ToStringShort, nickname, StringComparison.OrdinalIgnoreCase));
            ctx.Require(found != null, "no spawned pawn named '" + nickname + "'. named pawns on the map: "
                + string.Join(", ", spawned.Where(p => p.Name != null).Select(p => p.Name.ToStringShort)));
            return found;
        }

        // -------------------------------------------------------------------------------------
        // What the animals are
        // -------------------------------------------------------------------------------------

        [Then("Funny Creatures Renew: the animal {string} is of kind {string}")]
        public void AnimalIsOfKind(PickleContext ctx, string nickname, string kindDefName)
        {
            Pawn pawn = RequireAnimal(ctx, nickname);
            ctx.Assert(pawn.kindDef?.defName == kindDefName,
                $"{nickname} is a {pawn.kindDef?.defName}, expected {kindDefName}");
        }

        [Then("Funny Creatures Renew: the animal {string} is a calf")]
        public void AnimalIsCalf(PickleContext ctx, string nickname)
        {
            Pawn pawn = RequireAnimal(ctx, nickname);
            ctx.Assert(pawn.ageTracker.CurLifeStageIndex == 0,
                $"{nickname} is at life stage {pawn.ageTracker.CurLifeStageIndex}, a calf is stage 0");
        }

        /// <summary>
        /// Asks the game's own prey test, the one a hungry predator's hunt job goes through, instead of waiting
        /// for a hunt to happen: a real hunt would be a matter of chance and of time. The method has no term
        /// for hunger (read from the 1.6 assembly on 2026-09-12), so a hungry predator is not a different
        /// question. Both pawns are wild here, so the faction clauses do not apply.
        /// </summary>
        [Then("Funny Creatures Renew: the animal {string} is not acceptable prey for {string}")]
        public void NotAcceptablePrey(PickleContext ctx, string preyNickname, string predatorNickname)
        {
            Pawn prey = RequireAnimal(ctx, preyNickname);
            Pawn predator = RequireAnimal(ctx, predatorNickname);
            bool acceptable = FoodUtility.IsAcceptablePreyFor(predator, prey);
            ctx.Assert(!acceptable, DescribePrey(prey, predator, acceptable));
        }

        [Then("Funny Creatures Renew: the animal {string} is acceptable prey for {string}")]
        public void AcceptablePrey(PickleContext ctx, string preyNickname, string predatorNickname)
        {
            Pawn prey = RequireAnimal(ctx, preyNickname);
            Pawn predator = RequireAnimal(ctx, predatorNickname);
            bool acceptable = FoodUtility.IsAcceptablePreyFor(predator, prey);
            ctx.Assert(acceptable, DescribePrey(prey, predator, acceptable));
        }

        private static string DescribePrey(Pawn prey, Pawn predator, bool acceptable)
        {
            return $"{prey.Name.ToStringShort} ({prey.kindDef.defName}, body size {prey.BodySize:0.##}, stage "
                + $"{prey.ageTracker.CurLifeStageIndex}, canBePredatorPrey {prey.RaceProps.canBePredatorPrey}) "
                + $"{(acceptable ? "IS" : "is NOT")} acceptable prey for {predator.Name.ToStringShort} "
                + $"({predator.kindDef.defName}, maxPreyBodySize {predator.RaceProps.maxPreyBodySize:0.##})";
        }

        // -------------------------------------------------------------------------------------
        // Defs as the game loaded them, with the optional mods' patches applied
        // -------------------------------------------------------------------------------------

        [Then("Funny Creatures Renew: the race {string} lists {string} as a crossbreeding partner")]
        public void RaceListsPartner(PickleContext ctx, string raceDefName, string partnerDefName)
        {
            List<string> partners = Partners(ctx, raceDefName);
            ctx.Assert(partners.Contains(partnerDefName),
                $"{raceDefName} lists [{string.Join(", ", partners)}] as crossbreeding partners, not {partnerDefName}");
        }

        [Then("Funny Creatures Renew: the race {string} does not list {string} as a crossbreeding partner")]
        public void RaceDoesNotListPartner(PickleContext ctx, string raceDefName, string partnerDefName)
        {
            List<string> partners = Partners(ctx, raceDefName);
            ctx.Assert(!partners.Contains(partnerDefName),
                $"{raceDefName} lists [{string.Join(", ", partners)}] as crossbreeding partners, including {partnerDefName}");
        }

        [Then("Funny Creatures Renew: the race {string} lists no crossbreeding partner")]
        public void RaceListsNoPartner(PickleContext ctx, string raceDefName)
        {
            List<string> partners = Partners(ctx, raceDefName);
            ctx.Assert(partners.Count == 0,
                $"{raceDefName} lists [{string.Join(", ", partners)}] as crossbreeding partners, expected none");
        }

        private static List<string> Partners(PickleContext ctx, string raceDefName)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            return race.race.canCrossBreedWith?.Select(d => d.defName).ToList() ?? new List<string>();
        }

        /// <summary>
        /// What Better Crossbreeding will do with a birth. It reads the extension on the MOTHER's kind, whose
        /// outcomes are keyed by the FATHER's kind (its source, CrossbreedingUtility, read 2026-09-28). The
        /// extension is found by its full type name and read through reflection, so the assembly does not
        /// reference that mod.
        /// </summary>
        [Then("Funny Creatures Renew: a {string} mother answers a {string} father with {word}")]
        public void MotherAnswers(PickleContext ctx, string motherKind, string fatherKind, string behavior)
        {
            OutcomeOf(ctx, motherKind, fatherKind, behavior, out _);
        }

        [Then("Funny Creatures Renew: the kind {string} has no crossbreeding outcome")]
        public void KindHasNoOutcome(PickleContext ctx, string kindDefName)
        {
            PawnKindDef kind = RequireKind(ctx, kindDefName);
            DefModExtension extension = kind.modExtensions?.FirstOrDefault(e => e.GetType().FullName == CrossbreedingExtension);
            ctx.Assert(extension == null, $"{kindDefName} carries {CrossbreedingExtension}, expected none");
        }

        private static void OutcomeOf(PickleContext ctx, string motherKind, string fatherKind, string behavior,
            out List<string> children)
        {
            PawnKindDef kind = RequireKind(ctx, motherKind);
            DefModExtension extension = kind.modExtensions?.FirstOrDefault(e => e.GetType().FullName == CrossbreedingExtension);
            ctx.Require(extension != null, $"{motherKind} carries no {CrossbreedingExtension}. its extensions: "
                + string.Join(", ", (kind.modExtensions ?? new List<DefModExtension>()).Select(e => e.GetType().FullName)));
            IEnumerable outcomes = extension.GetType().GetField("outcomes")?.GetValue(extension) as IEnumerable;
            ctx.Require(outcomes != null, $"{CrossbreedingExtension} has no readable 'outcomes' list: has the mod changed?");

            children = new List<string>();
            List<string> seen = new List<string>();
            foreach (object outcome in outcomes)
            {
                Type type = outcome.GetType();
                PawnKindDef father = type.GetField("kindDef")?.GetValue(outcome) as PawnKindDef;
                string actual = type.GetField("behavior")?.GetValue(outcome) as string;
                seen.Add($"{father?.defName}={actual}");
                if (father?.defName != fatherKind)
                {
                    continue;
                }
                ctx.Assert(actual == behavior,
                    $"a {motherKind} mother with a {fatherKind} father answers {actual}, expected {behavior}");
                IEnumerable kids = type.GetField("childrenKinds")?.GetValue(outcome) as IEnumerable;
                if (kids != null)
                {
                    children.AddRange(kids.Cast<PawnKindDef>().Select(k => k.defName));
                }
                return;
            }
            ctx.Assert(false, $"a {motherKind} mother has no outcome for a {fatherKind} father. outcomes: [{string.Join(", ", seen)}]");
        }

        /// <summary>
        /// Nocturnal Animals (Continued) keeps an animal's body clock in a modExtension on its race, and the
        /// class holds it in a public field of an enum type. Read by name: Diurnal is what an animal without the
        /// extension gets, so "has no body clock" is the meffalo's expected state, not a missing feature.
        /// </summary>
        [Then("Funny Creatures Renew: the race {string} has the body clock {word}")]
        public void RaceHasBodyClock(PickleContext ctx, string raceDefName, string expected)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            DefModExtension extension = race.modExtensions?.FirstOrDefault(e => e.GetType().FullName == NocturnalExtension);
            ctx.Require(extension != null, $"{raceDefName} carries no {NocturnalExtension}. its extensions: "
                + string.Join(", ", (race.modExtensions ?? new List<DefModExtension>()).Select(e => e.GetType().FullName)));
            object clock = extension.GetType().GetField("bodyClock")?.GetValue(extension);
            ctx.Require(clock != null, $"{NocturnalExtension} has no readable 'bodyClock' field: has the mod changed?");
            ctx.Assert(clock.ToString() == expected, $"{raceDefName} has the body clock {clock}, expected {expected}");
        }

        [Then("Funny Creatures Renew: the race {string} has no body clock")]
        public void RaceHasNoBodyClock(PickleContext ctx, string raceDefName)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            DefModExtension extension = race.modExtensions?.FirstOrDefault(e => e.GetType().FullName == NocturnalExtension);
            ctx.Assert(extension == null, $"{raceDefName} carries {NocturnalExtension}, expected none");
        }

        /// <summary>
        /// A Dog Said... Animal Prosthetics 2 copies its category lists onto its recipe bases ONCE, at its own
        /// last patch, so the result depends on this mod's patch having run first. The race's own recipe list
        /// is what the health tab offers, and it is built from the recipes' recipeUsers, so this asks the
        /// list the player's screen is drawn from.
        /// </summary>
        [Then("Funny Creatures Renew: the race {string} offers the recipe {string}")]
        public void RaceOffersRecipe(PickleContext ctx, string raceDefName, string recipeDefName)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            ctx.Require(DefDatabase<RecipeDef>.GetNamedSilentFail(recipeDefName) != null,
                $"no RecipeDef named '{recipeDefName}': is the mod that defines it loaded?");
            ctx.Assert(race.AllRecipes.Any(r => r.defName == recipeDefName),
                $"{raceDefName} does not offer {recipeDefName}. it offers {race.AllRecipes.Count} recipes");
        }

        private static ThingDef RequireRace(PickleContext ctx, string defName)
        {
            ThingDef race = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Require(race != null && race.race != null, "no animal ThingDef named '" + defName + "'");
            return race;
        }

        private static PawnKindDef RequireKind(PickleContext ctx, string defName)
        {
            PawnKindDef kind = DefDatabase<PawnKindDef>.GetNamedSilentFail(defName);
            ctx.Require(kind != null, "no PawnKindDef named '" + defName + "'");
            return kind;
        }

        // -------------------------------------------------------------------------------------
        // Text in the language of the pass
        // -------------------------------------------------------------------------------------

        /// <summary>
        /// The texts of both animals, their meat, tools, calf labels, wool and leather, against the language
        /// the pass was launched in. A language is chosen at launch, never inside a scenario, so this asserts
        /// against the active one and refuses a language it has no table for. In developer mode, which every
        /// Pickle run is in, a key missing from the active language shows as the English text in an accented
        /// form, so a missing French entry fails here as a wrong string and not as a clean English one.
        /// </summary>
        [Then("Funny Creatures Renew: the texts of the animals are those of the active language")]
        public void TextsAreThoseOfTheActiveLanguage(PickleContext ctx)
        {
            string language = LanguageDatabase.activeLanguage?.folderName ?? "(none)";
            bool french = language.StartsWith("French", StringComparison.OrdinalIgnoreCase);
            bool english = language.StartsWith("English", StringComparison.OrdinalIgnoreCase);
            ctx.Require(french || english, $"the active language is '{language}', and this step has a table for English and French only");

            ThingDef meffalo = RequireRace(ctx, "Meffalo");
            ThingDef boomsloth = RequireRace(ctx, "Boomsloth");
            ThingDef wool = DefDatabase<ThingDef>.GetNamed("WoolMeffalo");
            ThingDef leather = DefDatabase<ThingDef>.GetNamed("Leather_Darkfur");
            PawnKindDef meffaloKind = RequireKind(ctx, "Meffalo");
            PawnKindLifeStage calfKind = meffaloKind.lifeStages[0];

            List<string> problems = new List<string>();
            void Expect(string what, string actual, string expected)
            {
                if (actual != expected) problems.Add($"{what}: '{actual}', expected '{expected}'");
            }
            void ExpectStart(string what, string actual, string start)
            {
                if (actual == null || !actual.StartsWith(start, StringComparison.Ordinal))
                    problems.Add($"{what}: '{Shorten(actual)}', expected it to start with '{start}'");
            }
            void ExpectTools(string what, ThingDef def, params string[] labels)
            {
                List<string> actual = def.tools.Select(t => t.label).Where(l => !string.IsNullOrEmpty(l)).ToList();
                if (!labels.All(actual.Contains))
                    problems.Add($"{what} tool labels: [{string.Join(", ", actual)}], expected them to include [{string.Join(", ", labels)}]");
            }

            if (french)
            {
                Expect("meffalo meat", meffalo.race.meatLabel, "viande de meffalo");
                Expect("boomsloth meat", boomsloth.race.meatLabel, "viande de boomsloth");
                ExpectStart("meffalo description", meffalo.description, "Une sous-espèce de muffalo");
                ExpectStart("boomsloth description", boomsloth.description, "Le résultat d'une expérience de génie génétique");
                ExpectTools("meffalo", meffalo, "tête", "sabot gauche", "sabot droit");
                ExpectTools("boomsloth", boomsloth, "griffe gauche", "griffe droite", "tête");
                Expect("meffalo wool", wool.label, "laine de meffalo");
                Expect("dark fur", leather.label, "fourrure sombre");
                Expect("meffalo calf", calfKind.label, "veau meffalo");
                Expect("meffalo calves", calfKind.labelPlural, "veaux meffalos");
            }
            else
            {
                Expect("meffalo meat", meffalo.race.meatLabel, "meffalo meat");
                Expect("boomsloth meat", boomsloth.race.meatLabel, "boomsloth meat");
                ExpectStart("meffalo description", meffalo.description, "A larger and smarter subspecies");
                ExpectStart("boomsloth description", boomsloth.description, "The outcome of a genetical engineering project");
                ExpectTools("meffalo", meffalo, "head", "left hoof", "right hoof");
                ExpectTools("boomsloth", boomsloth, "left claw", "right claw", "head");
                Expect("meffalo wool", wool.label, "meffalo wool");
                Expect("dark fur", leather.label, "dark fur");
                Expect("meffalo calf", calfKind.label, "meffalo calf");
                Expect("meffalo calves", calfKind.labelPlural, "meffalo calves");
            }

            ctx.Assert(problems.Count == 0, $"in {language}: " + string.Join(" | ", problems));
        }

        private static string Shorten(string text)
        {
            return text == null ? "(null)" : text.Length <= 60 ? text : text.Substring(0, 60) + "...";
        }

        // -------------------------------------------------------------------------------------
        // The game's own log, from the start
        // -------------------------------------------------------------------------------------

        /// <summary>
        /// The symptom of two mods defining the same def. The game logs it once, at load, as an error:
        /// "Adding duplicate Verse.ThingDef name: Meffalo", and renames the later def. Pickle's own log steps
        /// count what is logged after a scenario starts, so a load-time message is out of their reach, and
        /// there is no built-in step that asserts an error was logged. The log FILE is read instead, from the
        /// start of the game, as PickleTools' load audit does.
        /// </summary>
        [Then("Funny Creatures Renew: the game log holds a duplicate definition error for the {word} {string}")]
        public void LogHoldsDuplicate(PickleContext ctx, string defTypeName, string defName)
        {
            string path = UnityEngine.Application.consoleLogPath;
            ctx.Require(!string.IsNullOrEmpty(path) && File.Exists(path), "the game log is not readable at '" + path + "'");
            string text;
            using (FileStream stream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite | FileShare.Delete))
            using (StreamReader reader = new StreamReader(stream))
            {
                text = reader.ReadToEnd();
            }
            Regex pattern = new Regex(@"Adding duplicate Verse\." + Regex.Escape(defTypeName) + @" name: " + Regex.Escape(defName) + @"\b");
            int count = pattern.Matches(text).Count;
            ctx.Assert(count > 0,
                $"the game log ({text.Length} characters, read from the start) holds no 'Adding duplicate Verse.{defTypeName} name: {defName}'. "
                + "either the two mods no longer define the same def, or the message changed");
        }
    }
}
