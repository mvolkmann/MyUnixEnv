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

Alternative steps to debug Svelte from Dave Kondrad:

. clone fork locally and add main repo as 'upstream' remote
. fast forward my master to upstream master and push
. branch off master (usually use the gh-issuenumber)
. create the most stripped down runtime test off of the bug report repl or description
. open the cloned repo in VSCode as a folder so that you can run debugger
. npm run test -- -g "my-test-name" --inspect-brk (run only tests matching name and tell node to spawn debugger
. use VSCode to attach to node.js, find the script you want to debug in the compiled output (which is in the repo directory) and place a breakpoint
. place a breakpoint in the test file so you know the modified code is being executed
. Eureka! - or Fail! and try again

