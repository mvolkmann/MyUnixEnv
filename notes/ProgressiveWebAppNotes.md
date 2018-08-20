# Progressive Web Apps Notes

## Resources

- <https://developers.google.com/web/fundamentals/app-install-banners/>

## React Details

- by default, NODE_ENV must be set to 'production'.
  - can remove this check for testing by modifying `registerServiceWorker.js`
- add a `meta` description inside the `head` tag in `public/index.html`
  - `<meta name="description" content="Example PWA built with React">`
- add a 192x192 icon and a 512x512 splash screen in `public/manifest.json`

  - .png files are recommended; Are they required to be PNGs?

  ```json
    "icons": [
  {
    "src": "splash-screen.png",
    "sizes": "512x512",
    "type": "image/png"
  },
  {
    "src": "big-icon.png",
    "sizes": "192x192",
    "type": "image/png"
  },
  {
    "src": "favicon.ico",
    "sizes": "64x64 32x32 24x24 16x16",
    "type": "image/x-icon"
  }
  ],
  ```

- add a button in `public/index.html` below the `div` with `id="root"`
  for the user to press to request adding the app to their home screen

  ```html
  <button id="addToHomeScreen">Add To Home Screen</button>
  ```

- add the following at the end of `src/index.js`

  ```js
  let deferredPrompt;
  const addBtn = document.querySelector('#addToHomeScreen');

  window.addEventListener('beforeinstallprompt', e => {
    // Prevent Chrome 67 and earlier from automatically showing the prompt.
    e.preventDefault();
    deferredPrompt = e;
    addBtn.style.display = 'block';
  });

  addBtn.addEventListener('click', e => {
    addBtn.style.display = 'none';
    deferredPrompt.prompt();
    deferredPrompt.userChoice.then(choiceResult => {
      if (choiceResult.outcome === 'accepted') {
        console.log('User accepted the A2HS prompt');
      } else {
        console.log('User dismissed the A2HS prompt');
      }
      deferredPrompt = null;
    });
  });

  window.addEventListener('appinstalled', evt => {
    console.log('The app was installed!');
  });

  if (window.matchMedia('(display-mode: standalone)').matches) {
    console.log('display-mode is standalone');
  }
  ```

- to build and serve the app as a PWA

- `npm install -g serve`
- `npm run build`
  - run this again every time the code is changed,
    including changes to `manifest.json`!
- `cd build`
- `serve`
- browse localhost:8080
- for repeated rebuilds, run this:
  `cd ..; npm run build; cd build; serve`

- to test for issues

- open Chrome devtools
- select the "Audits" tab
- press "Run audits" button

  - to run again, click "+" in upper-left of devtools
    and press "Run audits" button again

- click the score for "Progressive Web App"
- fix any issues identified

- in macOS, apps are installed in Desktop/Chrome Apps

- after making changes and rebuilding the app, in order to see the changes
  - if the app is already running, the user must refresh twice
  - if the app is not running, the user must start it and refresh once

## In Chrome

- to enable PWAs in Chrome (Are these steps really required?)

- browse chrome://flags
- change the dropdown for the following to "Enabled":
  "App Banners", "Experimental App Banners", and "Desktop PWAs"
- press the "RELAUNCH NOW" button so changes will take effect

- to find public PWAs

- browse <https://pwa.rocks>

- criteria for installing

- not already installed
- user has interacted with the domain for at least 30 seconds
- has a web app manifest (`manifest.json` file in public directory)
  that includes
  - short_name or name
  - icons of sizes 192px and 512px
  - start_url
  - display set to "fullscreen", "standalone", or "minimal-ui"
- served using HTTPS (required for service workers)
- service worker is registered with a "fetch" event handler
- if all the criteria above are met,
  Chrome will fire a `beforeinstallprompt` event
  that can be used to prompt the user to install the PWA

- to view manifest details in Chrome devtools

- browse app
- open devtools
- click "Application" tab
- click "Manifest" in left nav.
- there is an "Add to homescreen" link here!

  - does work yet for Tesla app
  - says "no matching service worker detected"

- to install a PWA

- browse to site in Chrome
  - ex. app.ft.com which is the Financial Times app
- click the vertical ellipsis in upper-right
- select "Install {app-name}"
- will see a dialog asking if you want to add the app "to desktop"
  - but that is not where it will be placed
- will be installed in `~/Applications/Chrome Apps`
  in a file with a `.app` extension

- to run an installed PWA

- double-click it

- to uninstall a PWA

- delete the `.app` file from the `~/Applications/Chrome Apps` directory
- but Chrome will still think it is installed
  and will not allow it to be installed again!

```

```
