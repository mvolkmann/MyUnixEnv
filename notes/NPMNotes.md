# NPM Notes

To browse the home page of an npm package

- `npm home {name}`
  - defaults to GitHub README.md

To browse the Github repo of an npm package

- `npm repo {name}`

To list any outdated dependencies in package.json in the current directory

- `npm outdated`

To list packages in node_modules that are
not listed as dependencies in package.json
and delete those directories from node_modules

- `npm prune`

To lock down dependencies to their current version

- `npm shrinkwrap` (generates `npm-shrinkwrap.json`)
- probably better to use yarn!

To install all dependencies

- `npm install`

To install only regular dependencies, excluding devDependencies

- `npm install --production`

To do a clean install of all dependencies

- `npm ci`
- primary differences from `npm install`
  - must have package-lock.json (or npm-shrinkwrap.json) file
  - if dependencies in this file do not match those in `package.json`, will exit with an error
  - only installs all dependencies listed in `package.json`, not specified dependencies
  - if `node_modules` directory exists, it is deleted before installs begin
  - does not modify package.json or package-lock.json
- cannot use this after updating versions in `package.json`
  using VS Code "Version Lens" extension
  because versions in `package-lock.json` will not match
  - need to delete `package-lock.json` and run `npm install`

To list globally installed packages

- `npm ls -g --depth 0`

To change the log level for npm

- `npm config set loglevel {level}`
- valid levels are silent, error, warn, http, info, verbose, and silly

To change a package directory under node_modules to be a
symbolic link to a local directory for that package
for debugging purposes

- cd to directory with code to be debugged
- `npm link`
- cd to directory of code that has that as a dependency
- `npm link {dependency-name}`

To create a new React app using create-react-app

- `npm init react-app {app-name}`

To run a security audit

- `npm audit`
  - "will produce a report of security vulnerabilities with
    the affected package name, vulnerability severity and description,
    path, and other information, and, if available,
    commands to apply patches to resolve vulnerabilities"
- to attempt to fix issues, `npm audit fix`
  - "automatically install compatible updates to vulnerable dependencies"
