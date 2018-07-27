# Angular Notes

## Things I Don't Like

- complexity
  - Angular apps typically makes heavy use of
    RxJS, ngrx/store, and Effects which introduce
    a lot of complexity.
  - I believe the complexity of the current UI code
    is preventing many developers from
    being able to help with the development
    because the learning curve is too high.
- RxJS
  - Most Angular apps make heavy use of RxJS.
  - RxJS makes sense for data that is streaming,
    but REST calls that return JSON are not.
  - It would be much simpler to just use Fetch API
    (which is natively supported in modern browsers)
    together with JavaScript async/await.
  - Using RxJS for DOM event handling adds more
    unnecessary complexity when Angular already
    has good support for event handling.
  - The primary reason to use Observables is to allow components
    to re-render when data they care about changes.
    React achieves this using only Redux.
- proprietary syntax in HTML
  - Angular created its own proprietary syntax
    that is mixed into HTML to add things like
    conditional logic, iteration, dynamic attributes,
    and event handling. This is additional syntax
    that each new Angular developer must learn.
    React uses JSX which is more similar to HTML.
    It relies on JavaScript syntax instead of a
    proprietary syntax for conditional logic and iteration.
- dependency injected services
  - These add complexity and slow the build process.
  - The benefits they add over just using imported
    JavaScript functions is questionable.
  - React does not use dependency injection.
- modules
  - JavaScript already has a module concept which is
    just a source file from which functions, classes,
    and variables can be imported.
  - Angular modules add more complexity.
  - It's not clear that Angular modules add any benefits.
  - React just uses JavaScript modules.
- build times
  - Angular build times are much slower than React build times.
  - This negatively impacts iterative development.
- Angular Package Format
  - The requirement to use this with creating libraries
    of reusable components and services makes it
    more difficult to deploy and use them.
  - Sharing reusable components and services
    is much easier in React.
- use of classes
  - Typical Angular code makes far more use of classes
    than JavaScript used in other frameworks.
  - Other frameworks focus more on functional programming
    and use more plain functions.
  - The benefits of functional programming are well-established and
    include ease of testing and ability to reason about the code.
- reliance on TypeScript
  - don't always get new JavaScript features in a timely manner
    - ex. doesn't support object spread operator yet
- debugging local libraries
  - Other frameworks can use the `npm link` command to easily
    cause an application to use code in a local library
    instead of code downloaded from an npm repository.
  - This greatly simplifies the debugging of library code.
  - Due to the Angular Package Format,
    this approach does not work in Angular.
- CSS changes
  - With live reload in Angular, these require a full page refresh.
  - React is able to apply CSS changes to the current page
    without refreshing it which speeds up iterative development.
- finding developers
  - it is becoming increasingly difficult to find Angular developers
    while it is much easier to find React developers
- could still just Angular, but reduce the use of
  - modules
  - services
  - dependency injection
  - RxJS

## Popularity

A good site for learning about the popularity of
JavaScript tools and frameworks is <https://stateofjs.com>.
In the 2017 survey, the "Front-end" section shows
that 4,449 respondents said they have used Angular
and would use it again. For React the number is 13,669.
2,289 said they have used Angular and would not use it again.
For React the number is 1,020.

## Angular CLI

- `npm install -g @angular/cli`
- `ng new app-name`
  - generates a working project
  - sets up lots of tooling including
    linting, CSS preprocessing, and test runners
  - app deployment to GitHub Pages?
- `cd app-name`
  - run all the following commands from this directory
- `ng serve`
  - takes several minutes
  - browse localhost:4200
- `ng generate component {component-name}`
  - can abbreviate: `ng g c {component-name}`
  - to add to "declarations" in main module,
    include -m app.module.ts
- `ng generate service {service-name}`
  - can abbreviate: ng g s {service-name}
- `ng lint`
  - lints code
- `ng test`
  - runs unit tests
- `ng e2e`
  - runs end-to-end tests
- `ng build`
  - generates a production build
- `ng github-pages:deploy`
  - deploys to GitHub Pages

## Customizing

- index.html
  - body includes `<app-root>`
