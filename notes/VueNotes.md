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

The most common way to define a Vue component
is to create a file with a `.vue` extension.
The content of this file is:

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

## Component objects

The `.vue` file that defines a component typically has an
`export default` of an object with the following properties.

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
- `props`\
  This is an object describing the props this component accepts.
  The keys are prop names and the values are their types.
  For example, `props: {name: String, age: Number}`.
  Prop values are passed in from parent components using attributes.
  When their values change, the component is updated
  rather than creating a new instance.
  The `beforeUpdate` and `updated` lifecycle methods are invoked.
- `computed`\
  This is an object describing props that are
  computed based on other props and data.
- `data`\
  This is a function that returns data specific to a component instance.
  It is similar to "state" in React.
  If an object is specified instead of a function,
  all component instances will share that data.
- `methods`\
  This is an object that defines the methods of this component.
  They are primarily used for event handling.
  Lifecycle methods are not defined here.
  The keyword "this" refers to a component instance in these methods.

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

### `v-on:event-name` or shorthand `@event-name`

This is used to register an event handling method.
For example, assuming `onDelete` is a component method:

```js
<button @click="onDelete">Delete</button> <!-- calls with no arguments -->
<button @click="add(5)">Add 5</button> <!-- calls with an argument -->
<input @keypress="processKey($event)" />> <!-- passes event object -->
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

v-cloak
v-html
v-once
v-pre
v-text

## JSX

Components can specify what to render using either a template or JSX.
To use JSX, omit the template and include a `render` method
at the top of the object that describes the component.
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
cannot be called. See https://github.com/elbywan/bosket/issues/23.

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

The most commonly used of these are `created` and `updated`.
These corresponsd to the React lifecycle methods
`componentDidMount` and `componentDidUpdate`.

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

## Vue Devtool

The Vue devtool can run as a Chrome extension,
a Firefox addon, or an Electron app.
See https://github.com/vuejs/vue-devtools.

To use in Chrome, browsing a Vue app,
click the Vue icon near the upper-right of the window,
and open the devtools.
If the devtools are open before the Vue icon is clicked,
it is necessary to close the devtools and reopen them.

The "Components" tab supports navigating the component hierarchy.
Select a component to examine its props, computed props, and data.
Data values can be edited and the UI will update to show new values.

The "Vuex" tab supports examining the contents
of the Vuex store state.
It also displays a list of committed mutations.
Clicking a mutation displays the store state
after the mutation is processed.
Clicking "Base State" displays the initial store store.

It is aware of Vuex and can display the contents of the store.

## VueX

This is the most popular state management library for Vue.

To install it in a project, enter `npm install vuex`.

At the top of the app, likely in `App.js`, add the following:

```js
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
```

The next step is to create the store
which can hold any number of pieces of state.
Suppose we want to hold a year and an array of color names.

```js
const store = new Vuex.Store({
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
      state.colors = state.colors.concat(color);
    }
  }
});
```

When `strict` is `true` an error is thrown
if the state is modified outside of a mutation.
This is very desirable!

Register the store with the top component as follows:

```js
export default {
  name: 'app',
  components: {
    ...components used by the App component are listed here...
  },
  store
};
```

Any component can now access the state with `this.$store.state`.
When many things are needed from the state,
it is convenient to use the `mapState` function
to make them accessible via computed properties.
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
`this.$store.commit(mutationName, args)`.
For example, `this.$store.commit('appendColor', 'red');`

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
with just computed property names. For example:

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
See https://vuex.vuejs.org/guide/actions.html.

The Vuex store can be split into multiple "modules".
Each of these have their own state, getters, mutations, and actions.
Modules can be further divided into sub-modules.
This is a bad idea! Using a single store is far easier.

## More on Vue CLI

## Comparison to React

In Vue components are defined by an object and
event handling is implemented with methods on that object.
There seems to be no way to use plain functions.

In React components can be defined by a plain function
as can event handling.
In the past React components usually were not
defined by a plain function because
a class was required to implement state and lifecycle methods.
With the introduction of hooks, that is no longer true.
So most React code will just use plain functions for everything.
This removes the need to understand the value of the `this` keyword
and how classes work.

## Slots

What are these?
