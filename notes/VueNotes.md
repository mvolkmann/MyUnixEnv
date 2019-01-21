# Vue Notes

## To install the Vue CLI

`npm install -g @vue/cli`

## To create a project

- approach #1: `vue create {project-name}`
  - Choose to use the default set of features (Babel and ESLint)
    or manually select features such as
    TypeScript, PWA support, Router, Vuex, CSS Pre-processors,
    Linter/Formatter, Unit Testing, and E2E Testing.
  - Choose between Yarn and npm.
- approach #2: `vue ui`\
  This launches a web UI where a new project can be configured.

## To add a plugin to an existing project

- `vue add {plugin-name}`
- ex. `vue add vuex`

## To build and run a project

- `cd {project-name}`
- `npm install`
- `npm run serve`
- browse localhost:8080
- This provides watch and live reload!

## Using VS Code

Install the extensions "Vetur" and "Vue.js Extension Pack".

## Customizing the generated app

Modify `src/App.vue` and `.vue` files under `src/components`.

## Vue Components

Vue components are rendered using a virtual DOM (like React)
to minimize the number of actual DOM updates that are performed.
They are automatically updated with their data changes.
This includes changes to the state in a VueX store if that is used.

## .vue Files

Typically each component is defined by a single source file
and the source file only defines one component.
These source files have a `.vue` extension.
Their content is valid HTML with the following layout:

```js
<template>
  HTML goes here.
  Can refer to Vue components.
  Can include HTML comments like <!-- comment -->.
</template>

<script>
  JavaScript goes here.
  Can import other component .vue files.
  Can export an "instance definition" object as the default export.
</script>

<style scoped>
  CSS rules go here.
  If style has the "scoped" attribute,
  this CSS only applies to this component.
</style>
```

The Webpack `vue-loader` processes these files.
The Vue CLI configures this by default.

## Component objects

The `.vue` file that defines a component typically has an
`export default` of an "instance definition" object
with the following properties.

- `el`\
  This is a CSS selector that specifies
  where this component should be rendered,
  typically only specified in top-level components.

- `name`\
  This is the component name.
  Does it become an id in the generated HTML that can be referenced in CSS?

- `components`\
  This lists other components used by this component inside curly braces.
  It is an object where keys are component names and values are components.
  With ES6 object shorthand, it can be written as `{Foo, Bar}`.
  It's a bummer that Vue requires listing all the components used in template!

- `props`\
   This is an object describing the props this component accepts.
  The keys are prop names and the values are their types.
  For example, `props: {name: String, age: Number}`.

  It can also be an array of just prop names,
  but that bypasses type checking and isn't recommended.

  When props are defined using an object,
  each prop value can be a type or an object
  with the properties `type`,
  `default` (must match the `type`),
  and `required` (boolean).

  Supported types include
  `Boolean`, `Number`, `String`, `Symbol`,
  `Date`, `Function`, `Object`, and `Array`.
  A custom class name can also be used.

  For more fine-grained validation, supply a `validator` method
  that returns true if the prop value is valid. For example:

  ```js
    validator(value) {
      return typeof(value) === 'object' && value.someRequiredProperty;
    }
  ```

  Prop values are passed in from parent components using attributes.
  They can be any kind of value, including functions
  defined in the parent component that the child component can call.
  When prop values change, the component is updated
  rather than creating a new instance.
  The `beforeUpdate` and `updated` lifecycle methods are invoked.

  Camel-cased prop names must be written in kebab-case in HTML.
  For example, the prop `fooBar` would be `foo-bar` in HTML.

- `computed`\
  This is an object describing props that are
  computed based on other props and data.

- `data`\
  This must be a function that returns data specific to a component instance.
  This allows each instance can maintain its own data.
  It is similar to "state" in React.
  If the `data` property is set to an object instead of a function,
  the following error will be output:
  "error: data property in component must be a function"

