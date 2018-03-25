VS Code Notes

* To install

  * browse https://code.visualstudio.com/https://code.visualstudio.com/

* Basics

  * can reopen recently edited files with File...Open Recent
  * to open the Command Palette, press cmd-P
  * to edit a file from a terminal, code {file-name}
    * will launch VS Code if not already running
    * otherwise will use existing VS Code session

* Color Themes

  * default is "Dark+"
  * to change theme
    * click gear in lower-left and select "Color Theme"
      or select Code...Preferences...Color Theme
    , and select one from the menu
    * will be stored in settings as "workbench.colorTheme"
  * to customize colors for nearly everying in the editor, see
    https://code.visualstudio.com/docs/getstarted/theme-color-reference
  * to customize colors for specific syntax elements (tokens) in editor windows
    * modify settings
    * add "editor.tokenColorCustomizations" property
      where the value is an object with these keys:
      comments, functions, keywords, numbers, strings, types, and variables
    * each property has a color value that must be specified as a hex string
      * ex. "#ff00ff"
      * hover over these strings to get a color picker popup
    * for additional syntax elements, add "textMateRules" property
      * ex. to set colors of HTML tags and attributes
        ```
        "textMateRules": [
            {
                "name": "Tags",
                "scope": "entity.name.tag",
                "settings": {
                    "foreground": "#9ADCF8"
                }
            },
            {
                "name": "Attributes",
                "scope": "entity.other.attribute-name",
                "settings": {
                    "foreground": "#539BD9"
                }
            },
        ]
        ```
    * for more examples of textMateRules see
      https://github.com/idleberg/vscode-hopscotch/blob/master/themes/hopscotch.json
    * for more see
      https://code.visualstudio.com/docs/getstarted/themes#_customizing-a-color-theme

* Command Palette

  * cmd-P to open

* Command-line launching

  * enter "code" optionally followed by a file or directory name
    * by default opens current directory
  * in Linux and macOS need to add to PATH
    * in macOS add /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

* Emmet

  * type a snippet and press tab to expand
  * shows expansion in a popup before tab is pressed
  * in React source files, `.foo` expands to `<div className="foo"></div>`

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

* Font size
  * press cmd-plus or cmd-= (same key) to increase
  * press cmd-minus to decrease

* Format Document

  * option-F
  * yours is configured to use Prettier

* Full Screen

  * toggle with cmd-ctrlf

* Git

  * has really strong Git integration that is provided and enabled by default

* Go to

  * File - cmd-p
    * puts nothing at front of search string
  * Symbol in File - cmd-O
    * puts @ at front of search string
    * only searches in current file
  * Symbol in Workspace - cmd-t
    * puts # at front of search string
    * can find names in any file in workspace
  * Line - ctrl-g
    * puts : at front of search string
    * enter line number and press enter
  * Command Palette - cmd-P
    * puts > at front of search string
    * enter or select a command
  * change first character in search input to
    switch between these five types of searches
  * press esc to close input without going to anything
  * cmd-hover over names to see in a popup
    and click to go to definition
  * to go back press ctrl-minus
  * to go forward press ctrl-underscore

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

* Keyboard Shortcuts
  - to view, click gear icon in lower-left and select "Keyboard Shortcuts"
  - can search by text in associated commands
  - click pencil icon to left of one to change the shortcut
  - right-click to copy which allows having
    more than one shortcut for the same command

* Markdown

  * stays up to date with changes in tab containing raw Markdown
  * to view source and preview side-by-side with live updating,
    click button in tab of the file that shows
    side by side rectangles and a magnifying glass
  * when finshed, close the preview tab
  * Prettier formats Markdown if you have it configured to "formatOnSave"

* Moving Lines
  * don't have to select current line to move it
  * to move more than one line, select them
  * press option-up or option-down to move the line(s)
  * sometimes messes up indentation in JavaScript files

* Multiple Cursors
  * after selecting some text, press cmd-L to "Select All Occurrences"
  * now can edit all occurrences at the same time
  * when finished press esc to get out of multi-cursor moe

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

* Tab Navigation
  * to navigate to tabs to the right - "Open Next Editor",
    press ctrl-right (you added) cmd-{ or ctrl-tab
  * to navigate to tabs to the left - "Open Previous Editor",
    press ctrl-left (you added) cmd-} or ctrl-shift-tab

* Terminal

  * press ctrl-` to open an integrated terminal (can run Fish!)

* TypeScript

  * under "Customize" on "Welcome" screen, install support for TypeScript

* User settings

  * to open, select Code...Preferences...Settings
    or click gear in lower-right and select Settings
  * many extensions can be configured by adding to user settings
  * can use /* */ and // comments in this file
    * useful to temporarily disable settings
  * these are stored in ~/Library/Application\ Support/Code/User
    * can copy to another machine to share settings

* Vim extension

  * under "Customize" on "Welcome" screen, install keyboard shortcuts for Vim
  * can save with cmd-s in addition to :w
