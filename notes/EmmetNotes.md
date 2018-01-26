# Emmet Notes

## Overview

Emmet is an editor plugin for quickly entering HTML and CSS.
It is available for many editors including
Atom, Eclipse, Emacs, Sublime, Vim, Visual Studio (VS) Code, and WebStorm

Emmet is not just a simple snippet manager.
It parses entered text to extract meaning.
These kinds of snippets are refered to as "dynamic snippets".

We will see many examples later, but here's one.
The snippet `div#some-id.class1.class2[attr1=one attr2=2]{some content}`
expands to
`<div id="some-id" class="class1 class2" attr1="one" attr2="2">some content</div>`.
Amazing!
Simpler snippets are also very useful.
For example, the CSS snippet `mb10` expands to `margin-bottom: 10px;`.

The main web site for Emmit is https://emmet.io/.
Also see the cheat sheet at https://docs.emmet.io/cheat-sheet/.

## Getting Started

You will need to configure Emmet within your editor/IDE of choice.
Instructions for specific ones can be found at https://emmet.io/download/.
Click the box for your editor to see the details.

Rather than walk through the steps for every editor,
this article covers just two.
Currently VS Code seems to be the most popular editor, so that is covered.
I use Vim, so that is also covered.

## VS Code

Details on configuring Emmet for VS Code can be found at
https://code.visualstudio.com/docs/editor/emmet.
VS Code includes Emmet by default, but it is not enabled.
Once Emmet is enabled, it will be available by default for these type types:
css, haml, html, jade, jsx, less, sass, scss, slim, stylus, xml, and xsl.
More file types can be added.

### Configuring Emmet in VS Code

* Select Code...Preferences...Settings.
* Enter "Emmet" in the "Search Settings" input at the top.
* Note the available settings and their defaults on the left.
* Change settings in "USER SETTINGS" on the right.
* To use tab key for trigger, change
  "emmet.triggerExpansionOnTab" to true.
* To enable use in React components in `.js` files
  change the "emmet.includeLanguages" object
  to include `javascript: 'javascriptreact'`

### Using Emmet in VS Code

After typing an Emmet snippet, press tab to expand it.
When using Vim emulation, you must be in insert mode
when the tab key is pressed.

Tthe cursor will automatically be moved to an insertion point
within the expansion.
For snippets with multiple insertion points,
press tab again to jump to the next one
and shift-tab to jump to the previous one.

Suggestions are displayed as snippets are typed.
To use the top suggestion before the snippet is fully entered,
press tab.
To use a different suggestion, use to the up and down arrows keys
to navigate to it and press tab.
To see the expansion before it is applied,
press ctrl-space to open the "documentation fly-out"
to the right of the suggestion.

TODO: INCLUDE SOME SCREENSHOTS!

### Vim emulation in VS Code

In case you are interested in enabling Vim emulation in VS Code,
here are the steps.
* Select View...Extensions.
* Enter "vscodevim" in the search input.
* Press the "Install" button for the vscodevim extension.

To configure Vim emulation
* Select Code...Preferences...Settings.
* Enter "vim" in the "Search Settings" input at the top.
* See the available settings and their defaults on the left.
* Change settings in "USER SETTINGS" on the right.

## Vim

Details on configuring Emmet for Vim can be found at
https://github.com/mattn/emmet-vim.
This is accomplished by modifying your `.vimrc` file.

By default the key that triggers Emmet expansions
is ctrl-y followed by a comma.

It is common in Vim to use a "leader key" for many
keyboard shortcuts and the comma keys is popular choice.
To configure the leader key to be comma,
add the following to your .vimrc file.
```
let mapleader = ','
```

Emmet has its own leader key.
To set it to be the same as the Vim leader key,
add the following to your .vimrc file.
```
let g:user_emmet_leader_key='<leader>'
```

Once these changes are made, Emmet expansions can be triggered
by entering a snippet and pressing the comma key twice
while still in insert mode.

For snippets with more than one insertion point
press `<emmet-leader>n` to move to next
and `<emmet-leader>N` to move to previous

By default Emmet snippets can be expanded in all file types.
To restrict usage to specific file types,
add the following to your .vimrc file.
```
let g:user_emmet_install_global = 0 " don't enable for all file types
autocmd FileType html,css,scss EmmetInstall " specifies file types
```

To use Emmet in .js or .jsx files that define React components,
add the following to your .vimrc file.
```
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}
autocmd FileType html,css,javascript.jsx,scss EmmetInstall
```

