# Storybook Notes

- "a UI development environment for your UI components"
- "visualize different states of your UI components
  and develop them interactively"
- "runs outside of your app,
  so you can develop UI components in isolation without
  worrying about app specific dependencies and requirements"
- works with React, Vue, and Angular
- these notes only describe using it with React

## Setup

- cd to top project directory of an existing React project
- `npm i -D @storybook/react`
- add following npm script in `package.json`\
  `"storybook": "start-storybook -p 9001 -c .storybook",`
- create `.storybook` directory at top of project
- create `config.js` file in `.storybook` directory
- add the following to `.storybook/config.js`

  ```js
  import {configure} from '@storybook/react';

  function loadStories() {
    require('../stories/index.js');
    // Require as many stories as you need.
  }
  ```

- create `stories` directory at top of project
- create `index.js` file in `stories` directory

- add something like the following to `stories/index.js`

  ```js
  import React from 'react';
  import {storiesOf} from '@storybook/react';
  //import {action} from '@storybook/addon-actions';
  import Slider from '../src/slider/slider';
  ```

storiesOf('Slider', module)
.add('default', () => <Slider path="" />)
.add('custom', () => <Slider min={1} max={9} step={2} path="" />);

```

```
