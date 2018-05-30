# Comparison of Angular and React

## Syntax

* Angular created its own proprietary syntax ("directives" and "pipes")
  that is mixed into HTML to add things like
  conditional logic (ng-if), iteration (ng-repeat),
  dynamic attributes, event handling (ng-change and ng-click),
  and waiting for asynchronous data (async pipe).
* This is additional syntax that each new Angular developer must learn.
* React uses JSX (existed before React) which allows
  HTML to be specified inside JavaScript code.
  An advantage is that the full power of JavaScript
  can be used for dynamically generating HTML.
* There is much less to learn about JSX than Angular's directives and pipes.

## Complexity

* Angular apps typically makes heavy use of RxJS, ngrx/store, and Effects
  which introduce a lot of complexity.
* The complexity of the current UI code prevents many developers
  from being able to help with UI development
  because the learning curve is too high.

## RxJS

* RxJS is beneficial for data that is streaming,
  but REST calls that return JSON are not.
* It is much simpler to use Fetch API
  (which is natively supported in modern browsers)
  together with JavaScript async/await.
* Using RxJS for DOM event handling adds
  unnecessary complexity given that Angular
  already has good support for event handling.
* The primary reason to use RxJS Observables is to allow
  components to re-render when data they care about changes.
  React achieves this using prop changes, state changes, and Redux,
  so there is no need for Observables.

## Dependency Injected Services

* Angular uses dependency injection for services.
  This adds complexity and slows the build process.
* The benefits dependency injection adds over just using
  imported JavaScript functions is questionable.
* In React, services are just sets of imported functions.
  Dependency injection is not used.

## Modules

* JavaScript already has a "module" concept which is
  just a source file from which functions, classes,
  and variables can be imported.
* Angular adds a proprietary module concept that
  differs from JavaScript modules and adds complexity.
* It's not clear that Angular modules add any benefits.
* React just uses JavaScript modules.
* In Angular, a module imports all the components
  used by other components in the same module.
  Source files for components do not import the components they use.
  This means a developer cannot determine from looking at only the
  source file for a component where the components it uses are defined.

## Build Times

* Angular build times are much longer than React build times.
* This is at least partially due to its use of dependency injection.
* This negatively impacts iterative development.

## Code Sharing

* Angular libraries of components and services that are
  shared in places like npm must use the "Angular Package Format".
  This makes it more difficult to develop them.
* Sharing resuable components and services is much easier in React
  because all that is being shared is collections of functions and classes.

## Use of classes

* Typical Angular code makes far more use of classes
  than the JavaScript used in other frameworks.
* Other frameworks focus more on functional programming
  and use more plain functions.
* The benefits of functional programming are well-established and
  include ease of testing and ability to reason about the code.

## Debugging Local Libraries

* Frameworks other than Angular can use the `npm link` command
  to easily cause an application to use code in a local library
  instead of code downloaded from an npm repository.
* This greatly simplifies the debugging of library code.
* Due to the requirement to use the Angular Package Format,
  this approach does not work in Angular.

## CSS changes

* With live reload in Angular, CSS changes require a full page refresh.
* React is able to apply CSS changes to the current page
  without refreshing it which speeds up iterative development.

## Finding Developers

* It is becoming increasingly difficult to find Angular developers.
* It is easier to find React developers.

## Popularity

* A good site for learning about the popularity of
  JavaScript tools and frameworks is <https://stateofjs.com>.
* In the 2017 survey, the "Front-end" section shows that
  * 4,449 respondents said they have used Angular and would use it again.
  * 13,669 respondents said they have used React and would use it again.
  * 2,289 said they have used Angular and would not use it again.
  * 1,020 said they have used React and would not use it again.
