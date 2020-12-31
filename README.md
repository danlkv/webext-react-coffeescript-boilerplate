This is a boilerplate repo for starting a modular development of a browser extension.

Here you will find boilerplate for:
- Popup and options pages 
- Background and content scripts
- Manifest file for extension

All this with 
- React
- Webpack
- Coffeescript
- Less, css
- [Polyfilled browser](https://github.com/mozilla/webextension-polyfill) that allows you to use promises in Chrome.

The nice feature of this boilerplate that you can easily reuse code from any react project. 
It's fully ok if you use js, just add the js part to webpack.config.coffee.

# Usage

1. Install packages: `yarn` or `npm i`;
2. Start development: `yarn dev`. The extension will be
auto-compiled on file change. Load it from `build` folder,
then click "Reload" button in the extensions page. Or you can
use a [web-extension to reload web-extension](https://chrome.google.com/webstore/detail/dev-extensions-reload/bbanndmhbmgajamonlgnjnfdbifbnbdj/related);
3. When you're done, build the extension: `yarn build`.

For Firefox, you can use [web-ext tool](https://extensionworkshop.com/documentation/develop/getting-started-with-web-ext/).
It will automatically reload extension on file change.

1. Install web-ext tool;
2. Run it with running `web-ext run` from `build/` folder

## Polyfill

To write without wondering about Firefox vs Chrome,
use `import browser from 'webextension-polyfill'`.
More details: [webextension-polyfill](https://github.com/mozilla/webextension-polyfill).

## Hot reload

[Hot Module Replacement](https://webpack.js.org/guides/hot-module-replacement/) will require SSL setup.
You can skip it, and just click on reload button to update the extension.

1. Install [mkcert](https://github.com/FiloSottile/mkcert).
2. Run `mkcert -install` and then `mkcert localhost` in the root of the project.
3. Run `yarn start`, which is equivalent to `yarn dev-ssl`.
```
    » yarn start
    yarn run v1.22.10
    $ yarn run dev-ssl
    $ webpack-dev-server --https --key localhost-key.pem --cert localhost.pem
    ℹ ｢wds｣: Project is running at https://localhost:8081/
```
4. Popup, and background will reload on file write by webpack dev server.
Content reloads, but doesn't update for some reason.
Note that this will make all the pages with content scripts reload as well, which 
if you have a lot of tabs open can cause performance issues.


# Why coffeescript?

because it's less verbose. I personally love to use this style of syntax:

```coffeescript
import React, { Component } from 'react'
import L from 'react-dom-factories'
L_ = React.createElement

Greeting = ()->
  L.div className:'greeting',
	L.h2 style:textAlign:'center', 'Hello World'

export default class App extends React.Component
  constructor:->
    super()
     
  render: ->
    L.div className:'app',
      L_ Greeting, null

ReactDOM.render <App />, document.getElementById 'root'

```

See `src/` for functional components and usage with react-hooks and promises.

# Notes

If you change permissions, you have to re-add your extension.

# Reads

- [Developing cross-browser extensions with web-ext](https://hacks.mozilla.org/2019/10/developing-cross-browser-extensions-with-web-ext-3-2-0/)
- [Message passing - Chrome Developers](https://developer.chrome.com/docs/extensions/mv2/messaging/)