- `methods`\
  This is an object that defines the methods of this component.
  They are primarily used for event handling.
  Lifecycle methods are not defined here.
  The keyword "this" refers to a component instance in these methods.

Much of the data defined in the properties above
can be accessed in methods using the `this` keyword.
This includes `props`, `computed`, `data`, `methods`,
and lifecycle methods.
They can also be referenced by name without the `this` keyword
in template interpolations (double curly braces) and
directives (such as `v-bind` and `v-model`).

## Assets

Assets such as images, audio, and video typically reside in
`src/assets` and are accessed with URLs that start with `./assets/`.

## Templates

Templates hold the HTML that is rendered by a component.
They can contain Vue directives and
interpolations (in double curly braces) that insert dynamic data.

A component template is compiled into a render function
that is called to produce the DOM for the component.
It is also possible to omit the template
and manually write a `render` function.

Manually written `render` functions can use
the `createElement` function to produce DOM nodes.
This function is passed as the only argument to the `render` function.
`render` functions can also return JSX which is an XML format
that is syntactic sugar for calls to `createElement`.

The `createElement` function takes three arguments,
the element name, an object describing attributes,
and an array of child nodes.
Only the first argument is required.
If only two arguments are supplied,
the second is assumed to be an array of child nodes,
not the attributes.

For example:

```js
  render(createElement) {
    return createElement('h1', 'Hello from createElement!');
    // OR
    //return <h1>Hello from JSX!</h1>;
  },
```

## Inserting Template Text

To insert the value of a single JavaScript expression
that can use the values of props and data,
use interpolation via double curly braces.
For example, `{{expression}}`.

The expression can be any valid JavaScript expression
including a ternary or a function call.
It cannot be a JavaScript statement like
a variable declaration or `if` statement.

If the text contains HTML to be rendered, use
`<span v-html="prop-name"></span>`.
The HTML should not contain Vue directives
because those will not be processed.

## Template Directives

These directives can appear as HTML attributes in a component template.

### `v-bind` or shorthand `:`

This binds a prop value in the current component
to a prop of another component.
For example, `<input :checked="isChecked">`

### `v-if`, `v-else-if`, `v-else`

This provides conditional rendering.
For example:

```js
<div v-if="showColor">yellow</div>
<div v-else-if="showSize">medium</div>
<div v-else>unknown color and size</div>
```

An element that uses `v-else-if` must have
a preceding sibling that uses `v-if`.
An element that uses `v-else` must have
a preceding sibling that uses `v-if` or `v-else-if`.

### `v-for`

This provides iteration over array elements.
For example:

```js
<div v-for="color in colors" :key="color">{{color}}</div>
<div v-for="(color, index) in colors" :key="index">
  {{index + 1}}) {{color}}
</div>
```

Note that binding a value to the `key` prop is needed by Vue to
allow it to minimize the number of DOM updates required when data changes.

### `v-on:event-name` or shorthand `@event-name`

This is used to register event handling.
The value specified can be the name of a method or
a JavaScript statement such as a method call with arguments
or assigning a value to a data property.
For example, assuming `onDelete` is a component method:

```js
<button @click="onDelete">Delete</button> <!-- calls with no arguments -->
<button @click="add(5)">Add 5</button> <!-- calls with an argument -->
<input @keypress="processKey($event)" />> <!-- passes event object -->
<button @click="havePower = !havePower" />> <!-- assigns to data -->
```

Event modifiers can follow the event name. These include:

- `.prevent` to trigger event.preventDefault();
- `.stop` to trigger event.stopPropagation();
- `.once` to only process the first event
- `.self` to only process the event if it occurred
  on this element (at the target)
- `.capture` to only process the event if it
  did not occur at the target and occurred during the capture phase
- `.passive` to ignore certain events during scrolling
  to improve performance

For example:

```js
<button @click.stop.prevent="handleClick">Press Me</button>
```

Key modifiers check for common key codes. These include
`.enter`, `.tab`, `.delete`, `.esc`, `.space`,
`.up`, `.down`, `.left`, and `.right`.