- src/app/app.component.ts
  - defines AppComponent which targets `<app-root>`
  - @Component annotation specifies the HTML and CSS files
    that this component uses
- component source file convention
  - component FooBar is defined by the files
    foo.bar.css, foo.bar.html, foo.bar.ts,
    foo.bar.spec.ts (tests), and foo.module.ts?
- properties defined in a component .js file
  can be accessed in the corresponding .html file
  by surrounding property names with double curly braces
  - ex. {{title}}
  - called "interpolation binding syntax"

## Custom Components

- to create, enter `ng generate component {name}`
  - the name should always start with a prefix followed by a hyphen
    to avoid conflicting with current and future HTML tag names
  - can be in any project directory, not just top
  - creates {name} directory under src/app containing
    `{name}.component.*` where `*` is
    css, html, spec.ts, and ts
  - the `.js` file exports the component class,
    but `export default` can be used so
    it can be imported without curly braces
  - adds an import for the new component
    in src/app/app.module.ts
    - because of this, components can use other components
      without importing them
  - also adds new Component to declarations array
    in the same file
- `.js` details
  - selector in @Component annotation specifies
    the element name, but not a CSS selector
    - can specific the same name as the class
      on the top element in the .html file
      and styling for that class in the .css file
  - define properties inside the class,
    typically before the constructor
    - ex. myProp = 'some value';
    - typically the constructor is only used for dependency injection
      and other setup logic is placed in `ngOnInit`
  - `ngOnInit` method is a lifecycle hook
    where initialization logic can be placed
    - called after constructor when all bindings are available
- to use the component in another, add an elements
  - ex. `<name></name>`

## Change Detection

- default change detection uses a monkey patched
  version of the DOM to detect changes
- by default checks the entire DOM tree for changes
  even if there is no indication that they have changed
  - checks all properties of all components for changes
    and re-renders if any have changed
  - could be slow for large UIs
- can be changed to "OnPush" for specific components
  and their descendants
  - will only check when new data is pushed to a component
    in order to improve performance

```js
import {
  ChangeDetectionStrategy,
  ChangeDetectorRef,
  Component
} from '@angular/core';
@Component({
  ...
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class MyComponent {
  constructor(private cd: ChangeDetectorRef) {}

  // When the component needs to be checked,
  // this.cd.markForCheck();
}
```

## Decorators

- a.k.a. annotations
- functions that add functionality to classes, methods, and properties

## DefinitelyTyped

- to update type definitions obtained from DefinitelyTyped
  for a given package, enter
  `npm install -D @types/{package-name}`

## Modules

- @NgModule annotation
  - declarations - list of view classes used by this module
  - imports - list of other modules used by this module
  - exports - list of modules that are provided to importers of this module
  - providers - list of services used by this module
  - bootstrap - only for top-level modules; defines the starting component

## Libraries

