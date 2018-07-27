# Progressive Web Apps Notes

## Resources

- <https://developers.google.com/web/fundamentals/app-install-banners/>

## In Chrome

- to enable PWAs in Chrome

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

- evaluating with Lighthouse
  - install Lighthouse Chrome extension
  - browse the app
  - click the lighthouse icon in upper-right
  - press "Generate report"
  - click the circle for "Progressive Web App"
  - note the issues