System modifiers check for keys that can be
pressed in conjunction with another key
to change the meaning. These include
`.ctrl`, `.alt`, `.shift`, and `.meta`.
In macOS, `.meta` detects the command key.

For example:

```js
<input @keyPress.enter="handleEnterKey">
```

Mouse button modifiers check for presses of specific mouse buttons.
These include `.left`, `.right`, and `.middle`.

### `v-model`

This creates a two-way binding between
a form component value and a component prop.
It can be used in `<input>`, `<textarea>`, and `<select>` elements.
Recall that `<input>` elements can be used for
text, checkboxes, and radio buttons.

For example:

```js
<input v-model="firstName" />
```

For checkboxes, the `v-model` for multiple `<input>` elements
can be the same array. The checkbox values will be used
to populate the array when they are checked.

### `v-show`

This sets the value of the CSS `display` property for this element.

### Other Directives

`v-cloak`

This hides an element until all data it uses has been loaded to
avoid displaying unevaluated interpolations (double curly braces).
It also requires CSS changes.

`v-html`

This is used to render a string of HTML as HTML instead of plain text.
For example, `<span v-html="myHtml"></span>` where `myHtml`
is a prop or data value that is a string of HTML.

`v-once`

This causes the content of an element to be evaluated only once.
If data used in the content changes after the initial render,
the element will continue to render the same as the initial render.

`v-pre`

This skips all evaluation of element content
which allows rendering double curly braces.
It is useful for outputting Vue example code.

`v-text`

This is an alternative to using double curly braces
to output a data value. For example, these are equivalent:

```js
<span v-text="firstName"></span>
<span>{{firstName}}</span>
```

## JSX

Components can specify what to render using either a template or JSX.
To use JSX, omit the template and include a `render` method
at the top of the object that describes the component.
Use of JSX requires a Babel plugin.
Applications created by the Vue CLI have this configured by default.

For example:

```js
<script>
export default {
  name: 'Greeting',
  props: {
    name: {
      type: String,
      required: true
    }
  },
  render() {
    return <div class="greeting">Hello, {this.name}!</div>;
  }
};
</script>
```

This can also include a `<style>` element.
However, if no CSS is needed, the file extension can be changed to `.js`
and the `<script>` start and end tags can be removed.
This works because in this case the Vue build tooling is not needed.

Component methods can be called from inside curly braces,
but plain functions defined outside the component definition
cannot be called. See <https://github.com/elbywan/bosket/issues/23>.

Here's an example of a `render` method that returns JSX
that calls a method to get more JSX.

```js
  data() {
    return {
      colors: ['red', 'green', 'blue']
    };
  },
  render() {
    return <ul>{this.getItems()}</ul>;
  },
  methods: {
    getItems() {
      return this.colors.map(color => <li>{color}</li>);
    }
  },
```

## Lifecycle Methods

The following optional component methods will be automatically called
at specific points in the lifecycle of the component.
They are defined as top-level properties in an instance definition.

- `beforeCreate` and `created`
- `beforeMount` and `mounted`
- `beforeUpdate` and `updated`
- `beforeDestroy` and `destroyed`

Properties are not added to `this` yet in `beforeCreate`.

The most commonly used of these are `created` and `updated`.
These corresponds to the React lifecycle methods
`componentDidMount` and `componentDidUpdate`.

To verify what is on the instance object,
add the following to the instance definition object:

````js
  mounted() {
    console.log('{component-name}: this =', this);
  }

## Inserting Children

A custom component can insert child elements into its template
with `<slot></slot>`.

## Refs

Template elements can have a `ref` attribute
that allows component methods to get a reference to them.
This has many uses. One is to get a reference to an `input` element
so that focus can be moved to it. For example:

```js
<template>
  <div>
    <input v-model="name" type="text" ref="name"/>
  </div>
</template>

<script>
export default {
  // other component instance properties omitted
  data() {
    return {name: ''};
  }
  methods: {
    clearName() {
      this.name = '';
      this.$refs.name.focus();
    }
  }
}
</script>
````

## Using Sass

To use Sass syntax in the `<style>` element of a Vue component,
install some npm packages and
add a `lang` attribute to the `<style>` tag.

To install the npm packages, enter
`npm install -D sass-loader node-sass`.

Change the opening `style` tag to
`<style lang="scss" scope>`.

With this in place it is possible to
use all features of Sass including
variables, nested rules, and mixins.

## Vue Devtools

The Vue devtool can run as a Chrome extension,
a Firefox addon, or an Electron app.
See <https://github.com/vuejs/vue-devtools>.

This is only able to display information about Vue apps
that were not built for production, i.e. not minimized.

To use in Chrome, browsing a Vue app,
click the Vue icon near the upper-right of the window,
and open the devtools.
If the devtools are open before the Vue icon is clicked,
it is necessary to close the devtools and reopen them.

The "Components" tab supports navigating the component hierarchy.
Select a component to examine its props, computed props, and data.
Data values can be edited and the UI will update to show new values.

The "Vuex" tab supports examining the contents
of the Vuex store state, if Vuex is being used.
It also displays a list of committed mutations.
Click a mutation name to display the store state
after the mutation was processed.
To update the UI to match that state, click the
"Time Travel" link to the right of the mutation name.
Click "Base State" to display the initial store store.

## VueX

This is the most popular state management library for Vue.
It was developed by and is maintained by the Vue team.

To install it in a project, enter `npm install vuex`.

Create the file `src/store.js` and add the following:
At the top of the app, likely in `App.js`, add the following:

```js
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
```

The next step is to create the store
which can hold any number of pieces of state.
This defines the initial state and mutation methods that modify it.
Mutations are the only way to modify the state
and they must be synchronous methods.
They are not called directly and are instead invoked by calling
`this.$store.commit` which is described later.

Suppose we want to hold a year and an array of color names.

```js
export default new Vuex.Store({
  strict: true,
  state: {
    year: new Date().getFullYear(),
    colors: ['yellow', 'orange']
  },
  mutations: {
    setYear(state, year) {
      state.year = year;
    },
    clearColors(state) {
      state.colors = [];
    }
    appendColor(state, color) {
      // Note that state properties can be modified in mutation functions.
      // It is not necessary to treat the state object as immutable here.
      state.colors.push(color);
    }
  }
});
```

When `strict` is `true` an error is thrown
if the state is modified outside of a mutation.
This is very desirable!

Register the store with the top component.
This "injects" store access into all descendant components.
For example, this can be done in `src/App.js`:

```js
import store from './store';

export default {
  name: 'app',
  components: {
    ...components used by the App component are listed here...
  },
  store
};
```

Any component can now access the state with `this.$store.state`.
When many items are needed from the state,
it is convenient to use the `mapState` function
to make them accessible via computed properties.
The `mapState` function returns an object that
should be spread into the `computed` property.
For example:

```js
import {mapState} from 'vuex';

export default {
  name: 'SomeComponent',
  computed: {
    ...mapState({
      year: state => state.year,
      colors: state => state.colors
    })
    // can define additional computed properties here
  }
};
```

To trigger mutations from a component, call
`this.$store.commit(mutationName, arg)`.
For example, `this.$store.commit('appendColor', 'red');`
Only a single argument can follow the mutation name.
To supply more than one value, pass an array or object
containing all the values.
Any components that use the state affected by the mutation
will be updated.

Another option is to use `mapMutations` to generate methods
that make these calls for you.
This returns an object that should be spread into the "mutations" property.
For example:

```js
  methods: {
    ...mapMutations(['appendColor'])
  }