- to build a library with the Angular CLI

  - create a workspace for the library if one hasn't already been created
    - `ng new {workspace-name}`
      - ex. `ng new web-components`
      - takes several minutes
  - if the workspace already exists, make sure these files are writable
    - angular.json, package.json, tsconfig.json
  - create the library within the workspace
    - `cd {workspace-name}`
    - `ng generate library {library-name} --prefix={library-prefix}`
      - ex `ng generate library bio-common --prefix=bc`
  - implement the library
    - the simplest approach is to add methods to the `{library-name}.service.ts` file
      in the `{library-prefix}/projects/{library-name}/rc/lib` directory
    - ex.
      ```js
      joinList(arr, separator, transformFn) {
        return arr.map(transformFn).join(separator);
      }
      ```
    - can also copy existing source files into the `src/lib` directory
  - add dependencies
    - either `npm install` them or
      manually edit the `package.json` for the project and run `npm install`
  - add an export
    - edit `projects/{library-name}/src/public_api.ts` and add `export * from './lib/index';`
  - build the library
    - add an npm script to package.json for the workspace similar to this:
    ```json
    "build-{library-prefix}": "ng build --prod {library-name}",
    ```
  - use the library in the top-level app to test it

    - edit `src/app/app.module.ts`
      - add `import { {camel-library-name}Module } from '{library-name}`;
        - ex. `import { BioCommonModule } from 'bio-common'`;
      - in the imports array add `{camel-library-name}Module`
        - ex. `BioCommonModule`
    - edit `src/app/app.component.ts`
      - import the service
        - ex. `import { BioCommonService } from 'bio-common'`;
      - inject the service into the constructor
        - ex. `constructor(bioCommonService: BioCommonService) {`
      - use the library methods in the constructor
        - ex. `const result = bioCommonService.joinList([1, 2, 3], '-', n => n \* 2);
      - use `console.log` so the results can be verified
        - ex. console.log('result =', result);

  - test it

    - from the top workspace directory enter `ng serve`
    - browse localhost:4200
    - verify the expected output in devtools console

  - publish the library

    - add the following to `projects/bio-common/package.json`
      ```json
      "publishConfig": {
        "registry": "{url-of-private-npm-repository}"
      }
      ```
    - add the following npm scripts to the top-level `package.json` file
      - `"build-bc": "ng build --prod bio-common",`
      - `"pack-bc": "cd dist/bio-common && npm pack",`
      - `"package-bc": "npm run build-bc && npm run pack-bc",`
      - `"publish-bc": "npm run package-bc && cd dist/bio-common && npm publish",`
    - build, package, and publish the library by running `npm run publish-bc`
    - after building a project, if another project in the same workspace uses it
      - `cd dist`
      - `npm install`
      - this fixed issues in bio-common when building bio-kendo-ui-jquery!

  - common errors
    - "Property 'finally' does not exist on type `Promise<any>`"
      - The Promise finally method is currently a stage 4 ECMAScript proposal.
      - Major browser except for IE already support it.
      - TypeScript does not recognize it and I haven't found a polyfill for it.
      - For now, add `// @ts-ignore` before lines that use it
    - "angular dependency {some-name} must be explicitly whitelisted"
      - fixed by added the following to `ng-package.json` and `ng-package.prod.json`
      ```json
      "whitelistedNonPeerDependencies": {
        "{some-name}"
      }
      ```
      - Is this stupid? Yes it is!

- to publish the library to an npm repository

  - `cd dist/math`

  - if publishing to a private repository
    add the following to package.json in this directory

    ```json
    "publishConfig": {
      "registry": {
        "the registry URL goes here"
      }
    }
    ```

  - `npm publish`

- to use a library in an app

  - cd to top application directory
  - `npm install math`
  - modify source files use the library

    - in src/app/app.component.ts

      ```js
      import {add} from 'math';
      // inside class AppComponent
      sum = add(1, 2);
      ```

    - in src/app/app.component.html

      ```html
      <div>sum = {{ sum }}</div>
      ```

## REST Calls

- see javascript/Angular/rest-demo project on your Mac laptop
- it uses the HttpClient module

## Components

- three parts: ES6 class, template, CSS files
- properties and methods in the class are available in the template
- providers (a.k.a. services) are injected in the constructor
  - usually as "private" parameters
  - ex constructor(private myService: MyService) {}
  - dependency injection makes it easy to mock them out in tests
- the component lifecycle is exposed through methods
  described by interfaces that the component class implements
  - OnInit interface describes ngOnInit method
  - see "Lifecycle Hooks" for others
- templates are HTML that typically contains binding expressions
  - don't need a root element
- CSS for a component is scoped to that component
- @Component annotation specifies
  - selector: tag name for the component
  - templateUrl: path to template HTML file
    - or template for inline HTML
      - typically only used for 10 or less lines of HTML
  - styleUrls: array of paths to CSS files
    - also "styles" for specifying inline
    - styles are scoped to this component
    - cannot style ancestor or descendant components
      - modify src/styles.css to do that
  - animations
  - others?
- other component annotations
  - @Input marks a property as read-only
    - value is supplied, but can't be modified
    - are only properties with @Input allowed as
      attributes on the selector in HTML?
  - @Output marks a property as modifiable
    - value is not supplied, but can be modified
  - OTHERS???

