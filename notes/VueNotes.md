# Vue Notes

Vue is a web application framework that competes
with other frameworks such as React and Angular.

TODO: Add screenshots to some sections.

## Simplest Example

This example gets the Vue library from a CDN,
doesn't define any components, and
illustrates a few basic Vue concepts.
These include:

- targeting an HTML element by its id (`el` property)
- storing mutable data (`data` property)
- defining computed properties (`computed` property)
- two-way data binding (`v-model` prop)
- template interpolation (in double curly braces)

```html
<html>
  <head>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script>
      window.onload = function() {
        new Vue({
          el: '#app', // matches div id in body
          data() {
            // "name" is used in computed message and v-model of the input.
            return {name: 'World'};
          },
          computed: {
            message() {
              return 'Hello, ' + this.name + '!';
            }
          }
        });
      };
    </script>
  </head>
  <body>
    <div id="app">
      <div>
        <label>Name</label>
        <!-- The input uses 2-way data binding. -->
        <input v-model="name" />
      </div>
      <div>{{ message }}</div>
    </div>
  </body>
</html>
```

## Defining Components with `createElement`

Vue components have a `render` method that determines
the DOM nodes to produce. This can be done using
the `createElement` function or JSX.
JSX is an XML syntax that is very similar to HTML.
But using JSX requires tooling.
For now let's see one more example that requires no tooling.

```html
TODO: Provide this!
```

The previous approaches are fine for a demonstrations,
but real web applications define many components
and use tooling to transform source files
into the final code that is served to the browser.

## Getting Real

The easiest way to start a new Vue application is to
create the initial configuration using the Vue CLI

To install it, enter `npm install -g @vue/cli`.

Then create a project using one of the following approaches.

### Approach #1

Enter `vue create {project-name}`.
This will prompt for options.
Choose to use the default set of features (Babel and ESLint)
or manually select features such as
TypeScript, PWA support, Router, Vuex, CSS Pre-processors,
Linter/Formatter, Unit Testing, and E2E Testing.
Choose between using Yarn or npm.

The `vue create` command can also be used to merge features into an existing project.
From the parent directory of the project, enter `vue create {project-name}`
and select "Merge".
Select the features to add.

### Approach #2

Enter `vue ui`.
This launches a web UI where a new project can be configured.

## Plugins

Plugins add functionality to a project.
To add a plugin to an existing project,
cd to the project directory and enter `vue add {plugin-name}`.
For example, `vue add vuex`.

To find additional plugins, search on npmjs.org for
pages whose names contain "vue" and "cli-plugin".
These include apollo, e2e-cypress, markdown, storybook, and @vue/cli-plugin-unit-jest.

## Building and Running

To build and run a project, cd to the project directory
and enter `npm install` and `npm run serve`.
By default this starts a local HTTP server that listens on port 8080.
It does not automatically open a tab for the app in the default browser.
Browse localhost:8080 to see the app.

This provides watch and live reload.
Sometimes after saving a change it takes
a few seconds for the browser to update.

## Vue Devtools

The Vue devtool can run as a Chrome extension,
a Firefox addon, or an Electron app.
See <https://github.com/vuejs/vue-devtools>.

It displays information about Vue apps that were
not built for production, i.e. not minimized.

To use in Chrome, browsing a Vue app,
click the Vue icon near the upper-right of the window,
and open the devtools.
If the devtools are open before the Vue icon is clicked,
it is necessary to close the devtools and reopen them.

The "Components" tab supports navigating the component hierarchy.
Select a component to examine its props, computed props, and data.
Data values can be edited and the UI will update to show new values.
Prop values cannot be edited.

If Vuex is being used, the "Vuex" tab supports
examining the contents of the Vuex store state.
It also displays a list of committed mutations.
Click a mutation name to display the store state
after the mutation was processed.
To update the UI to match that state, click the
"Time Travel" link to the right of the mutation name.
Click "Base State" to display the initial store state.

## VS Code

When using VS Code to edit Vue code it is helpful to install
the extension "Vue.js Extension Pack".
This includes several other extensions including
vetur, vue-peek, ESLint, Prettier, and more.
The vetur extension provides syntax highlighting,
snippets, auto-completion, and more.
See <https://marketplace.visualstudio.com/items?itemName=mubaidr.vuejs-extension-pack>
for details.

## Customizing the Generated App

To customize the app generated by the Vue CLI,
begin by modifying `src/App.vue` and
the `.vue` files under `src/components`.

## Vue Components

