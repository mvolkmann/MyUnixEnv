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

## Format of .vue files

```js
<template>
  HTML goes here.
  Can refer to Vue components.
  Can include HTML comments like <!-- comment -->.
</template>

<script>
  JavaScript goes here.
  Can import other component .vue files.
  Can export a component definition.
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

- `el`: a CSS selector that specifies
  where this component should be rendered,
  typically only used for top-level components
- `name`: the component name
  This becomes an id in the generated HTML that can be referenced in CSS.
- `components`: an object where keys are component names and values are components
  - with ES6 object shorthand, can be `{Foo, Bar}`
    list of other components used by this component inside curly braces
- `props`: an object describing the props this component accepts
  - keys are prop names; values are their types
  - ex. `props: {name: String, age: Number}`
- `computed`: props that are computed based on other props and data
- `data`: data specific to a component instance, like state in React
- `methods`: primarily used for event handling
  (Are there lifecycle methods that go here?)

## Assets

Assets such as images, audio, and video typically reside in
`src/assets` and are accessed with URLs that start with `./assets/`.

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

### Other Directives

v-cloak
v-html
v-once
v-pre
v-show
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

This could also include a `<style>` element.
However, if no CSS is needed, the file extension can be changed to `.js`
and the `<script>` start and end tags can be removed.
This works because in this case the Vue build tooling is not needed.

Component methods can be called from inside curly braces,
but plain functions defined outside the component definition
cannot be called. See https://github.com/elbywan/bosket/issues/23.

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

## VueX

## More on Vue CLI