## Template Binding Syntax

- `{{expression}}` - class to template
  - are only properties allowed here
    including things like user.address.zip?
- `[property]="value"` - class to template
  - there are three special cases of properties
    attr.name, class.name, and style.name
  - ex. `<div [style.color]="myColor">`
    where myColor is a component property
  - Does this work?
    - `<div [style]="myStyle">` where myStyle is an object
- (event)="handler" - template to class
  - ex. (click)="handleClick()"
  - can pass arguments
  - to pass the event object, use $event
- `[(ngModel)]="property"` - two-way binding

  - typically used on form elements
  - syntax is called "banana in a box"
  - ex. <input [(ngModel)]="hero.name">
  - requires `FormsModule` which should be imported in `app.module.ts`

  ```js
  import {FormsModule} from '@angular/forms';
  ```

  - also add to `imports` array in same file

  ```js
  imports: [BrowserModule, FormsModule],
  ```

- OTHERS???
- private variables (ref variables) are defined with
  a # in front of name and references with just the name
  - one use is getting a reference to a form DOM element
    - ex. <form #myForm="ngForm">
- safe navigation operator
  - to reference a property that may not be set yet
  - ex. person?.address?.zip
- debugging tips
  - to dump JSON for an object or array to the page
    `{{someProperty | json}}`

## Directives

- like a component with no template; behavior only
- implemented by an ES6 class with an @Directive annotation
- structural directives add/remove DOM elements
  - convention is to start name with an asterisk
  - conditionally including an element
    `<div *ngIf="thing">{{thing}}</div>`
    - only renders if component property "thing" is truthy
    - can include an "else" followed by another property in curly braces
      `<div *ngIf="thing">{{thing; else prompt}}</div>`
  - iterating over an array
    ```html
    <div
      *ngFor="let person of people"
      (click)="selectPerson(person)"
    >
      {{person.name}}
    </div>
    ```
  - choosing from a set of elements
    ```html
    <div [ngSwitch]="size">
      <div *ngSwitchCase="'S'">Small</div>
      <div *ngSwitchCase="'M'">Medium</div>
      <div *ngSwitchCase="'L'">Large</div>
      <div *ngSwitchDefault>invalid size</div>
    </div>
    ```
  - same using template instead of ngSwitch (not preferred)
    ```html
    <template [ngSwitchCase]="'S'"><div>Small</div></template>
    <template [ngSwitchCase]="'M'"><div>Medium</div></template>
    <template [ngSwitchCase]="'L'"><div>Large</div></template>
    <template ngSwitchDefault><div>invalid size</div></template>
    ```
- `<ng-template #name>...contents</ng-template>`
  - defines some content, but doesn't render it
  - using {{name}} elsewhere renders it
  - ng-template names are sometimes used for \*ngIf else values

## Lifecycle Hooks

- component class should implement the corresponding interfaces
  - interface name matches lifecycle method name with "ng" removed
  - ex. class MyComponent implements OnInit
- most commonly used hooks
  - ngOnInit - after first call to ngOnChanges
    - so initial state is known
    - often used to load data via REST calls
- less commonly used hooks
  - ngOnDestroy - before the directive is destroyed
    - is a "directive" an instance of a component?
  - ngOnChanges - when an input or output binding value changes
  - ngDoCheck - for custom change detection
  - ngAfterContentInit - after content is initialized
  - ngAfterContentChecked - after every check of content
  - ngAfterViewInit - after views are initialized
  - ngAfterViewChecked - after every check of a view

## File Naming Convention

- modules - name.module.ts
- components - name.component.{css,html,ts,spec.ts}
- services - name.service.(ts,spec.ts)
- models - name.model.ts
  - for custom types used in multiple source files
- index.html
  - renders `<app-root>`
  - top component should have "app-root" as its @Component selector

## Routes

- maps URL paths to components using an array of objects
  that have "path", "component", and other properties
- can use the "routerLink" directive to navigate to a route

  - uses history.pushState so must set "base-ref" in index.html
    - handled by Angular CLI

