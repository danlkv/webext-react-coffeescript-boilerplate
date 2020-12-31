import browser from 'webextension-polyfill'

browser.runtime.onMessage.addListener (req, send, resp)=>
  resp 'background echo: '+req.greeting

console.log "background"