## Syntax for HTML snippets
* mostly like CSS selector syntax with no spaces
* cursor position after triggering is shown in examples as |
* child with `>`
  - ex. `foo>bar>baz` ->
    ```html
    <foo>
      <bar>
        <baz>|</baz>
      </bar>
    </foo>
    ```
* sibling with `+`
  - ex. `foo+bar+baz` ->
    ```html
    <foo>|</foo>
    <bar></bar>
    <baz></baz>
    ```
* climb up with `^`
  - adds to parent
  - doesn't seem very common or useful
* classes with `.`
  - ex. `div.my-class` -> `<div class="my-class">|</div>`
  - ex. `div.c1.c2` -> `<div class="c1 c2">{content}</div>`
* ids with `#`
  - ex. `div#my-id` -> `<div id="my-id">|</div>`
* attributes with []
  - surround values with no quotes (if no special characters)
    or single or double quotes (if special characters)
  - ex. `div[foo=1 bar=two]` -> `<div foo="1" bar="two">|</div>`
  - ex. `div[foo="contains space" bar='single quotes']` ->
    `<div foo="contains space" bar="single quotes"></div>`
  - no comma between listed attributes
* content with `{}`
  - ex. `div{my content}` -> `<div>my content|</div>`
* multiplication with `*`
  - repeats pattern n times when *n is added after pattern
  - ex. `td*3` ->
    ```html
    <td>|</td>
    <td></td>
    <td></td>
    ```
* numbering with `$`
  - works in conjunction with multiplication
  - can use for ids, classes, and content
  - ex. `ul>li.item$*3` ->
    ```html
    <ul>
      <li class="item1">|</li>
      <li class="item2"></li>
      <li class="item3"></li>
    </ul>
    ```
  - starts at 1 by default
  - specify different start with @start and *times
    * ex. `div{item $@4}*3` ->
      ```html
      <div>item 4|</div>
      <div>item 5</div>
      <div>item 6</div>
      ```
* combining above
  - ex. `div#my-id.my-class[foo=1 bar=two]{my content}` -><br />
    `<div id="my-id" class="my-class" foo="1" bar="two">my content|</div>`
* grouping with `()`
  - for multiple, complex siblings
  - ex. `table>(thead>tr>th*3)+(tbody>(tr>td*3)*2)` ->
    ```html
    <table>
      <thead>
        <tr>
          <th>|</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
    </table>
    ```
* implicit tag names
  - can sometimes guess desired tag name based on context
  - ex. `.foo` -> `<div class="foo">|</div>`
  - ex. `ul>.foo` ->
    ```html
    <ul>
      <li class="foo">|</li>
    </ul>
    ```

## Lorem Ipsum text
* `lorem` or `lipsum` -> 100 words
* `lorem:n` or `lipsum:n` -> n words