Vue components are rendered using a virtual DOM (like React)
to minimize the number of actual DOM updates that are performed.
They are automatically updated when their data changes.
This includes changes to the state in a Vuex store if that is used.

## .vue Files

Typically each component is defined by a single source file
and the source file defines a single component.
These source files have a `.vue` extension.

These files require tooling to convert their content to JavaScript.
This is provided by the vue-loader webpack loader.

These files are valid HTML and have the following layout:

```js
<template>
  HTML goes here.
  This can use other Vue components.
  It can include HTML comments
  with the syntax <!-- comment -->.
</template>

<script>
  JavaScript goes here.
  This can import other component .vue and .js files.
  It is not necessary to include the file extension.
  It should export an "instance definition" object
  as the default export.
</script>

<style scoped>
  CSS rules go here.
  If style element has the "scoped" attribute,
  the CSS will only apply to this component.
</style>
```

The Webpack `vue-loader` processes `.vue` files.
The Vue CLI configures this by default.

## Component Objects

The `.vue` file that defines a component typically contains
an `export default` of an "instance definition" object
with the following properties:

- `el`\
  The value of this property is a CSS selector that
  specifies where this component should be rendered.
  It is typically only specified in top-level components.

  An alternate way to specify where the top component
  should be rendered is to create a new `Vue` object
  and call the `$mount` method on it.
  The `main.js` file in apps generated by the Vue CLI
  uses this approach.

- `name`\
  This is the component name.
  Typically this matches the source file name,
  but this is not required.

- `components`\
  This lists other components used by this component.
  The value is an object where keys are component names and values are components.
  If the components used are `Foo` and `Bar`,
  it can be written as `{Foo: Foo, Bar: Bar}`
  or, with ES6 object shorthand, just `{Foo, Bar}`.
  The ability the choose the names by which components will be referenced
  is important when there are name conflicts because it allows
  use of multiple components that happen to have the same name.

- `props`\
  This is an object or array describing the props this component accepts.

  When the value is an object,
  the keys are prop names and the values
  are either a type or another object
  with the properties `type`,
  `default` (must match the `type`),
  and `required` (boolean).
  For example, `props: {age: Number, name: String}` or

  ```js
  props: {
    name: {
      type: String,
      required: true
    },
    age: {
      type: Number,
      default: 0
    }
  ```

  When the value is an array, the values are just prop names.
  This bypasses type checking and isn't recommended.

  Supported types include
  `Boolean`, `Number`, `String`, `Symbol`,
  `Date`, `Function`, `Object`, and `Array`.
  A custom class name can also be used.

  For more fine-grained validation, supply a `validator` method
  that returns true if the prop value is valid. For example:

  ```js
    validator(value) {
      return typeof value === 'object' && value.someRequiredProperty;
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
  The object defines methods whose names are prop names.
  The methods return value of their prop.
  For example:

  ```js
  computed: {
    fullName() {
      return this.firstName + ' ' + this.lastName;
    }

    // This works, but is too verbose.
    //fullName: function () {
    //  return this.firstName + ' ' + this.lastName;
    //}

    // This does not work!
    //fullName: () => this.firstName + ' ' + this.lastName
  }
  ```

- `data`\
  This must be a function that returns an object
  containing data specific to a component instance.
  It allows each instance can maintain its own data
  and is similar to "state" in React.

  The keys are data names and the values are
  their initial values which can be changed later.
  The keyword `this` is used to in component methods
  to get and set these values.

  If this is set to an object instead of a function,
  the following error will be output:
  "error: data property in component must be a function"

- `methods`\
  This is an object that defines the component methods.
  They are primarily used for event handling.
  The keyword "this" refers to a component instance in these methods.

  Lifecycle methods are defined at the top of
  the instance definition object, not defined here.

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
They must contain a single root element
that contains all the other elements.
They can use Vue directives and interpolations that insert dynamic data.
Each interpolation is a pair of double curly braces
containing a single JavaScript expression.
For example, `{{ new Date().toString() }}`.

Component methods can be called from inside these curly braces,
but plain functions defined outside the component definition
cannot be called. See <https://github.com/elbywan/bosket/issues/23>.

A component template is compiled into a `render` function
that is called to produce the DOM for the component.
It is also possible to omit the template
and manually write a `render` function.

Manually written `render` functions can use
the `createElement` function to produce DOM nodes.
This function is passed as the only argument to the `render` function.
`render` functions can also return JSX which is an XML format
that is syntactic sugar for calls to `createElement`.

The `createElement` function takes three arguments,
the element name, an object describing its attributes,
and an array of child nodes.
Only the first argument is required.
If only two arguments are supplied,
the second is assumed to be an array of child nodes,
not the attributes.

For example:

```js
  render(createElement) {
    return createElement('h1', 'Hello from createElement!');
    // or alternatively
    //return <h1>Hello from JSX!</h1>;
  },