- typically defined in app-routing.module.ts
- ex.

  ```js
  import {Routes, RouterModule} from '@angular/router';
  const routes: Routes = [
    {path: '': component: MyDefaultComponent},
    {path: 'foo': component: FooComponent}
    {path: '**': component: WildComponent}
  ];
  @NgModule({
    imports: [
      RouterModule.forRoot(routes, {enableTracing: true}) // for debugging
    ],
    exports: [RouterModule],
    providers: []
  })
  export class AppRoutingModule {
  }
  ```

- order of paths matters because first match wins
- paths can include :name for path parameters
- path '' only matches an empty path
- path '\*\*' is a wildcard that matches any unspecified path
- other route properties include
  - data - makes specified data available to the route component
  - icon - ?
  - label - ?
  - redirect - redirects to another path in the list
  - pathMatch - required with redirect paths
    - use 'full' if full URL must match
    - use 'prefix' if only the beginning of the URL must match
- can route objects have arbitrary properties that are
  made available to the component that is rendered?
  - maybe that is what "icon" and "label" are in an example you saw
- `<router-outlet>` marks a spot in HTML where route components are rendered

## Template-driven Forms

- FormsModule
  - import {FormsModule} from '@angular/forms';
- FormControl
  - tracks form validity and form element values
    - for example, an input with the "required" attribute
      is not valid if it is empty
    - form elements must have a "name" attribute
      in order for validation to work
  - to get a reference to it, <form #myForm="ngForm">
    - myForm will be a property whose value is an object
    - the value properties is an object
      that holds the values of all form elements
      keyed on their name attribute values
      - can output on page with
        `<pre>{{myForm.value | json}}</pre>`
      - but why not just access values using
        the associated ngModel properties?
    - the valid property is a boolean that indicates
      whether all the form elements are valid
  - to have a button that is disabled when the form is invalid,
    <button [disabled]="!myForm.valid">Save</button>
  - validation attributes
    - min, max, and step - for input types that accept numbers
      - includes number, range, date, month, week, time, ...
    - minlength and maxlength - for input types that accept text
      - includes text, password, email, search, tel, and url
    - pattern - a regular expression
    - required
  - custom validators can be implemented, but it looks messy
  - CSS classes are automatically added to form elements
    - ng-empty and ng-not-empty
    - ng-valid and ng-invalid
    - ng-pristine means user never changed value
    - ng-touched means has received focus
    - ng-untouched means never received focus
- FormGroup
  - a group of FormControls

## Custom Events

- seems too complicated
  - React apps would do this by having parent components
    pass functions to child components that they can call
    when certain events occur
- ex.

```js
// Child component
import {Component, EventEmitter, Output} from '@angular/core';
@Component({
  selector: 'child-component',
  template: `<button (click)="greet()">Greet Me</button>`
})
export class MyComponent {
  @Output() greeter = new EventEmitter();
  greet() {
    this.greeter.emit('Hello, World!');
  }
}

// Parent component
@Component({
  selector: 'parent-component',
  template: `
    <div>
      <h1?{{greeting}}</h1>
      <child-component (greeter)="greet($event)"></child-component>
    </div>
  `
})
export class ParentComponent {
  private greeting;

  greet(event) {
    this.greeting = event;
  }
}
```

## Styling

- styles in component-specific .css files
  are private to that component
- app-wide styles should be defined in src/styles.js

## Linting

- the command "ng lint" uses tslint

## Formatting

- can use Prettier
- to install, "npm install -D prettier"
- to configure, create `.prettier` file in top project directory
  - ex.
    ```json
    {
      "bracketSpacing": false,
      "singleQuote": true
    }
    ```
- to use as an npm script, add this to package.json

  ```json
  "format": "prettier --write 'src/&ast;&ast;/&ast;.{css,js,ts}'",
  ```

## Pipes

- used in interpolation bindings {{ }}
- ex. {{hero.name | uppercase}}
  - refers to the builtin pipe UppercasePipe
- documentation on the builtin pipes is at
  <https://angular.io/api?type=pipe>
- the builtin pipes include
  async, currency, date, decimal, i18nPlural, i18nSelect,
  json, lowercase, percent, slice, titlecase, and uppercase
