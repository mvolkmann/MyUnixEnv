# Svelte Notes

To use a local version of the Svelte library:

- cd to a directory that will hold the Svelte library
- git clone https://github.com/sveltejs/svelte.git
- cd svelte
- npm install
- npm run build
- npm link
- cd to an app directory
- npm link svelte
- npm run dev
- test the app

To test a specific Svelte commit:
- cd to the svelte directory
- git checkout {commit-hash}
- rm package-lock.json
- npm install
- npm run build
- cd to an app directory
- npm run dev
- test the app

To test your own change to the Svelte library:
- modify a file under svelte/src/runtime
- cd to the svelte directory
- npm run build
- cd to an app directory
- npm run dev
- test the app

