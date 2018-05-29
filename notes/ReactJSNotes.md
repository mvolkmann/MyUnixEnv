# ReactJS Notes

* <http://facebook.github.io/react/>
* "a JavaScript library for building user interfaces"
* competes with AngularJS, EmberJS, and others
* claims to be faster than AngularJS due to use of a virtual DOM
  and using diffs to determine when the actual DOM requires updates
* does not use templates
* writing in pure JavaScript is ugly
* writing in the special JSX syntax is much better
  * combines JavaScript and HTML into one file
* emphasizes defining UI components that comprise a page
* each component has a render method
* add components to pages using custom elements
  whose names match the components
* no current linting tool understands JSX syntax
* only focuses on UI
* doesn't provide help with making Ajax calls
  or other non-UI tasks,
  so each ReactJS app can look very diferent
* doesn't have an equivalent for AngularJS filters

Reasons why I prefer React over Angular

* Angular adds syntax to HTML to add dynamic features (ex. ng-if and ng-repeat)
  and adds custom event handling (ex. ng-change and ng-click)
* React provides JSX which allows HTML to be specified inside JavaScript code
  * advantage is that the full power of JavaScript can be used
    for dynamically generating HTML
* Angular holds data in controllers
  * a typical app has many controllers, so the data is scattered
* The thought process when implementing custom components in React
  is much simpler that implementing "directives" in Angular.
  * three parts, assuming use of Redux pattern
  1.  What data is needed to render the component?
  * all data is passed via props (HTML attributes); best practice
  * very simple to write code that determines what to render (HTML)
    based on props
  1.  What should happen when the user interacts with the component?
  * ex. entering text in an input or pressing a button
  * call an event handling function
  * the event handling function dispatches "actions" to Redux
  * actions have a name and an optional payload for data
    * ex. name is "Add Person" and
      payload is a JavaScript object describing the person
  * an event handling function might dispatch several actions
    * one to indicate that it is doing something
      (about to make a REST call)
      * can use to display a wait cursor or spinner
    * one to handle the successful completion of a REST call (resolved)
      * action can add data to the state
    * one to handle the unsuccessful completion of a REST call (rejected)
      * action can add an error message to the state
    * one to indicate that it is no longer doing something
      * can use to display a normal cursor or hide spinner
    * very simple to write and understand
    * perhaps don't need to test (could mock REST services)
  1.  actions are handled by "reducer" function
  * these take an object that hold ALL the current "state"
    and an action object
  * these return the new state
  * very simple to write, understand, and test

Using React with TypeScript

* create app by running
  `create-react-app {app-name} --scripts-version=react-scripts-ts`
  * creates source files with .ts or .tsx extension instead of .js
  * supports live reload just like with non-TypeScript apps
* JSX
  * source files that use JSX must have a .tsx file extension
* importing React
  * must use `import * as React from 'react';`
  * components should `extend React.Component`
* public methods like `render` must be marked as `public`
  * ex. `public render() { ... }`
* declaring component props

  * define an interface above the component definition
    * ex.
      interface Props {
      someProp: SomeType
      }
  * use this as the component type
    * ex. `class SomeComponent extends React.Component<Props> {`

* declaring component state

  * define an interface above the component definition
    * ex.
      ```js
      interface State {
        someState: SomeType;
      }
      ```
  * use this as the component type
    * ex. class SomeComponent extends React.Component<Props, State> {

* recommended tslint.json changes

  ```json
  "rules": {
    // Don't require interface names to begin with "I".
    "interface-name": [false]
  }
  ```

* recommended npm scripts to add
  "format": "prettier --write 'src/**/\*.{ts,tsx}'", // must "npm install -D prettier"
  "lint": "tslint 'src/**/\*.{ts,tsx}'",
  Also add scripts to support the use of Sass just like in other React apps.

* CORS
  * apps created with create-react-app can make REST calls
    to a server at a different domain without configuring CORS
  * ex. add `"proxy": "http://localhost:8080/",` to `package.json`
    and don't specify the domain in REST calls
    so they default to going to `http://localhost:3000`
