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

- add code to automatically download a new version of the app
  if it is available when the app is started or refreshed

  - edit `src/registerServiceWorker.js`
  - in the function `registerValidSW` replace
    ```js
    console.log('New content is available; please refresh.');
    ```
    with
    ```js
    window.location.reload(true);
    ```
  - for large apps, this could cause the startup time to be slow

- to build and serve the app as a PWA

- `npm install -g serve`
- see steps in "Update on Version Changes" below for more

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
  - without the call to `window.location.reload(true)` suggested above ...
  - if the app is already running, the user must refresh twice
    - the first refresh downloads new versions of the files
    - the second refresh loads the new files
  - if the app is not running, the user must start it and refresh once
    - running the app launches with the old versions of the files,
      but downloads new versions in the background?
    - refreshing loads the new files

## Updating on Version Changes

To check for updates at some interval and
allow the user to download a new version of the app,
add the following code at the bottom of `src/index.js`.

```js
function checkForUpdate() {
  fetch('version.txt')
    .then(res => res.text())
    .then(version => {
      const currentVersion = sessionStorage.getItem('app-version');
      if (version !== currentVersion) {
        console.info('version changed from', currentVersion, 'to', version);
        const download = window.confirm(
          'A new version of this app is available.  ' +
            'It will take a few seconds to download.  ' +
            'Download now?'
        );
        if (download) {
          window.location.reload();
          sessionStorage.setItem('app-version', version);
        }
      }
    })
    // Will get an error if the server is down.
    .catch(() => {}); // Ignore these errors.
}

setInterval(checkForUpdate, 5000);
```

This relies on the file `public/version.txt` being updated
before every new version is served. To automate this,
create `src/version.js` with the following content:

```js
const fs = require('fs');
fs.writeFileSync('public/version.txt', Date.now());
```

Add the following npm scripts in `package.json`:

```json
"bs": "npm-run-all build serve",
"build": "react-scripts build && npm run version",
"serve": "cd build && serve",
"version": "node src/version.js"
```

To rebuild the latest code changes, update `public/version.txt`,
and serve the application from the `build` directory,
enter `npm run bs`.

After every code change, to deploy a new version of the app
kill the server and enter `npm run bs` again.

To just start the server again with no code changes,
enter `npm run serve`.

To run the app in the new browser tab, browse localhost:{port}
where port is output by the previous command.

After a PWA is installed, it will appear at <chrome://apps>.
Browse that, right-click a PWA, and select "Remove from Chrome..."
to delete it.
This is especially useful for testing the ability to install an app.

It seems that PWAs cannot currently be installed from desktop Firefox or Safari,
but they can run inside those browser.
See <https://bugzilla.mozilla.org/show_bug.cgi?id=1407202>.
This only work in desktop Chrome if you enable PWAs.
To do this,

- browse <chrome://flags>
- change the dropdown for the following to "Enabled":
  - "Desktop PWAs"
  - "App Banners" (seems to be optional)
  - "Experimental App Banners" (seems to be optional)
- press the "RELAUNCH NOW" button so changes will take effect

To find public PWAs, browse <https://pwa.rocks>

## In Chrome

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

- browse to site in Chrome
  - ex. app.ft.com which is the Financial Times app
- click the vertical ellipsis in upper-right
- select "Install {app-name}"
- will see a dialog asking if you want to add the app "to desktop"
  - but that is not where it will be placed
- will be installed in `~/Applications/Chrome Apps`
  in a file with a `.app` extension