```

## Inserting Template Text

To insert the value of a single JavaScript expression
use interpolation via double curly braces.
For example, `{{expression}}`.

The expression can be any valid JavaScript expression
including a ternary or a function call.
It can access instance props and data, and can call component methods.
It cannot be a JavaScript statement such as
a variable declaration or `if` statement.

## Template Directives

Template directives appear as HTML attributes in a component template.
Each of the builtin template directives are described below.
It is also possible to define custom directives.

### `v-bind` or shorthand `:`

This binds a prop value in the current component instance
to a prop of another component or HTML element.
For example, `<input v-bind:checked="isChecked">`
or `<input :checked="isChecked">`.

### `v-if`, `v-else-if`, `v-else`

These provides conditional rendering.
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

Note that binding a value to the `key` prop is required to allow Vue
to minimize the number of DOM updates performed when data changes.

### `v-on:event-name` or shorthand `@event-name`

This registers event handling for a specific event.
The value specified can be the name of a method or
a JavaScript statement such as a method call with arguments
or assigning a value to a data property.
For example, assuming `delete`, `add`, and `processKey`
are component methods and `havePower` is a data property:

```js
<button @click="onDelete">Delete</button> <!-- calls with no arguments -->
<button @click="add(5)">Add 5</button> <!-- calls with an argument -->
<input @keypress="processKey($event)" />> <!-- passes event object -->
<button @click="havePower = !havePower" />> <!-- assigns to data -->
```

Event modifiers can follow the event name. These include:

- `.prevent` to trigger event.preventDefault()
- `.stop` to trigger event.stopPropagation()
- `.once` to only process the first event
- `.self` to only process the event if it occurred
  on this element (at the target),
  as opposed to on an ancestor element
- `.capture` to only process the event if it
  did not occur at the target and
  occurred during the capture phase
- `.passive` to ignore certain events during scrolling
  in order to improve performance

For example:

```js
<button @click.stop.prevent="handleClick">Press Me</button>
```

Key modifiers check for common key codes. These include
`.enter`, `.tab`, `.delete`, `.esc`, `.space`,
`.up`, `.down`, `.left`, and `.right`.
When these are used, the event handling code is
only invoked when the specified key is pressed.

For example:

```js
<input @keyPress.enter="handleEnterKey">
```

System modifiers check for keys that can be
pressed in conjunction with another key
to change the meaning. These include
`.ctrl`, `.alt`, `.shift`, and `.meta`.
In macOS, `.meta` detects the command key.

Mouse button modifiers check for presses of specific mouse buttons.
These include `.left`, `.right`, and `.middle`.

### `v-model`

This creates a two-way binding between
a form element value and a component prop.
It can be used in `<input>`, `<textarea>`, and `<select>` elements.
Recall that `<input>` elements can be used for
text, checkboxes, and radio buttons.

For example:

```js
<input v-model="firstName" />
```

For checkboxes, the `v-model` for multiple `<input>` elements
can be the same array. The checkbox values are used
to populate the array when they are checked.
For example:

```html
<template>
  ...
  <div v-for="color in colors" :key="color">
    <input
      :id="color"
      type="checkbox"
      v-model="selectedColors"
      :value="color"
    />
    <label :for="color">{{color}}</label>
  </div>
  ...
</template>
...
<script>
  ...
  data: () => {
    return {
      colors: ['red', 'green', 'blue'],
      selectedColors: []
    };
  },
  ...