## HTML snippets
* there are many more, but these seem the most useful
* `!` - html template
    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <title></title>
    </head>
    <body>
      |
    </body>
    </html>
    ```
* `a` -> `<a href="|"></a>`
* `a:link` -> `<a href="http://|"></a>`
* `a:mail` -> `<a href="mailto:|"></a>`
* `btn` or `button` - `<button>|</button>`
* `c` -> `<!-- | -->`
* `img` -> `<img src="|" alt="">`
* `input:{type}`
  - type can be one of
    button, checkbox, color, date, datetime, datetime-local,
    email, file, hidden, image, month, number, password, radio,
    range, search, submit, tel, text, time, url, or week
  - ex: `input:number` -> <input id="" type="number" name="">
* `label` -> `<label for="|"></label>`
* `link` -> `<link rel="stylesheet" href="|">`
* `link:favicon` ->
  `<link rel="shortcut icon" type="image/x-icon" href="|favicon.ico">`
* `ol+` - abbreviation for ol>li
* `opt` or `option` -> `<option value="|"></option>`
* `select+` - abbreviation for select>option
* `script:src` -> `<script src="|"></script>`
* `table+` - abbreviation for table>tr>td
* `tarea` or `textarea` -> `<textarea id="|" name="" cols="30" rows="10"></textarea>`
* `tr+` - abbreviation for tr>td
* `ul+` - abbreviation for ul>li

## CSS snippets
* there are many more, but these seem the most useful
* `ac` -> `align-content: |;`
* `ac:c` -> `align-content: center;`
* `ac:fe` -> `align-content: flex-end;`
* `ac:fs` -> `align-content: flex-start;`
* `ac:s` -> `align-content: stretch;`
* `ac:sa` -> `align-content: space-around;`
* `ac:sb` -> `align-content: space-between;`
* `ai` -> `align-items: |;`
* `ai:b` -> `align-items: baseline;`
* `ai:c` -> `align-items: center;`
* `ai:fe` -> `align-items: flex-end;`
* `ai:fs` -> `align-items: flex-start;`
* `ai:s` -> `align-items: stretch;`
* `as` -> `align-self: |;`
* `as:b` -> `align-self: baseline;`
* `as:c` -> `align-self: center;`
* `as:fe` -> `align-self: flex-end;`
* `as:fs` -> `align-self: flex-start;`
* `as:s` -> `align-self: stretch;`
* `b` -> `bottom: |;`
* `bd` -> `border: |;`
* `bd:n` -> `border: none;`
* `bdb` or `bb` -> `border-botom: |;`
* `bdl` or `bl` -> `border-left: |;`
* `bdr` or `br` -> `border-right: |;`
* `bdt` or `bt` -> `border-top: |;`
* `bg` -> `background: #000;`
* `bgc` -> `background-color: #fff;`
* `bgc:t` -> `background-color: transparent;`
* `c` -> `color: #000;`
* `cur:d` -> `cursor: default;`
* `cur:p` -> `cursor: pointer;`
* `d:n` -> `display: none;`
* `d:b` or `d` -> `display: block;`
* `d:f` -> `display: flex;`
* `d:g` does not give `display: grid`!
* `d:i` -> `display: inline;`
* `d:ib` -> `display: inline-block;`
* `d:li` -> `display: list-item;`
* `d:n` -> `display: none;`
* `d:t` -> `display: table;`
* `fxd` -> `flex-direction: |;`
* `fxd:c` -> `flex-direction: column;`
* `fxd:r` -> `flex-direction: row;`
* `ff` -> `font-family: |;`
* `ff:m` -> `font-family: monospace;`
* `ff:s` -> `font-family: serif;`
* `ff:ss` -> `font-family: sans-serif;`
* `fs` -> `font-style: |;`
* `fs:i` -> `font-style: italic;`
* `fs:n` -> `font-style: normal;`
* `fw` -> `font-weight: |;`
* `fw:b` -> `font-weight: bold;`
* `fw:n` -> `font-weight: normal;`
* `fz` -> `font-size: |;`
* `h` -> `height: |;`
* `jc` -> `justify-content: |;`
* `jc:c` -> `justify-content: center;`
* `jc:fe` -> `justify-content: flex-end;`
* `jc:fs` -> `justify-content: flex-start;`
* `jc:sa` -> `justify-content: space-around;`
* `jc:sb` -> `justify-content: space-between;`
* `l` -> `left: |;`
* `lh` -> `line-height: |;`
* `m` -> `margin: |;`
  - can add a number after this and many CSS snippets to specify a value
  - ex. `m20` -> `margin: 20px;`
* `mb` -> `margin-bottom: |;`
* `ml` -> `margin-left: |;`
* `mr` -> `margin-right: |;`
* `mt` -> `margin-top: |;`
* `o` -> `outline: |;`
* `p` -> `padding: |;`
* `pb` -> `padding-bottom: |;`
* `pl` -> `padding-left: |;`
* `pr` -> `padding-right: |;`
* `pt` -> `padding-top: |;`
* `r` -> `right: |;`
* `t` -> `top: |;`
* `ta:c` -> `text-align: center;`
* `ta:j` -> `text-align: justify;`
* `ta:r` -> `text-align: right;`
* `ta:l` or `ta` -> `text-align: left;`
* `ta:r` -> `text-align: right;`
* `td:l` -> `text-decoration: line-through;`
* `td:n` or td -> `text-decoration: none;`
* `td:u` -> `text-decoration: underline;`
* `tt:c` -> `text-transform: capitalize;`
* `tt:l` -> `text-transform: lowercase;`
* `tt:u` or tt -> `text-transform: uppercase;`
* `v:h` or v -> `visibility: hidden;`
* `v:v` -> `visibility: visible;`
* `va:b` -> `vertical-align: bottom;`
* `va:m` -> `vertical-align: middle;`
* `va:t` or va -> `vertical-align: top;`
* `w` -> `width: |;`
* `z` -> `z-index`
* `@media` or `@m` -> `@media screen { | }`

## Custom snippets
* see https://docs.emmet.io/customization/