- many pipes accept parameters that are specified by
  following the pipe name with a colon and a value
  - ex. {{amount | currency:'CAD'}}
- custom pipes can be defined
- async pipe
  - extracts the value of an Observable inside HTML
  - ex. {{myObservable$ | async}}
  - ex. with ngFor
    \*ngFor="let user of users$ | async"
  - automatically unsubscribes from the `Observable`
    if the component is removed from the DOM
    and resubscribes if it is inserted again later
    - a primary benefit over just directly subscribing in code
      and setting a "normal" property on changes
      rather than an `Observable` property
  - if the `Observable` value is an object,
    can get a specific property with
    {{(myObservable$ | async)?.someProperty}}

## Computed Attributes

- to add an attribute to an HTML element with a computed value,
  including just the value of a component property,
  use square brackets
- ex. [src]="imageUrl"
- ex. [class.selected]="hero === selectedHero"
  - conditionally adds a class attribute with the value "selected"
    if the condition after the = is true

## Property Binding

- uses the same syntax as computed attributes to
  pass property values to other components from HTML templates
  - ex. <app-hero-detail [hero]="selectedHero"></app-hero-detail>
- only a one-way binding

## Event Handling

- specified on HTML elements with attributes in parentheses
  - ex. (click)="onClick(someObj)"
  - `onClick` must be a method defined in the component .ts file

## Input Properties

- properties of a component whose value will be supplied
  by other components use that component
- must be annotated with @Input
  which must be imported from @angular/core
- ex. @Input() hero: Hero;
- other components use this one with
  `<foo-bar hero="someHero"></foo-bar>`

## Services

- an ES6 class that encapsulates business logic like REST calls
- a better place to fetch data than in components
- must import and include in providers array of a module
- typically supplied to components using dependency injection
- to create a new service, enter
  `ng generate service {name} --module=app`
  - generates `{name}.service.ts` and `{name}.service.spec.ts`
    files in the `app` directory
  - specifying `--module=app` causes it to add the new service
    to the `providers` array in `app.module.ts`
- services listed in the `providers` array have a
  single, shared instance that is used by all classes
- `@Injectable()` decorator specifies that
  data can be injected into the service
- to inject a service into a component,
  add it as a constructor parameter
  - ex. `constructor(private heroService: HeroService) {}`
  - adds `heroService` as a private property of the component
- a common place to call service methods is in
  the `ngOnInit` lifecycle method
  - ex. `this.heroes = this.heroService.getHeroes();`
- a service can be used by other services and components
  - import and include via constructor dependency injection
  - can inject any number of services in the constructor
- usually preceded by @Injectable()
  - generates metadata
  - allows other services and classes to use it via dependency injection
- ex.

  ```js
  import {Injectable} from '@angular/core';
  import 'rxjs/add/operator/map';
  import 'rxjs/add/operator/toPromise';
  // Can this be used instead of the previous two lines?
  //import {map, toPromise} from 'rxjs/add/operator';

  @Injectable()
  export class MyService {
    constructor(private http: Http) {} // dependency injection
    loadItems() {
      return this.http.get(someUrl)
        .map(res => res.json)
        .toPromise();
    }
  }
  ```

## Observables

- supported by RxJS
- HttpClient methods return an `Observable`
- can simulate anything being observable using the `of` function
- to use this add:

  ```js
  import {Observable} from 'rxjs/Observable';
  import {of} from 'rxjs/observable/of';
  ```

- in methods that return an `Observable`
  make the return type be `Observable<SomeReturnType>` and
  return the result of passing a value to the `of` function
- to subscribe to an observable and receive updates,
  call the `subscribe` method
  - ex. `this.heroService.getHeroes().subscribe(h => this.heroes = h);`
- if services are injected into another service
  that is injected into a component,
  the methods in all the services will be available
  in the component as if they were all methods
  on the service explicitly injected in the component
  - sounds like an opportunity for name collisions
- service properties that must be accessed in HTML property bindings
  must be public

## Routing

