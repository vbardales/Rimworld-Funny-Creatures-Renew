// Run with Node.js and Playwright available through NODE_PATH.
const fs = require('node:fs');
const path = require('node:path');
const http = require('node:http');
const { chromium } = require('playwright');
const art = __dirname;
const mime = { '.html': 'text/html', '.json': 'application/json', '.png': 'image/png' };
const server = http.createServer((req, res) => {
  const name = new URL(req.url, 'http://localhost').pathname.slice(1);
  if (!['preview.html','preview-palette.json','Preview-source.png'].includes(name)) {
    res.writeHead(404); res.end(); return;
  }
  res.setHeader('Content-Type', mime[path.extname(name)]);
  fs.createReadStream(path.join(art, name)).pipe(res);
});
(async () => {
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  let browser;
  try {
    browser = await chromium.launch({channel:'chrome', headless:true});
    const page = await browser.newPage({ viewport:{width:896,height:504}, deviceScaleFactor:1 });
    await page.goto(`http://127.0.0.1:${server.address().port}/preview.html`);
    await page.evaluate(() => window.previewReady);
    const cdp = await page.context().newCDPSession(page);
    await cdp.send('DOM.enable'); await cdp.send('CSS.enable');
    const {root} = await cdp.send('DOM.getDocument');
    const {nodeId} = await cdp.send('DOM.querySelector',{nodeId:root.nodeId,selector:'.text'});
    const fonts = await cdp.send('CSS.getPlatformFontsForNode',{nodeId});
    const metrics = await page.evaluate(() => Object.fromEntries(
      ['h1','.suffix','.tag','p','.version'].map(selector => {
        const e = document.querySelector(selector), r = e.getBoundingClientRect(), s = getComputedStyle(e);
        return [selector,{x:r.x,y:r.y,width:r.width,height:r.height,color:s.color,fontSize:s.fontSize,fontFamily:s.fontFamily}];
      })));
    const output = path.join(art,'../Mod/About/Preview.png');
    await page.screenshot({path:output});
    await page.addStyleTag({content:'.text,.version {visibility:hidden}'});
    await page.screenshot({path:path.join(art,'preview-background.png')});
    await page.evaluate(() => document.querySelectorAll('style')[document.querySelectorAll('style').length-1].remove());
    await page.addStyleTag({content:'.stage {transform:scale(0.29910714285714285);transform-origin:top left} html,body{width:268px;height:151px}'});
    await page.setViewportSize({width:268,height:151});
    await page.screenshot({path:path.join(art,'preview-thumbnail.png')});
    const result = {fonts:fonts.fonts, metrics, bytes:fs.statSync(output).size};
    fs.writeFileSync(path.join(art,'preview-render.json'),JSON.stringify(result,null,2)+'\n');
    console.log(JSON.stringify(result,null,2));
  } finally {
    if(browser) await browser.close();
    server.close();
  }
})().catch(e=>{console.error(e);process.exitCode=1;server.close();});