```

This allows the call to the `commit` method above
to be replaced by `this.appendColor('red');`.

Within a mutation there are two ways to update a state property.
For example, to change the foo.bar property to 'baz' we can use
`state.foo.bar = 'baz'` or `Vue.set(state.foo, 'bar', 'baz')`.
Why would the second form ever be preferred?

Getters can be defined in the store
to retrieve computed values. For example:

```js
getters: {
  uncompletedCount: state => state.todos.filter(t => !t.done).length;
}
```

To retrieve the value of this getter in a component,
use `$store.getters.uncompletedCount`.

Computed properties can be created inside a component
that map to getters so they can be referred to
with just computed property names.
The `mapGetters` function returns an object that
should be spread into the "computed" property.
For example:

```js
import {mapGetters} from 'vuex';

export default {
  ...
  computed: {
    ...mapGetters(['uncompletedCount', /* more getter names */]),
    // More computed properties can be defined here.
  }
```

Actions support asynchronous mutation commits
and triggering multiple commits.
See <https://vuex.vuejs.org/guide/actions.html>.

The Vuex store can be split into multiple "modules".
Each of these have their own state, getters, mutations, and actions.
Modules can be further divided into sub-modules.
This is a bad idea! Using a single store is far easier.

## Vue-Router

The vue-router library maps URLs to components and supports
navigation between "pages" using the `<router-link>` elements.
The current route can also be changed from JavaScript code
by calling `this.$router.go` or `this.$router.push`.
The current route is render in a `<router-view>` element
that is typically rendered by the top-most component.
For more detail, see <https://router.vuejs.org/guide/>.

## More on Vue CLI

## Comparison to React

In Vue components are defined by an object and
event handling is implemented with methods on that object.
There seems to be no way to use plain functions.
This is a major difference from React where components
and event handling can all be defined with plain functions.
A benefit of this is that React can be learned without
learning how classes and the keyword `this` work in JavaScript.

In React components can be defined by a plain function
as can event handling.
In the past React components usually were not
defined by a plain function because
a class was required to implement state and lifecycle methods.
With the introduction of hooks, that is no longer true.
So most React code will just use plain functions for everything.
This removes the need to understand the value of the `this` keyword
and how classes work.

## Easier to Learn

Many claim a benefit of Vue is that it is easier to learn than React's JSX.
This comes down to comparing the ways in which JSX differs from HTML
to the things that Vue adds to HTML.
Let's compare them point by point.

### Inserting Content

In React, the result of a JavaScript expression is
inserted into the DOM by enclosing it in curly braces.
For example, `{new Date().toString()}`

The Vue the same approach is used,
but with double curly braces.
For example, `{{new Date().toString()}}`

Evaluation: tie

### Changes in Attribute Names

In React JSX, some HTML attributes must be specified with
a different name because they are keywords in JavaScript.
The most common are `class` which must be specified as `className` and
`for` (often used on `label` elements) which must be specified as `htmlFor`.
Another difference is that event handling attributes
must be camel-cased. For example, `onclick` must be specified as `onClick`.
While these differences are an annoyance, when developers
forget to use the alternate names, React gives very clear error messages.

In Vue, event handling attributes are specified using
the `v-on` directive or its shorthand form `@`.
For example, instead of `onclick`, `v-on:click` or `@click` must be used.

Evaluation: small win for Vue

### Directives

Vue defines many directives that can be used in HTML.
Some of these support conditional logic and iteration.
Examples include `v-if` and `v-for`.

Vue also supports defining custom directives.
Use of these should probably be discouraged
since developers that are familiar with Vue
will not be familiar with custom directives
being used in an application that is new to them.

React relies on knowledge of JavaScript and the DOM
for implementing the same tasks.
JavaScript in curly braces is used for conditional logic and iteration.
Iteration is primarily achieved using the Array `map` method.

For developers that already have strong knowledge of JavaScript and the DOM,
Vue requires additional learning that is not required in React.

Evaluation: small win for React

### Overriding Component CSS

Parent components can override the CSS specified in child components
by simply using CSS selectors that have higher specificity.
The top element of component instances
are not assigned any id or class name by default.

Adding a class to the top element in component templates
is helpful in allowing ancestor components
to target child components in CSS selectors.

For example, suppose we have an `App` component
that renders a `TodoList` component
that renders `Todo` components.
If we add `class="todo-list"` and `class="todo"`
to the top elements of the `TodoList` and `Todo` components
then the `App` component can override the style for buttons
specified in the `Todo` component with the CSS selector
`.todo-list .todo button { ... }`

### Generated CSS

In React there are many approaches that can be used
to associate CSS with component elements.
There are several CSS-in-JS libraries that are popular.
Plain CSS and Sass can also be used.
An advantage of choosing Sass is that nested rules can be used
to scope CSS to the CSS class of the top element of each component.

In Vue, CSS for a component is typically specified
in the `.vue` source file for the component.
Each element is assigned a unique data attribute.
For example, `<button data-v-ee48fd14="">some text</button>`.
CSS for this button will have the selector `button[data-v-ee48fd14]`.
This is less readable than using
CSS class names selected by the developer.

Evaluation: win for React

### CLI Startup

In React applications created with create-react-app,
entering `npm start` starts a local HTTP server
opens a tab in the default web browser,
and runs the app.

In Vue applications created with the Vue CLI,
entering `npm run serve` starts a local HTTP server,
by it does not open a browser tab for the application.
That must be done manually.

Evaluation: win for React

## Unit Testing

Projects created with Vue CLI 3 do not support tests by default.
To get test support, select "Manually select features" instead of "default".
Then select "Unit Testing" and "E2E Testing".
For the "unit testing solution" choose between
"Mocha + Chai" and "Jest" (preferred).
For the "E2E testing solution" choose between
"Cypress" (preferred) and "Nightwatch (Selenium-based)".
Assuming that Jest and Cypress are selected,
this also installs @vue/test-utils,
@vue/cli-plugin-e2e-cypress (depends on cypress and more), and
@vue/cli-plugin-unit-jest (depends on jest and more).

To add the ability to run Jest and Cypress tests to an existing Vue project
that was created by the CLI, but without requesting use of Jest:

- `npm install @vue/test-utils`
- `npm install @vue/cli-plugin-e2e-cypress`
- `npm install @vue/cli-plugin-unit-jest`
- `npm install babel-core`
- `npm install babel-jest`
- `npm install eslint-plugin-jest`
- create `babel.config.js` file with the following content

  ```js
  module.exports = {
    presets: ['@vue/app']
  };
  ```

- edit `package.json`
  - add the following scripts
    - "test:e2e": "vue-cli-service test:e2e",
    - "test:unit": "vue-cli-service test:unit"
  - in the "env" object, add `"jest/globals": true,`
  - in the "eslintConfig" object,
    add `"plugins": ["jest"],`
  - add the following section

    ```js
      "jest": {
        "moduleFileExtensions": [
          "js",
          "jsx",
          "json",
          "vue"
        ],
        "transform": {
          "^.+\\.vue$": "vue-jest",
          ".+\\.(css|styl|less|sass|scss|svg|png|jpg|ttf|woff|woff2)$": "jest-transform-stub",
          "^.+\\.jsx?$": "babel-jest"
        },
        "moduleNameMapper": {
          "^@/(.*)$": "<rootDir>/src/$1"
        },
        "snapshotSerializers": [
          "jest-serializer-vue"
        ],
        "testMatch": [
          "**/tests/unit/**/*.spec.(js|jsx|ts|tsx)|**/__tests__/*.(js|jsx|ts|tsx)"
        ],
        "testURL": "http://localhost/"
      }
  ```

Unit test source files should be placed in directories below `tests/unit`
in files whose names end with `.spec.js`.

Jest test source files have the following structure:

```js
describe('some name', () => {
  it('something being tested', () => {
    expect(someResult).toBe(someExpectedValue);
  });
});
```

To run unit tests, enter `npm run test:unit`.
This is supposed to also support a `--watch` option,
but that seemed to broken the last time I tried to use it.