- in "Tour of Heroes" app see
  - routing.module.ts
    - see routes array
    - see imports and exports of the module
  - app.component.html
    - adds a `<nav>` that includes
      `<a routerLink="{path}}>{link-text}</a>`
    - include names preceded by colons in path
      for path parameters
    - uses `<router-outlet>`
- define routes in a new module
  - ex.
    ```js
    const routes: Routes = [
      // default route follows
      {path: '', redirectTo: '/dashboard', pathMatch: 'full'},
      {path: 'dashboard', component: DashboardComponent},
      {path: 'detail/:id', component: HeroDetailComponent},
      {path: 'heroes', component: HeroesComponent}
    ];
    ```
- to get path parameters in a rendered component

  ```js
  constructor(
    private route: ActivatedRoute
  ) {}

  // In some method ...
  const name = this.route.snapshot.paramMap.get('name');
  const id = Number(this.route.snapshot.paramMap.get('id'));
  ```

## REST calls

- in `app.module.ts`

  ```js
  import {HttpClientModule} from '@angular/common/http';

  @NgModule({
    ...
    imports: [..., HttpClientModule],
    ...
  })
  ```

## ngrx/store

- to install, npm install @ngrx/store
- to use redux devtool in Chrome
  - npm install @ngrx/store-devtools
  - add this import in app.module.ts
    ```js
    import {StoreDevtoolsModule} from '@ngrx/store-devtools';
    ```
  - add this to imports array in app.module.ts
    ```js
    StoreDevtoolsModule.instrument({
      logOnly: environment.production,
      maxAge: 25 // # of states to retain
    });
    ```
- implement a reducer function in src/app/reducer.ts
- modify src/app/app.module.ts
  - add imports
    ```js
    import {StoreModule} from '@ngrx/store';
    import {reducer} from './reducer';
    ```
  - add to array of imports
    ```js
    StoreModule.forRoot({hello: reducer});
    ```
- to subscribe to store changes in a component

  - inject the store into the constructor and
    create an `Observable` to a store path

    - ex.

    ```js
    export class MyComponent {
      color$: Observable<string>;
      constructor(private store: Store<AppState>) {
        this.color$ = store.select('kite', 'color');
      }
      ...
    }
    ```

  - use the `async` pipe in HTML to get `Observable` values
    - render example: `<div>{{color$ | async}}</div>`
    - passing example: <foo-bar [color]="color | async"></foo-bar>

## CLI

- ng build

  - all builds bundle files
  - artifact files are placed in dist directory
  - artifact files are deleted when the build completes?
  - build details for a project can be configured in .angular-cli.json
  - CSS is inlined if less that 10KB
  - the primary files produced are index.html and main.bundle.js
  - bundle .js files
    - main.bundle.js
      - contains your code
    - inline.bundle.js
      - contains a webpack loader
    - polyfills.bundle.js
      - contains polyfill code you reference in polyfills.ts
      - looks like developers are responsible for determining what polyfills they need
        rather than having a tool like babel-preset-env figure it out for them
    - scripts.bundle.js
      - contains scripts you declare in the scripts section of .angular-cli.json
      - at BMX, this includes jQuery and Kendo UI components
      - why aren't these pulled in where needed with ES6 imports?
    - vendor.bundle.js
      - only generated in dev mode
      - contains Angular libraries and code your code imports

- ng serve

  - builds application and starts a local web server

## .angular-cli.json

- configures options for the Angular CLI commands

## tsconfig.json

- configures TypeScript options for a project

## tslint

- primary linting tool for TypeScript code
- rules are configured in tslint.json

## for automatic, quick rebuilds after changes

- add npm script like the following
  (works in flex-prep-vitek/3_0_0/web-cassette)
  "watch": "ng build --no-progress --watch
  - try modifying text in
    summary-table/summary-table-view.component.html

## to use Browsersync for live reload

- npm install -g browser-sync
- create and run a script that does this:
  browser-sync start --browser Chrome --proxy 'localhost:8080' \
   --files 'dist/index.html' 'dist/main.bundle.js'

## to use React components in Angular

- see training/React/keynote/ReactInAngular.key