</script>
```

### `v-show`

This toggles the value of the CSS `display` property for an element
between its normal value (such as "block" or "inline") and "none".
For example, assuming the component has
a `data` property named `showGreeting`:

```html
<div v-show="showGreeting">Hello!</div>
<button @click="showGreeting = !showGreeting">Toggle Greeting</button>
```

This differs from conditional rendering using `v-if`
in that `v-if` will remove elements from the DOM
when the condition is false
whereas `v-show` leaves the element in the DOM
and just changes its CSS `display` property.

### Other Directives

`v-cloak`

This hides an element until all the data it uses has been loaded.
The benefit is that it avoids displaying unevaluated interpolations
(double curly braces).
This rarely occurs, so `v-cloak` is rarely used.

In order for this directive to work,
the following CSS rule must be defined:

```css
[v-cloak] {
  display: none;
}
```

`v-html`

This is used to render a string of HTML as HTML instead of plain text.
For example, `<span v-html="myHtml"></span>` where `myHtml`
is a prop or data value that is a string of HTML.
The HTML should not contain Vue directives
because those will not be processed.

`v-once`

This causes the content of an element to be evaluated only once.
If data used in the content changes after the initial render,
the element will continue to render
the same output as the initial render.

`v-pre`

This skips all evaluation of element content
which allows rendering double curly braces.
One use if for outputting example Vue code.

`v-text`

This is an alternative to using double curly braces
to output a data value. For example, these are equivalent:

```js
<span v-text="firstName"></span>
<span>{{firstName}}</span>
```

## JSX

Components can specify what to render using either an HTML template or JSX.
To use JSX, omit the template and include a `render` method
at the top level of the instance definition object.

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

Components that use a `render` method instead of an HTML template
can still include a `<style>` element.
However, if no CSS is needed, the file extension can be changed to `.js`
and the `<script>` start and end tags can be removed.
This works because in this case the Vue build tooling is not needed.

Here's an example of a `render` method that returns JSX
that calls a method to get more JSX.

```js
  data() {
    return {
      colors: ['red', 'green', 'blue']
    };
  },
  methods: {
    getItems() {
      return this.colors.map(color => <li>{color}</li>);
    }
  },
  render() {
    return <ul>{this.getItems()}</ul>;
  },
```

Here is an example that includes event handling.
Note the differences between Vue template syntax and JSX syntax.
Interpolation is done with single curly braces instead of double.
Event handling is done with "on" attributes.
The name can be all lowercase (ex. `onclick`) or camel-case (ex. `onClick`).
These supply a value in curly braces that
is the name of a method, not a call to it.

```js
export default {
  name: 'MyJsx',
  data() {
    return {on: false};
  },
  methods: {
    toggleOn() {
      this.on = !this.on;
    }
  },
  render() {
    return (
      <div>
        <div>on? {String(this.on)}</div>
        <button onClick={this.toggleOn}>Toggle On</button>
      </div>
    );
  }
};
```

## Lifecycle Methods

The following optional component methods are automatically called
at specific points in the lifecycle of the component.
They are defined as top-level properties in an instance definition.

- `beforeCreate` and `created`
  A component instance is consider to be created
  after its data has been made "reactive".
  At this point it is not yet part of the DOM.
  Template compilation into a `render` method
  occurs between `created` and `beforeMount`.

- `beforeMount` and `mounted`
  A component instance is mounted when
  it is inserted into the DOM of its parent or
  replaces the element referred to by its `el` property.

  The `beforeMount` method can be use used to modify
  the DOM before the component instance is rendered
  for the first time.

  The `mounted` method can be use used to modify
  the DOM after the component instance is rendered
  for the first time.
  It method can be called before
  all of its child components have been mounted.
  To do something after all of those have been mounted
  call `this.$nextTick` inside the `mounted` method,
  passing it a function that it will call.

  The `mounted` method is the most frequently used lifecycle method.
  It is a common place for making
  REST calls that get data needed by a component.

- `beforeUpdate` and `updated`
  A component instance is updated when
  any of its props or data change.
  These are sometimes used for debugging purposes.
  The `updated` method can be used to
  modify the DOM after a prop or data change.

- `beforeDestroy` and `destroyed`
  A component instance is destroyed when
  it is removed from the DOM.
  The `beforeDestroy` method is sometimes used
  to unsubscribe from events and data streams.

The most commonly used of these are `mounted` and `updated`.
These corresponds to the React lifecycle methods
`componentDidMount` and `componentDidUpdate`.

To see all the data and methods on an instance object,
add the following to the instance definition object:

```js
  mounted() {
    console.log(this.$options._componentTag + ':', this);
  }
```

//TODO: Is it correct to use the term "reactive data" below?
When reactive data is displayed in the devtools console,
values are represented with "(...)".
Click that to see the actual value.

## Inserting Child Nodes

A custom component can insert child nodes into its template
with `<slot>optional default content</slot>`.
If no child nodes are provided, the default content is used.
Otherwise it is replaced by the child nodes.

The child nodes can be any kind of HTML content or Vue elements.

For example, a custom select element named `Select`
could insert child `option` elements.

```html
<select path="favorite.color">
  <option>red</option>
  <option>green</option>
  <option>blue</option>
