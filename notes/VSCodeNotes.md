VS Code Notes

* To install

  * browse https://code.visualstudio.com/https://code.visualstudio.com/

* Basics

  * can reopen recently edited files with File...Open Recent
  * to open the Command Palette, press cmd-P
  * to edit a file from a terminal, code {file-name}
    * will launch VS Code if not already running
    * otherwise will use existing VS Code session

* Command Palette

  * cmd-P to open

* Emmet

  * type a snippet and press tab to expand
  * shows expansion in a popup before tab is pressed
  * in React source files, .foo expands to <div className="foo"></div>

* Extensions - to install

  * click the "Extensions" square in the left button strip
  * search for a name
  * note the number of downloads and number of stars for each option
  * select one
  * press the "Install" button
  * after it finished, press the "Reload" button
    to use in current session
  * click on name of extension for documentation

* ESLint/TSLint extension

  * to jump to next error in Windows, press Fn-F8

* Flow extension

  * I disabled it because it uses too much CPU if no .flowconfig file is found

* Format Document

  * option-F

* Git

  * has really strong Git integration that is provided and enabled by default

* Go to

  * File - cmd-p
  * Symbol in File - cmd-O
    * only searches in current file
  * Symbol in Workspace - cmd-t
    * can find names in any file in workspace
  * cmd-hover over names to see in a popup
    and click to go to definition

* JavaScript

  * under "Customize" on "Welcome" screen, install support for JavaScript
  * has method name completion with documentation in popups
  * right-click a name to see a context menu of things than can be done including
    * Go to Definition
    * Peek Definition - shows in a dialog that can be dismissed
    * Go to Type Definition - only for TypeScript, not Flow?
    * Find All References
    * Rename Symbol - there and all references
    * Change All Occurrences - like "Rename Symbol", but live; may be buggy

* Markdown

  * stays up to date with changes in tab containing raw Markdown
  * to view source and preview side-by-side with live updating,
    click button in tab of the file
  * when finshed, close the preview tab
  * Prettier formats Markdown if you have it configured to "formatOnSave"

* Prettier extension

  * search for "prettier"
  * I selected "Prettier - Code formatter 1.2.2"
  * to format on save, add the following to user settings
    `"editor.formatOnSave": true`
  * it respects project-specific `.prettierrc` files

* Quokka.js extension

  * provides useful information about JavaScript and TypeScript code
  * just using free community version for now
  * doesn't seem to work when Flow types are present
  * Command Palette commands that start with "Quokka" include
    * Start On Current File
    * Stop Current
    * Stop All
    * Show Output
  * gutter squares
    * gray - source line is not covered by any tests
    * green - source line covered by at least one test
    * yellow - source line only partially covered by some test
      (branch code coverage level)
    * red - source line is the source of an error or failed expectation,
      or is in the stack of an error

* Terminal

  * press ctrl-` to open an integrated terminal (can run Fish!)

* TypeScript

  * under "Customize" on "Welcome" screen, install support for TypeScript

* User settings

  * many extensions can be configured by adding to user settings
  * to open, select Code...Preferences...Settings
    or click gear in lower-right and select Settings

* Vim extension

  * under "Customize" on "Welcome" screen, install keyboard shortcuts for Vim
  * can save with cmd-s in addition to :w
