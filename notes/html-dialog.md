# HTML dialog Element

The `<dialog>` element was added to HTML in version 5.2.
It provides a way to define dialogs that can be styled with CSS.

## Past Alternatives

Before this addition, there were two primary options for
implementing dialogs in web applications.

First, the JavaScript functions `alert`, `confirm`, and `prompt`
can be used to display simple dialogs that cannot be styled.
These are not desirable because they cannot be made
to match the styles of web applications that use them.

Second, dialogs can be simulated with `<div>` tags
that have a higher CSS `z-index` than the page.
There are many libraries for many web frameworks
that take this approach. One example is
[react-modal](https://github.com/reactjs/react-modal).

These approaches are no longer needed
now that we can use the `<dialog>` element.

## Browser Support

As of January 25, 2019, the `<dialog>` element was
supported by Chrome, Firefox, and Opera,
but not by Edge, Internet Explorer, or Safari.
However, there is a polyfill named "dialog-polyfill"
from the Google Chrome team
that allows it to work in all of these browsers.
It is available at <https://github.com/GoogleChrome/dialog-polyfill>.

### Polyfill Install

If Node.js is not installed, browse <https://nodejs.org>,
download the "LTS" or "Current" version, and run the installer.

Install the polyfill by entering `npm install dialog-polyfill`.

Copy the files `dialog-polyfill.css` and `dialog-polyfill.js`
from the `node_modules/dialog-polyfill` directory
into the directory where `index.html` resides in the
web application that wishes to use the `<dialog>` element.
Typically this is the `public` directory.

## Example Usage in Plain JavaScript

Here is an example of using the `<dialog>` element without using a web app framework.

Before the dialog is opened, the page has the following content:
![before opening](./html-dialog-closed.png)

After the dialog is opened, the page has the following content:
![after opening](./html-dialog-opened.png)

### `index.html`

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="dialog-polyfill.css" />
    <link rel="stylesheet" href="dialog-demo.css" />
    <script src="dialog-polyfill.js"></script>
    <script src="dialog-demo.js"></script>
    <title>Dialog Demo</title>
  </head>
  <body>
    <!-- This defines the content of the dialog which
          can be any HTML, including form elements. -->
    <dialog>
      I'm a dialog!
      <!-- This renders a "Close" button that will
            close the dialog when it is clicked. -->
      <form method="dialog"><input type="submit" value="Close" /></form>
    </dialog>

    <div>This is the page content.</div>

    <!-- Pressing this button causes the dialog to open. -->
    <button onClick="dialog.showModal()">Open...</button>
  </body>
</html>
```

### `dialog-demo.js`

```js
// Tell ESLint that about global variables.
/* global dialogPolyfill: false */

// eslint-disable-next-line no-unused-vars
let dialog; // accessed in index.html

window.onload = () => {
  dialog = document.querySelector('dialog');
  dialogPolyfill.registerDialog(dialog);
};
```

### `dialog-demo.css`

This is the CSS that styles the dialog
and the buttons that open and close it.

```css
body {
  font-family: sans-serif;
  text-align: center;
}

/* These are styles for buttons, including
   submit buttons used to close dialogs.
   The background-color and box-shadow styles
   must be specified in order to make the buttons
   look the same across various browser. */
button,
input[type='submit'] {
  background-color: white;
  border: solid gray 1px;
  border-radius: 4px;
  box-shadow: none;
  margin-top: 10px;
  padding: 4px;
}

/* These are the styles for the dialog */
dialog {
  border: solid gray 2px;
  border-radius: 10px;
}

/* This is the style for outside the dialog
   when the dialog is displayed
   to make it clear that it is a "modal dialog" and
   the user cannot interact with anything outside it. */
::backdrop, /* for native <dialog> */
dialog + .backdrop {
  /* for dialog-polyfill */
  /* a transparent shade of gray */
  background-color: rgba(0, 0, 0, 0.2);
}
```

## Example Usage in React

Here is an example of using the `<dialog>` element in a React application.
It was created using
[`create-react-app`](https://facebook.github.io/create-react-app/).

No knowledge of React is required to understand the example.

### React `public/index.html`

Edit this file and add the following lines
inside the `<head>` element.

```html
<link rel="stylesheet" href="dialog-polyfill.css" />
<script src="dialog-polyfill.js"></script>
```

### React `src/App.js`

This is the entire content of `App.js`,
including comments that explain the relevant parts.

```js
// Tell ESLint that about global variables.
/* global dialogPolyfill: false */

import React, {Component} from 'react';
import './App.css';

class App extends Component {
  // This runs after the App component is rendered.
  componentDidMount() {
    // Find the dialog using a CSS selector
    // and save it for later.
    this.dialog = document.querySelector('dialog');

    // Register the dialog with the polyfill which is
    // required by browsers that lack native support.
    dialogPolyfill.registerDialog(this.dialog);
  }

  openDialog = () => {
    // This is what actually causes the dialog to open.
    // By default it will be centered on the page.
    this.dialog.showModal();
  };

  render() {
    return (
      <div className="App">
        <!-- This defines the content of the dialog which
             can be any HTML, including form elements. -->
        <dialog>
          I'm a dialog!
          <!-- This renders a "Close" button that will
               close the dialog when it is clicked. -->
          <form method="dialog">
            <input type="submit" value="Close" />
          </form>
        </dialog>

        <div>This is the page content.</div>

        <!-- Pressing this button causes the dialog to open. -->
        <button onClick={this.openDialog}>Open...</button>
      </div>
    );
  }
}

export default App;
```

### React `src/App.css`

The content of this file is the same as `dialog-demo.css`
in the previous version.

## Example Usage in Vue

Here is an example of using the `<dialog>` element in a Vue application.
It was created using the [`Vue CLI`](https://cli.vuejs.org/).

No knowledge of Vue is required to understand the example.

### Vue `public/index.html`

Edit this file and add the following lines
inside the `<head>` element.

```html
<link rel="stylesheet" href="dialog-polyfill.css" />
<script src="dialog-polyfill.js"></script>
```

### Vue `src/App.vue`

Modify the `<template>` and `<script>` sections
to match the following:

```html
<template>
  <DialogDemo />
</template>

<script>
  import DialogDemo from './components/DialogDemo.vue';

  export default {
    name: 'app',
    components: {
      DialogDemo
    }
  };
</script>
```

### Vue `src/components/DialogDemo.vue`

Create this file with the following content:

```html
<template>
  <div>
    <dialog
      >I'm a dialog!
      <form method="dialog"><input type="submit" value="Close" /></form>
    </dialog>
    <div>This is page content.</div>
    <button @click="dialog.showModal()">Open...</button>
  </div>
</template>

<script>
  /* global dialogPolyfill: false */
  export default {
    name: 'DialogDemo',
    data() {
      return {dialog: Object};
    },
    mounted() {
      this.dialog = document.querySelector('dialog');
      dialogPolyfill.registerDialog(this.dialog);
    }
  };
</script>

<style>
  <!-- Add same CSS rules here as are found in `dialog-demo.css`.
</style>
```

## Summary

Even with the need to use a polyfill,
the `<dialog>` element is very easy to use!