</select>
```

The template for the `Select` element can use `<slot></slot>`
to indicate where all the child nodes should be inserted.

It is also possible for a template to contain multiple named slots.
They simply add a `name` attribute to the `slot` element.
Each can optionally define default content.

Parent components specify the content for each named slot with
`<template slot="slot-name">the content</template>`.
Alternatively, the `slot` attribute can be used on a "normal" element.
For example, `<div slot="slot-name">the content</div>`.

Even when named slots are used, there can still be an unnamed slot
that is used for any content not marked for a specific slot name.

A related top is "scoped slots". These seem very complex!

## Refs

Template elements can have a `ref` attribute.
This allows component methods to get a reference to them.
It has many uses. One is to get a reference to an `input` element
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
```

### Styling

When the `<style>` tag has the `scoped` attribute,
each element is assigned a unique data attribute.
This is how scoping of CSS is achieved.
For example, a button with scoped CSS might appear as
`<button data-v-ee48fd14="">some text</button>`.
Generated CSS for this button will have the selector like
`button[data-v-ee48fd14]`.

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

## Using Sass

To use Sass syntax in the `<style>` element of a Vue component,
install a couple npm packages and
add a `lang` attribute to the `<style>` tag.

Install the required npm packages by entering
`npm install -D sass-loader node-sass`.

Change the opening `style` tag to `<style lang="scss">`.

With this in place it is possible to use all features
of Sass including variables, nested rules, and mixins.

CSS generated by scoped styles is less readable than
using CSS class names selected by the developer.
This can be avoided by using Sass nested rules and
still keep the CSS for a component scoped to it.
All that is needed is to follow this simple pattern.

1. Add a class attribute to the top-most element in the template
   whose name matches the name of the component.
2. Wrap all the CSS for the component in a rule
   that matches the class name used in step 1.

For example:

```html
<template>
  <div class="Foo">... content goes here ...</div>
</template>

<script>
  export default {
    name: 'Foo'
  };
</script>

<style lang="scss">
  .Foo {
    ... CSS rules for this component go here ...
  }
</style>
```

## Vuex

This is the most popular state management library for Vue.
It was developed by and is maintained by the Vue team.

To install it in a project, enter `npm install vuex`.

### Store Setup

Create the file `src/store.js` and add the following:

```js
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
```

In the same file, create the store
which can hold any number of pieces of state.
It defines the initial state and mutation methods that modify it.
Mutations are the only way to modify the state
and they must be synchronous methods.
They are not called directly and are instead invoked by calling
`this.$store.commit` (described later) from components.

Suppose we want to hold a year and an array of color names.

```js
export default new Vuex.Store({
  strict: true,
  state: {
    year: new Date().getFullYear(), // current year
    colors: ['yellow', 'orange']
  },
  mutations: {
    clearColors(state) {
      state.colors = [];
    }
    appendColor(state, color) {
      // Note that state properties can be modified in mutation functions.
      // It is not necessary to treat the state object as immutable here.
      state.colors.push(color);
    },
    setYear(state, year) {
      state.year = year;
    }
  }
});
```

When `strict` is `true` an error is thrown
if the state is modified outside of a mutation.
This is very desirable!

### Using From Components

Register the store with the top component.
This "injects" store access into all descendant components.
For example, this can be done in `src/App.js`:

```js
import store from './store';

export default {
  name: 'App',
  components: {
    // Components used by the App component are listed here.
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
      colors: state => state.colors,
      year: state => state.year
    })
    // More computed properties can be defined here.
  }
};
```

### Triggering Mutations

To trigger mutations from a component, call
`this.$store.commit(mutationName, arg)`.
For example, `this.$store.commit('appendColor', 'red');`
Only a single argument can follow the mutation name.
To supply more than one value, pass an array or object
containing all the values.
Any components that use the state affected by the mutation
will be updated.

Another option is to use `mapMutations` to generate methods
that make these calls for you. This returns an object that
should be spread into the `mutations` property.
For example:

```js
  methods: {
    ...mapMutations(['appendColor'])
    // More methods can be defined here.
  }
```

This allows the call to the `commit` method above
to be replaced by `this.appendColor('red');`.

Within a mutation there are two ways to update a state property.
For example, to change the `foo.bar` property to `'baz'` we can use
`state.foo.bar = 'baz'` or `Vue.set(state.foo, 'bar', 'baz')`.
Why would the second form ever be preferred?

