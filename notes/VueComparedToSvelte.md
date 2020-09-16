# Vue Compared to Svelte

Does the ability to do more with less code matter to you?
If not then you may not be impressed by Svelte.

## Component definitions

The structure of these is very similar between Vue and Svelte.

In Vue:

<template>...</template>
<script>...</script>
<style scoped>...</style>

In Svelte:

<script>...</script>
HTML
<style>...</style>

In Vue 2, the <script> exports a Vue-specific instance definition object.
Functions defined here frequently use the `this` keyword
to refer to instance properties and methods.

export default {
  el: 'some-selector',
  name: 'SomeName',
  components: { ... },
  props: { ... },
  computed: { ... },
  data() {
    return { ... };
  },
  watch: { ... },
  methods: { ... },
  life-cycle-methods,
  template: 'some-template'
}

Why must `components` list the components that are used?

In Svelte the <script> just defines
variables and functions used by the component.

Svelte can use TypeScript types to define prop types.

## Templates

Vue component templates are defined by a `<template>` element.
Svelte components just specify HTML without a surrounding element.

Vue uses double curly braces to surround JavaScript expressions
whose value should be rendered.
Svelte uses single curly braces for this.

Vue-specific syntax includes:
- `v-bind` (:)
- `v-if`, `v-else-if`, `v-else`
- `v-for`,
- `v-model`
- `v-on` (@)
- `v-show`
- less commonly used: `v-cloak`, `v-html`, `v-once`, `v-pre`, `v-text`

Why does it make sense to specify conditional and iteration logic
INSIDE elements using attributes?
Imagine if you could do that with JavaScript functions.

```js
doSomething(
  arg1,
  arg2,
  if (arg1 > 10),
  for (arg1 in someCollection));
```

Isn’t that weird?

Svelte-specific syntax includes:

- `bind:`
- `class:`
- `on:`
- `use:`
- for animation: `animate:`, `transition:`, `in:`, and `out:`

Svelte block structures include:

```text
{#if condition}
  ...
{:else if other-condition}
  ...
{:else}
  ...
{/if}
```

```text
{#each collection as element, index (key)}
  ...
{:else}
  ...
{/each}
```

```text
{#await promise}
  ...
{:then result}
  ...
{:catch error}
  ...
{/await}
```

Vue event modifiers include:
`.prevent`, `.stop`, `.once`, `.self`, `.capture`, and `.passive`.

Svelte event modifiers include:
`:preventDefault`, `:stopPropagation`, `:once`, and `:passive`.

## Basic Example

Here are examples of components that accept a `msg` prop,
display it in an `h1`, and provide a button to uppercase the message.

In Vue 2:

```html
<template>
  <h1>{{ msgCopy }}</h1>
  <button @click="uppercase">Upper</button>
</template>

<script>
export default {
  name: 'HelloWorld2',
  props: {
    msg: String
  },
  data: function() {
    return {msgCopy: this.msg}; // needed because I can't modify a prop
  },
  methods: {
    uppercase: function() {
      this.msgCopy = this.msgCopy.toUpperCase();
    }
  }
};
</script>
```

In Vue 3:

```html
<template>
  <h1>{{ msgCopy }}</h1>
  <button @click="uppercase">Upper</button>
</template>

<script>
import {ref} from 'vue';

export default {
  props: {
    msg: String
  },
  setup(props) {
    const msgCopy = ref(props.msg);

    function uppercase() {
      msgCopy.value = msgCopy.value.toUpperCase();
    }

    return {msgCopy, uppercase}; // makes them available in template
  }
};
</script>
```

In Svelte:

```html
<script>
  export let msg;
  const uppercase = () => msg = msg.toUpperCase();
</script>

<h1>{msg}</h1>
<button on:click={uppercase}>Upper</button>
```

## Styling

Both Vue and Svelte support including a `<style>` tag in component definitions.
To make styles be scoped to a Vue component, use `<style scoped>`.
This is the default in Svelte.

## Bundle Size

Svelte apps have significantly smaller bundle sizes
than equivalent apps created with other web frameworks.
This means that Svelte apps can be downloaded to browsers more quickly.

In large part, Svelte achieves smaller bundle sizes
by only including the required framework code
instead of an entire framework library.
For example, the Todo app presented in chapter 2 has a bundle size
that is 13% of the size of an equivalent React app.
Links to Svelte, React, and Vue versions of this app
can be found in chapter 2.

All of these web frameworks incorporate some amount
of "tree shaking" to eliminate unused code.
But Svelte retains far less framework code.
For example, React and Vue apps must ship code that produces
virtual DOM representations and finds differences between them.

FreeCodeCamp’s comparison of frameworks,
"A RealWorld Comparison of Front-End Frameworks with Benchmarks (2019 update),"
catalogs statistics on building a real world web application
using many web frameworks (http://mng.bz/8pxz).
In this case, the app used in the comparison is a social blogging site
called “Conduit,” similar to Medium.com.

The reported gzipped app size for some popular framework choices include

* Angular + ngrx: 134 KB
* React + Redux: 193 KB
* Vue: 41.8 KB
* Svelte: 9.7 KB

## Passing Props

To use the value of a variable as a prop with the same name:

- in Vue: `:name={name}`
- in Svelte: `{name}`

## Component State

In Vue 2:

```js
data() {
  return {
    name: 'Mark'
    score: 19
  }
}
```

In Vue 3:

```js
export default {
  setup() {
    const name = ref('Mark');
    const score = ref(19);
    score.value += 5;
    // Render with {{score}}.
  }
}
```

In Svelte:

let name = 'Mark';
let score = 19;
score += 5;
// Render with {score}.

## Computed Props

In Vue 2:

```js
props: {
  name: {
    type: String,
    required: true
  }
},
computed: {
    initials() {
      return this.name.split(' ')
        .map(part => part[0].toUpperCase())
        .join('');
    }
  }
}

In Vue 3:

```js
import {ref, computed} from 'vue'

const initials = computed({} => name.value * 2);
```

In Svelte:

```js
export let name;

$: initials = name.split(' ')
  .map(part => part[0].toUpperCase())
  .join('');
```

## Virtual DOM

React and Vue use a virtual DOM, but Svelte does not.
Rich Harris said in a talk,
"As engineers we should be offended by all that inefficiency."
This refers to the work of creating virtual DOM representations in memory
and diffing them.

The Svelte compiler generates code that tracks changes in variables
whose values affect what should be rendered and
updates the appropropriate parts of the DOM when variables change.
This is much more efficient both in terms of CPU time and memory usage.

## Reactivity

In Vue 3, use the `ref` function.
In Svelte, just use a normal variable.

## Shared State

Vue applications typically use the Vuex library
to share state between components.
This is somewhat similar to Redux that is used by many React applications.

Vuex stores are defined by four parts: state, mutations, getters, and actions.
The learning curve is non-trivial.

Svelte uses the builtin `svelte/store` package
that provides a simple pub/sub mechanism.
Defining a "writable" store is simply a matter of declaring one with
an initial value and exporting it so other components can import it.
Components that use a store import it and refer to it with `$` prefix
to automatically handle subscribing to changes
and unsubscribing when the component is unmounted.
It's hard to imagine a simpler approach.

## Routing

In Vue the most popular routing library is "Vue Router".
This uses the `Router` class and the elements
`<router-link>` and `<router-view>` to define routes.

In Svelte there is no blessed solution yet,
but it seems to be moving toward Routify.
Some options include manual routing, hash routing, the page library,
Routify, svelte-routing, navaid, and svelte-spa-router.

## Tooling

Both can use Jest, Cypress, and Storybook.

Both can use ESLint and Prettier