### Getters

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
should be spread into the `computed` property.
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

### Actions

Actions support asynchronous mutation commits
and triggering multiple commits.
See <https://vuex.vuejs.org/guide/actions.html>.

Actions are never really needed.
Any asynchronous processing, such as calling a REST service,
can be done in an event handling method instead of an action.
When the asynchronous part completes,
a synchronous Vuex commit can be performed.

If common event handling code is needed across multiple components,
it can be implemented as a plain function
that is imported into each of the components
and invoked from their event handling methods.
This is simpler than using Vuex actions.

### Splitting the Store

The Vuex store can be split into multiple "modules".
Each of these have their own state, getters, mutations, and actions.
Modules can be further divided into sub-modules.
This is a bad idea! Using a single store is far easier.

### vuex-easy

For the easiest way possible to use Vuex,
see [vuex-easy](https://www.npmjs.com/package/vuex-easy).
This acts as a layer above the Vuex library,
so the Vue devtools Vuex tab can still be used.
It makes it unnecessary to implement any mutations.
It is based on the battle-tested React libraries
[redux-easy](https://www.npmjs.com/package/redux-easy) and
[context-easy](https://www.npmjs.com/package/context-easy).

## Vue-Router

This is the most popular routing library for Vue.
It was developed by and is maintained by the Vue team.

The vue-router library maps URLs to components and supports
navigation between "pages" using the `<router-link>` elements.
The current route can also be changed from JavaScript code
by calling `this.$router.push`.
The current route is render in a `<router-view>` element
that is typically rendered by the top-most component.

Some applications do not need the features of a router.
For applications that do not need the URL to change
for different "pages" of the app, it is possible to
change pages by using `v-if`, `v-else-if`, and `v-else`
in the top component to choose a component to render
based on a "route" value.

The `router-link` of the active route is given
the class name `router-link-exact-active`.
This can be used to style the link of the current route
differently from the others.

Components can access the router instance using `this.$router`.

In some Vue apps, components that are associated with routes are
placed in the `/view` directory instead of the `/components` directory.
However, this is not required.

### Router Setup

Route configuration is typically done in the file `router.js`.
When using Vue CLI, if "Router" is one of the selected features,
this file will be created and will perform the setup.
When not using the CLI, this file can be manually created.
The content should be similar to the following:

```js
import Vue from 'vue';
import Router from 'vue-router';
// Import app-specific view components here.

Vue.use(Router);

export default new Router({
  mode: 'history', // doesn't use "hash routing"
  base: process.env.BASE_URL, // defaults to /; usually not needed
  routes: [
    /**
    Route definitions go here.
    Each is an object containing "path" and "component" properties.
    A path is the part of a URL after the domain.

    There are additional optional properties
    that can be specified for each route.

    The "name" property is used to describe named routes
    which allow rendering multiple views at the same time.

    The "beforeEnter" property is a function that
    takes "to", "from", and "next" parameters.
    The "next" parameter is a function that should
    be called to allow navigating to the route.
    If it is not called, the navigation will not take place.
    */
  ]
});
```

Hash routing is the technique where URLs contain a "#" character.
Changes in the URL before the hash are handled by the server
and changes after the hash are handled in the browser.
By setting the router `mode` to `history`,
the same functionality is achieved without the hash character
which results in better looking URLs.

The file `main.js` should import the `Router` object
that is exported from `router.js`
and configure Vue to use it as follows:

```js
import Vue from 'vue';
import App from './App.vue'; // top component
import router from './router';

new Vue({
  router, // tells Vue to use the router
  // "h" is short for "hyperscript",
  // but it is really the createElement function.
  render: h => h(App)
}).$mount('#app'); // "app" is an id specified in public/index.html
```

### Where Route Components Are Rendered

The top component, typically defined in `App.js`,
is a common place to create links to routes.
If `<a>` tags are used, each click on them will result in
a call to the server and loss of application state.
Using `<router-link>` elements instead avoids this
and processes route changes entirely in the browser.
For example:

```js
<template>
  <div id="App">
    <nav>
      <router-link to="/">Home</router-link>
      <router-link to="/page1">Page 1</router-link>
      <router-link to="/page2">Page 2</router-link>
    </nav>

    <!-- This is where route components will render. -->
    <router-view/>
  </div>
</template>
```

### Route Parameters

In route definition objects,
`path` string values can contain colon-prefixed parts
to allow data to be passed when the route is changed.
For example, `/fruit/:name`.

In components that are rendered as the result of a route change,
values for these route parameters can be obtained
from `this.$route.params` which is an object where
the keys are the names after the colons
and the values are the supplied values.

For URLs that contain query parameters and/or hash values,
those are stored in `this.$route.query` and `this.$route.hash`.

When navigating to a route that is the same as the current route,
but with different router parameters, the same component will be used.
The lifecycle methods for creating and mounting the component
will not be called again.

### Before Route Parameter Changes

When a route change is for the same route path,
but with different parameter values,
the `beforeRouteUpdate` method of
the component being rendered is invoked.
It is passed an object describing the current route (`from`)
and the target route (`to`).
It is also passed a `next` function
that it should call to allow the change
or not call to prevent it.

```js
  beforeRouteUpdate(to, from, next) {
    // Do things before the route parameter change.

    // Call next() to allow the route to change,
    // or don't to prevent it.
  }
```

### After Route Parameter Changes

A `watch` on the `$route` property can be used to
do things after such a route parameter change.
For example:

```js
  watch: {
    $route(to, from) {
      // Do things after the route parameter change.
    }
  }
```

### Route Changes From Code

A component method can change the current route
by calling `this.$router.push`,
passing it the URL of the new route.
This pushes the new URL on to the history stack so the
browser back button can be used to return to the previous URL.

Alternatively `this.$router.replace` can be called,
passing it the URL of the new route.
This replaces the current URL at the top of the history stack
with a new one, so the browser back button
will not return to the previous URL.

TODO: Add code from vue-router-demo that demonstrates this with links for fruits.
TODO: See vue-router-demo project.

### Special Route Syntax

To match any URL not matched by another route, use "\*" for the path.
A "\*" can also be used as a wildcard part of any path.
The matching string is held in `$route.params.pathMatch`.

Regular expressions can also be used in route paths.

It is possible for a URL to match more than one route path.
When this happens, the first matching route path,
in the order in which they are defined, is selected.

### Named and Nested

The vue-router library also supports named routes,
named views, and nested named views.
These are advanced topics that many applications do not need.

For more detail on vue-router, see <https://router.vuejs.org/guide/>.

## More on Vue CLI

The Vue CLI tool supports creating and managing Vue projects.
It is built on webpack and webpack-dev-server and
provides good default configuration for these.

Projects created by the Vue CLI have
a runtime dependency on `@vue/cli-service`.
This is similar to the `react-scripts` library
used by projects that are created by create-react-app.
Much of the functionality for developing a project comes from this library.
It can be easily upgraded when new versions are released.
Think of it like allowing a team of experts to maintain
your build process, while retaining the ability to customize it.

Many CLI features are supported by plugins obtained from npm.
Examples include support for Babel, ESLint, TypeScript,
Jest, Cypress, Vuex, and vue-router.
Vue CLI plugins have names that start with
"@vue/cli-plugin-" (supplied by core team) or
"vue-cli-plugin-" (supplied by community).
This makes it easy to search for them at <https://npmjs.org>.

To install the Vue CLI, enter `npm install -g @vue/cli`.
This makes the `vue` command globally accessible.

### Vue CLI Commands

The most commonly used Vue CLI commands are:

- `vue create` creates a new project

- `vue add` adds plugin to a project

- `vue serve` runs a local HTTP server to demo/test a project in development mode
  This command seems to be broken,
  but `npm run serve` can be used instead.

- `vue build` builds a project in production mode
  This command seems to be broken,
  but `npm run build` can be used instead.
  It creates a `dist` directory containing all
  the files needed to deploy the application.

  There is also a "modern" mode that creates two JavaScript bundles,
  one targeted at modern browsers and one targeted an older browsers
  which require more transpilation and polyfills.

- `vue ui` opens the web-based project dashboard
  Press the "home" icon in the lower-left to
  navigate to the "Vue Project Manager" which supports

  - creating new projects\
    Selected options can be saved as a preset
    so future projects can easily be created with the same options.
  - importing existing projects
  - managing an existing project

  Managing a project includes:

  - viewing installed plugins and installing more
  - viewing installed dependencies and installing more
  - viewing and modifying the CLI and ESLint configurations
  - viewing and running project tasks
  - killing the process listening on a given port

- `vue info` outputs information about the current environment
  that is useful in bug reporting, including:
  - operating system
  - CPU
  - versions of binaries (Node, Yarn, and npm)
  - versions of installed web browsers
  - versions of installed npm packages

### Ejecting

With React projects that are created using create-react-app,
the kinds of configuration changes that can be made are limited.
Certain kinds of changes required "ejecting".
This removes the dependency on the `react-scripts` library
and copies many configuration files and dependencies into the project.
After ejecting, it is no longer possible to take advantage
of improvements to the `react-scripts` library.

Vue projects created with the Vue CLI
never require ejecting to customize their build process.
They can always take advantage of improvements
to the `@vue/cli-service` library.

## Comparison to React

### Component Definitions

In Vue, components are defined by a JavaScript literal object.
Event handling is implemented with methods that are defined
in that object, and attached to component instances.
There seems to be no way to use plain functions.

In React, components can be defined by a plain function,
as can event handling.
In the past React components usually were not
defined by a plain function because
a class was required to implement state and lifecycle methods.
With the introduction of "hooks", that is no longer true.
So most React code will just use plain functions for everything.
This removes the need to understand the value of the `this` keyword
and how classes work.

### Error Messages

React currently provides better error messages than Vue.

In React, when source files are saved from any editor or IDE
React detects the changes, compiles them,
and refreshes the browser tab where the app is running.
Any errors are displayed in the browser with very clear messages
explaining exactly what needs to be fixed.

In Vue, error messages appear in the devtools console.
They are often brief and contain a stack trace
where most of the lines refer to code in the library
rather than application-specific code.

### Performance

React uses virtual DOM diffing to determine the actual DOM updates that are required.

Vue changes all data objects and Vuex state objects to track property changes
by modifying them at startup using the `defineProperty` method
which adds getter and setter methods for all properties.
Vue refers to this as making the objects "reactive".
This has a startup cost, but results in faster determination
of required DOM changes than React.
Perhaps this is why live reload is slower in Vue than in React.

### Ease of Learning

Many claim a benefit of Vue is that it is easier to learn than React's JSX.
This comes down to comparing the ways in which JSX differs from HTML
to the things that Vue adds to HTML.
Let's compare them point by point.

#### Inserting Content

In React, the result of a JavaScript expression is
inserted into the DOM by enclosing it in curly braces.
For example, `{ new Date().toString() }`

In Vue the same approach is used,
but with double curly braces.
For example, `{{ new Date().toString() }}`

Evaluation: tie

#### Changes in Attribute Names

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

#### Directives

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

#### CLI Startup

In React applications created with create-react-app,
entering `npm start` starts a local HTTP server
opens a tab in the default web browser,
and runs the app.

In Vue applications created with the Vue CLI,
entering `npm run serve` starts a local HTTP server,
by it does not open a browser tab for the application.
That must be done manually.

Evaluation: small win for React

#### Two-Way Data Binding

In Vue, the `v-model` directive can be used to bind
the value of a form element to a component data value.

In React, implementing this functionality requires
custom event handling methods and use of the `setState` method.

Evaluation: win for Vue

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

By default, unit test source files are expected to be
under the `tests/unit` or `__tests__` directories.
To colocate tests with the source files they test,
modify the "testMatch" property in the "jest" section
of `package.json` as follows:

```js
    "testMatch": [
      "**/src/**/*.spec.js"
    ],
```

To add the ability to run Jest and Cypress tests to an existing Vue project
that was created by the CLI, but without requesting use of Jest:

- `npm install @vue/test-utils`
- `npm install @vue/cli-plugin-e2e-cypress`
- `npm install @vue/cli-plugin-unit-jest`
- `npm install babel-core`
- `npm install babel-jest`
- `npm install eslint-plugin-jest`
- edit `package.json`

  - add the following scripts
    - "test:e2e": "vue-cli-service test:e2e",
    - "test:unit": "vue-cli-service test:unit"
  - in the "env" object, add `"jest/globals": true,`
  - in the "eslintConfig" object,
    add `"plugins": ["jest"],`
  - add the following sections

    ```js
      "babel": {
        "presets": [
          "@vue/app"
        ]
      },
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

TODO: Add examples of unit tests.

TODO: Add examples of e2e tests.

## TypeScript

The Vue CLI can generate projects that are configured to use TypeScript.
It will ask if use of class-based syntax is desired.
If choose not to use the class-based syntax,
the source files it generates will not include any types.
The only difference is that `main.js` becomes `main.ts` and
the `.vue` files contain script tags that look like `<script lang=“ts”>`.
So the project is ready for you to use TypeScript,
but the generated code does not.
