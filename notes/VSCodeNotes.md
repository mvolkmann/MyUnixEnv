# VS Code Notes

Keyboard shortcuts in these notes show the Windows version
followed by the macOS version in parentheses.

## Overview

* code editor from Microsoft
* implemented with the Electron framework
* mostly implemented in TypeScript
* mostly open source; see <https://github.com/Microsoft/vscode>

## Installing

* browse <https://code.visualstudio.com/https://code.visualstudio.com/>
* can install the stable version (updated monthly)
  and/or the less stable "Insiders" build (updated daily)
* if both are installed, they do not share settings

## Basics

* can reopen recently edited files with File...Open Recent
* to open the Command Palette, press ctrl-P (cmd-P)
* to edit a file from a terminal, code {file-name}
  * will launch VS Code if not already running
  * otherwise will use existing VS Code session
* reopens last set of tabs when restarted

## Activity Bar

* the vertical strip on the left containing icons for
  various side bar content including Explorer, Search,
  Source Control, Debug, Extensions, and Outline (if installed)
* I mapped ctrl-A (cmd-A) to command to toggle visibility of this.

## Auto-Closing Brackets

* by default matching delimiters are entered automatically
* for example, typing { results in {} with the cursor between them
* to disable this, add the following to settings

```text
"editor.autoClosingBrackets": false,
```

## Auto Close Tag extension

* automatically adds closing tag when an opening tag is entered
* ex. entering `<span>` adds `</span>` after the cursor
* not good in JavaScript files that use generics or JSX with empty tags

## Auto Rename Tag extension

* automatically renames other side of tag when one is renamed
* ex. can change "header" to "footer" in either `<header>` or `</header>`

## Auto-Save

* to enable, change "files.autoSave" setting from "off"
  to "afterDelay", "onFocusChange" and "onWindowChange"
* by default "afterDelay" saves after every delay of 1000 milliseconds
  * to adjust, change "files.autoSaveDelay"

## Bottom Bar

* panel at bottom used to display tabs for
  PROBLEMS, OUTPUT, DEBUG CONSOLE, and TERMINAL
* I configured ctrl-B (cmd-B) to toggle display of this
* see "Error/Warning Navigation" section below

## Bracket Pair Colorizer extension

* "allows matching brackets to be identified with colors"
* "user can define which characters to match, and which colors to use"
* by default only (), [], and {} are matched
* by default the colors are yellow, magenta, and cyan

## Code Folding

* works in many kinds of source files including
  JavaScript, TypeScript, HTML, CSS, and Markdown
  * really nice for focusing work on specific sections
    in a Markdown file!
* to fold all blocks in the current editor,
  open Command Palette and enter "Fold All"
  * recommended for Markdown files
* to unfold all blocks in the current editor,
  open Command Palette and enter "Unfold All"
* to fold a specific block of code, click icon
  with minus in box to the left of the code
* to open a fold, click icon with plus in box
* to fold all block comments in the current editor,
  open Command Palette and enter "Fold All Block Comments"

## Code Hints

* look for light bulb icon or an ellipsis below code
* hover over to see hint

## Code Outline extension

* adds a left nav toggle button that displays a code outline
  in place of the EXPLORER when toggled on
* lists all the functions, classes, and methods defined
  in the current editor tab
* clicking a name scrolls to it in the editor tab

## Code Spell Checker extension

* green squiggly line appears below misspelled or unknown words
* move cursor onto word and a light bulb icon
  will appear at the beginning of the line
  * Why isn't the light bulb next to the word?
* click light bulb or press ctrl-. (cmd-.) to run "Show Fixes"
  * will see a list of suggestions and
    options to add the word to the global, folder, or workspace dictionary
* number of misspelled/unknown works appears in status bar
  after the information icon (circle with "i" inside)
  * click to see list of unknown words
    that can be clicked to navigate to them
* can add words to a dictionary
  * global, workspace-specific, or folder-specific
  * the global dictionary is in user settings
    in the "cSpell.userWords" property
  * the workspace dictionary is in workspace settings
    in the "cSpell.words" property
  * the folder dictionary is in folder settings
    in the "cSpell.words" property
* supports camel-case words by splitting them
  into multiple words and checking each
* by default, only enabled for these file types,
  but can add more
  * AsciiDoc, C, C++, C#, Go, Handlebars, HTML, JavaScript, JSON,
    LaTex, Markdown, PHP, Python, Text, TypeScript, and YAML
* indicates on left side of status bar
  whether the file type is enabled for spell checking
  and whether the current file has been checked
* to enable checking of the current file type,
  click status bar indicator and change the switch for
  "Spell Checker enabled for file type"

## Color Themes

* default is "Default Dark+" a.k.a. "Dark+ (default dark)"
* popular themes include Cobalt2 (by Wes Bos),
  Night Owl (by Sarah Drasner), and Material (by Mattia Astorino)
* to change theme
  * click gear in lower-left and select "Color Theme"
    or select Code...Preferences...Color Theme
    and select one from the menu
  * use up and down arrow keys to navigate the list of themes
  * will update to show the theme colors as you navigate
  * will be stored in settings as "workbench.colorTheme"
* to customize colors for nearly everything in the editor, see
  <https://code.visualstudio.com/docs/getstarted/theme-color-reference>
* to customize colors for specific syntax elements (tokens) in editor windows
  * modify user settings
  * add "editor.tokenColorCustomizations" property
    where the value is an object with these keys:
    comments, functions, keywords, numbers,
    strings, types, and variables
  * each property has a color value that
    must be specified as a hex string
    * ex. "#ff00ff"
    * hover over these strings to get a color picker popup
  * for additional syntax elements, add "textMateRules" property
    * ex. to set colors of HTML tags and attributes
      ```json
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
    <https://github.com/idleberg/vscode-hopscotch/blob/master/themes/hopscotch.json>
  * for more see
    <https://code.visualstudio.com/docs/getstarted/themes#_customizing-a-color-theme>

## Command Palette

* ctrl-P (cmd-P) or F1 to open
* type any letters in command name to narrow list

## Command-line launching

* enter "code" optionally followed by a file or directory name
  * by default opens current directory
* in Linux and macOS need to add to PATH
  * in macOS add /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

## Comments

* to toggle comment delimiters around current line or selected lines, ctrl-/

## CSS

* provides some CSS validation by default

## CSV extensions

* consider "Rainbow CSV"
  * highlights the data from each column in a different color
* consider "Excel Viewer"
  * provides a read-only table view of CSV and Excel files
  * can sort and filter the data

## Debug

* I mapped ctrl-D (cmd-D) to open this in the side bar.

## Debugging

* to debug non-Node applications
  install a language-specific debugger extension
* to debug non-server Node applications
  * open the folder containing the source file to be tested
  * open the source file to be tested
  * add breakpoints (described below)
  * click Debug button in left nav
    * don't need special configuration in launch.json
      for non-server code
  * click green triangle on left side of dropdown
  * use buttons in panel at top to Continue,
    Step Over, Step Into, Step Out,
    Restart, and Stop (exits debugging)
  * can drag debugging button panel left and right
  * panels on left display
    * VARIABLES
      * displays all in-scope variables and their values
      * can right-click a variable and select "Set Value" to change
    * WATCH
      * displays watch expressions
      * click + to add them
      * each will show the current value of the expression
    * CALL STACK
    * BREAKPOINTS
      * displays all breakpoints and options for them
  * enter expressions in the "Debug Console REPL"
    after > prompt at bottom
    * can be any JavaScript expression including
      just variable names that are in scope
* breakpoints
  * to create
    * click to left of a source line number
    * adds a red circle
  * to delete or disable
    * right-click red circle
    * select "Remove Breakpoint" or "Disable Breakpoint"
    * can also delete a breakpoint by clicking red circle
  * breakpoint types (3)
    * default - stop of every hit
    * Hit Count - stop after specific number of hits
    * Expression - stop when expression evaluates to true
    * to change type and configure, right-click breakpoint red circle
      and select type from dropdown
  * to add a "log point"
    * right-click to the left of a line number
      add select "Add Log Point..."
    * enter a message where expressions are enclosed in curly braces
    * ex. The sum is {a + b} now!
    * will display a red diamond icon in the gutter
* can configure to "Skip Code" you didn't write
  * like code from npm packages
* can perform debugging operations from Debug menu
* to debug server Node applications
  * suppose we want to debug server.js
  * open Command Palette and enter "Debug: Toggle Auto Attach"
    * will say "Auto Attach: On" in lower-left
  * add this script to package.json
    "debug": "node --inspect server.js"
  * open server.js
  * set breakpoints
  * click "Debug" icon in left nav
  * open Command Palette and enter "Task: Run Task"
    or select Tasks ... Run Task...
  * select "npm: debug"
  * select "Continue without scanning ..."
  * hit the server by enter a URL in a browser
  * server.js should be stopped at a breakpoint

## Developer Tools

* can inspect elements inside VS Code
* Help ... Toggle Developer Tools to open Chrome devtools

## Documentation

* hover over a function or method call
  to get documentation on it, if available

## Editor Tabs

* tabs for files containing unsaved changes have a white circle
  after the file name instead of an "X" for closing the tab:
* EXPLORER file names have a white circle before
  the names of files with unsaved changed
* can horizontally scroll through tabs
* right-click to get menu containing
  * Close, Close Others, Close to the Right, Close Saved, Close All
  * Copy Path
  * Reveal in EXPLORER
    * handle to open in another app that supports printing
  * Reveal in Side Bar
* keyboard shortcuts
  * ctrl-w workbench.action.closeActiveEditor (custom)
  * ctrl-left workbench.action.previousEditor (custom)
    * I also assigned ctrl-h to this based on the Vim cursor movement key "k".
  * ctrl-right workbench.action.nextEditor (custom)
    * I also assigned ctrl-l to this based on the Vim cursor movement key "k".
  * ctrl-{n} (cmd-{n}) moves focus to nth editor group or split
  * also see Splits

## Emmet

* type a snippet and press tab to expand
* shows expansion in a popup before tab is pressed
* in React source files
  * seems to work in JSX by default
  * `.foo` expands to `<div className="foo"></div>`
* to wrap selected lines with a new tag
  * open Command Palette and enter "Emmet: Wrap with Abbreviation"
  * will see preview
  * press enter to accept or esc to reject
* in an empty `.html` file, enter `!` and press tab
  to get default boilerplate content

## Error/Warning Navigation

* left side of status bar at bottom shows
  * number of errors preceded by icon with "X" in a circle
  * number of warnings preceded by icon with "!" in a triangle
  * click to see details in the "bottom bar"
    * this is also a way to get the OUTPUT, DEBUG CONSOLE, and TERMINAL tabs
  * click an error or warning to jump to the corresponding line
  * if a light bulb icon appears, clicking it may
    provide an option to automatically fix the issue
* to jump to the next error, press F8
* to jump to the previous error, press shift-F8

## ESLint extension

* runs ESLint on JavaScript files
* uses version of ESLint in current project directory
  or global version if not found in project
* will use project .eslintrc.json file if found

## Explorer

* displays a collection of various kinds of "explorers"
  * files, npm scripts, GitLens History, ...
* to open, click document icon in left nav or press ctrl-E (cmd-E)
* can right-click a section title to decide which sections should be hidden
  * for example, you may want to hide the "Open Editors" section
    * add user setting `"explorer.openEditors.visible": 0,`
* to delete a file
  * select and press delete key (cmd-delete)
    * I mapped the d key to this.
  * will ask for confirmation to move to trash / recycle bin
    unless you check "Do not ask me again" (not advised)
* to rename a file, right click and select "Rename"
  * I mapped the r key to this.
* to move a file to a different directory
  * drag it
  * will ask for confirmation
* I configured ctrl-T (cmd+T) to toggle display of this section
* use up and down arrow keys to move focus to a file

  * with Vim plugin
    * can also use "j" and "k" keys to move up and down
    * can use "gg" and "G" to move to top and bottom

* I configured the following keys in `keybindings.json` related to the Explorer

  * "f" to create a new folder (prompts for name)
  * "n" to create a new file (prompts for name)
  * "r" to rename the file under the cursor
  * "d" to delete the file under the cursor with confirmation.
  * enter key to open the file under the cursor

  ```json
  {
    "key": "enter",
    "command": "list.select",
    "when":
      "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !inputFocus"
  }
  ```

* errors and warnings
  * by default, names of files
    * containing no errors or warnings are white
    * containing errors are red
    * containing warnings and no errors are yellow
    * that have been modified are yellow
  * to the right of the file name
    * if there are any errors or warnings, the total number is displayed
    * if the file has been modified, "M" is displayed
  * names of folders containing files
    * with errors are red
    * with warnings and no errors are yellow

## Extensions

* to install
  * click the "Extensions" square in the left button strip
    or press ctrl-X (cmd-X)
  * search for a name
  * note the number of downloads and number of stars for each option
  * select one
  * press the "Install" button
  * after it finished, press the "Reload" button
    to use in current session
  * click on name of extension for documentation
* updates
  * by default, automatically checks for and installs extension updates

## ESLint and TSLint extensions

* to jump to next error in Windows, press Fn-F8

## File Icon Theme

* controls icons displayed for specific file types and folders
* can download new themes
  * "Material Icon Theme" and "vscode-icons" (described below) are popular
* to change
  * click gear in lower-left
  * select "File Icon Theme"
  * select one from the list
* use up and down arrow keys to navigate the list of themes
* will update to show the theme icons as you navigate

## File Operations

* to create a folder

  * right-click parent folder in EXPLORER and select "New Folder"
  * enter a folder name

* to create a file

  * right-click a folder in EXPLORER and select "New File"
  * enter a file name
  * can enter a path relative to the folder
    * missing folders will be created
    * ex. foo/bar/baz.txt

* to move a file to a different folder

  * drag it within the EXPLORER onto a different folder

* to delete a file or folder

  * select file in EXPLORER and press delete (cmd-delete)
  * respond to confirmation dialog
  * allows deleting folders containing files

* to rename a file

  * select file in EXPLORER and press F2 (enter)
    or right-click and select "Rename"
  * modify name and press enter or press esc to abort:w

* to copy a file

  * right-click file in EXPLORER and select "Copy"

* to paste a file after copying

  * right-click destination folder in EXPLORER and select "Paste"

* to reveal file in EXPLORER (Finder)
  * right-click file in EXPLORER and select "Reveal in \_\_\_"

## File Paths

* to get the file path of a file in an editor,
  right-click tab and select "Copy Path"

## Find All References

* right-click a name and select this from context menu
* displays all references in a "Peek" view
* press esc to dismiss

## Flow extension

* I disabled it because it uses too much CPU if no .flowconfig file is found

## Fonts

* family
  * recommend installing "Fira Code" font
    * "monospaced font with programming ligatures"
    * combines many two-character symbols into one
      * ex. =>, >=, !==
  * to use in VS Code editors, add these lines to settings.json
    ```json
    "editor.fontFamily": "Fira Code",
    "editor.fontLigatures": true,
    ```
* size
  * press ctrl-+ or ctrl-= (cmd-plus or cmd-=) to increase
  * press ctrl-minus (cmd-minus) to decrease

## Format Document

* alt-F (option-F)
* yours is configured to use Prettier
  * see "Prettier extension" below

## Full Screen

* toggle with F11 (cmd-ctrl-f)

## Git

* has really strong Git integration that is provided and enabled by default
* source control icon in left nav
  * badge on icon shows number of uncommitted changes
  * click to see lists of changes in each active repository
  * clicking "..." in upper-right of panel shows a context-sensitive menu
    containing many version control actions
* to commit changes
  * click name of repository under "SOURCE CONTROL PROVIDERS"
  * enter commit message in text field containing "Message" placeholder
  * click check mark above message or press ctrl-enter (cmd-enter)
* to push changes
  * click up arrow in lower-left preceded by
    the number of local commits that haven't been pushed yet
  * this really syncs with remote which both pulls and pushes
  * you assigned the keyboard shortcut ctrl-y (cmd-y) to this
* current branch is displayed in lower-left
* to create a branch
  * click current branch name in lower-left and click "+ Create new branch"
  * alternatively, open Command Palette and enter "Git: Create Branch..."
  * switches to that branch
* to switch to a different local branch
  * click branch name in lower-left
  * click one in the drop-down
* to see a list of the current local branches
  * click branch name in lower-left
  * don't click one in the drop-down unless you want to switch to it
* to merge a branch
  * select branch to merge to by clicking branch name in lower-left and selecting it
  * open Command Palette and enter "Git: Merge Branch..."
  * when finish, push this branch
* to push a branch, open Command Palette and enter "Git: Push"
* to delete a branch
  * switch to a different branch
  * open Command Palette and enter "Git: Delete Branch..."
  * select a repository (if files from more than one are open)
  * select branch to delete
  * ???
* it seems there is no way in VS Code to
  * view status by running "git status"
  * delete a remote branch
  * could do from an integrated terminal
* it may sometimes be necessary to click the refresh icon
  above the list of modified files to update the list

## GitLens extension

* press ctrl-G (cmd-opt-g) to activate
* adds a "GITLENS HISTORY" section in the EXPLORER pane
  * shows commit history for current file
  * click a commit to see the differences it introduced
* adds a "GITLENS" section in the SOURCE CONTROL pane
  * shows current branch and its relationship to origin
  * shows all branches and their commit histories
  * shows remotes, their branches, and their commit histories
    * expand a commit to see a list of files added/modified in the commit
    * click a file to see the diffs
  * shows all stashes
    * expand a stash to see a list of files added/modified
    * click a file to see the diffs
  * shows all tags
* adds about 20 new commands to the Command Palette that start with "GitLens:"
  * GitLens: Toggle Line Blame Annotations
    * click a line in a file to see
      * who modified it last
      * when it was last modified
      * the commit message for the last modification
    * by default, regardless of this setting, the first two items
      are shown on the right side of the status bar at the bottom
  * GitLens: Toggle File Blame Annotations
    * opens panel to left of file that shows (gutter blame)
      the commit message and how long ago each line was modified
    * hover over a section in the code or the new panel to see
      * who made the change
      * the exact date and time it was made
      * the commit SHA
      * and more
* and many more features

## Go to

* File - ctrl-p (cmd-p)
  * puts nothing at front of search string
  * performs a fuzzy search
    * ex. to see a list of all files in the project with "scss" extension,
      enter `*.scss`
  * press p repeatedly to move through list of recently opened files
    * press enter to select file under cursor
* Symbol in File - ctrl-O (cmd-O)
  * puts @ at front of search string
    * add : to group symbols by kind
  * only searches in current file
* Symbol in Workspace - ctrl-t (cmd-t)
  * puts # at front of search string
  * can find names in any file in workspace
* Line - ctrl-g (cmd-g)
  * puts : at front of search string
  * enter line number and press enter
* Command Palette - ctrl-P or F1 (cmd-P)
  * puts > at front of search string
  * enter or select a command
* change first character in search input to
  switch between these five types of searches
* press esc to close input without going to anything
* ctrl-hover (cmd-hover) over names to see in a popup
  and click to go to definition
  * can also right-click and select "Go to Definition"
  * to see definition in a peek view,
    right-click and select "Peek Definition"
  * to go back press alt-left (ctrl-minus?)
    * I changed to cmd-left on macOS
  * to go forward press alt-right (ctrl-underscore?)
    * I changed to cmd-right on macOS

## Hot Exit

* by default when VS Code is exited, all unsaved changes are remembered
  and are reapplied when the app is restarted
  * called "hot exit"
  * no warning about unsaved changes is provided
* to disable this, add the setting `files.hotExit: "off"`
  * with this disabled, a warning is provided if there is an attempt
    to exit the app without saving changes
  * if you choose to exit anyway, the changes will be lost

## Images

* when an image file is selected in the EXPLORER panel
  it is rendered in an editor tab and its width, height, and file size
  are displayed on the right side of the status bar at the bottom

## Import Cost extension

* shows size in red to right of JavaScript imports

## Indentation

* by default, draws vertical lines to indicate beginning and ending of code blocks
* can customize line color in settings with

  ```json
  "workbench.colorCustomizations": {
    "editorIndentGuide.activeBackground": "#0000ff"
  }
  ```

## Intellisense

* opens automatically in most cases as you type
* can trigger manually with ctrl-space
* works in `package.json` files to complete key names,
  npm package names, and their versions

## JavaScript

* under "Customize" on "Welcome" screen, install support for JavaScript
* has method name completion with documentation in popups
* right-click a name to see a context menu of things than can be done including
  * Go to Definition
  * Peek Definition - shows in a dialog that can be dismissed
  * Go to Type Definition - only for TypeScript, not Flow?
  * Find All References
  * Rename Symbol - there and all references
  * Change All Occurrences - like "Rename Symbol", but live; may be buggy

## JS Refactor extension

* NOT CURRENTLY WORKING!
  * see <https://github.com/cmstead/js-refactor/issues/69>
* <https://github.com/cmstead/js-refactor>
* usage
  * select code to refactor
  * open Command Palette
  * enter name of refactoring (all start with "JS Refactor: ")
* common refactorings
  * Extract Method
  * Extract Variable
  * Inline Variable
  * Rename Variable (Alias of VS Code internal command)
* other utilities
  * Arrow Function
  * Async Function
  * Condition
  * Convert To Arrow Function
  * Convert To Function Expression
  * Convert To Template Literal
  * Export Function
  * Function
  * Generator
  * IIFE
  * Introduce Function
  * Lift and Name Function Expression
  * Negate Expression
  * Shift Parameters
  * Try/Catch
  * Wrap selection options:
* snippets
  * Anonymous Function (anon)
  * Arrow Function (arrow)
  * Async Function (async)
  * Condition Block (cond)
  * Console Log (log)
  * Export statement -- single variable (export)
  * Export statement -- object literal (exportObj)
  * Function (fn)
  * Generator (generator)
  * Lambda function (lfn)
  * Immediately Invoked Function Expression (iife)
  * Member Function (mfn)
  * Prototypal Object Definition (proto)
  * Require statement (require)
  * Try/Catch Block (tryCatch)
  * Use Strict (strict)

## Key Bindings

* can install presets such as Vim key bindings as an extension
  * see "Vim emulation for Visual Studio Code"
  * supports some popular plugin features including
    easymotion, surround, commentary, indent-object, and sneak

## Keyboard Shortcuts

* to view, click gear icon in lower-left and select "Keyboard Shortcuts"
  * I mapped ctrl+K (cmd+K) to open this.
* can search by text in associated commands
* can search by keyboard shortcut (ex. "ctrl+y" or "shift+cmd+x")
* click pencil icon to left of one to change the shortcut
* right-click to copy which allows having
  more than one shortcut for the same command
* right-click a keyboard shortcut and select "Show Same Keybindings"
  to see if a conflict has been created
* important shortcuts I have configure
  * also described elsewhere in this document
  * all are ctrl (cmd) followed by an uppercase letter
  * A - toggle activity bar
  * B - toggle bottom bar (Toggle Panel)
  * D - show Debug
  * E - show Explorer
  * F - show Search (Find)
  * K - show Keyboard Shortcuts
  * M - toggle minimap
  * N - new Window (press ctrl-r to select a previous workspace)
  * O - show Outline
  * P - open Command Palette
  * S - toggle side bar
  * T - toggle status bar
  * U - show User Settings
  * W - quick switch window (hold and use arrow keys to move to window name to open)
  * X - show Extensions
  * Z - toggle zen mode
  * | - split editor

## Left Nav

* a thin strip that does not include the "EXPLORER"
* contains buttons for major modes (my custom keyboard shortcuts show)
  * Explorer (for files) - ctrl-E (cmd-E)
  * Search - ctrl-F (cmd-F) for "find" (using S for Side Bar)
  * Source Control - ctrl-V (cmd-V) for "Version Control"
  * Debug - no keyboard shortcut
  * Extensions - ctrl-X (cmd-X)
* contains gear icon
  * click to access Command Palette, Settings, Keyboard Shortcuts,
    Manage Extensions, User Snippets, Color Theme,
    File Icon Theme, and Check for Updates...

## Line Feed Characters

* the type of line feed characters used in the current file
  are displayed in the lower-right (ex. LF or CRLF)
* to change, click that and select a different value from a
  drop-down that will appear at the top-center of the window

## Line Numbers

* by default line numbers are on
* change by setting "editor.lineNumbers" in user settings
* valid values are "on", "off", and "relative"
* to toggle this or any setting, see the "Settings Cycler extension" section

## Markdown

* can view source and preview side-by-side with live updating,
  * click button in tab of the file that shows
    side by side rectangles and a magnifying glass
* stays up to date with changes in tab containing raw Markdown
* when finished, close the preview tab
* Prettier formats Markdown if you have it configured to "formatOnSave"
  * renumbers ordered lists and more
  * see "Prettier extension" below
* can customize CSS used in preview
  * add `markdown.styles": ["markdown.css"],` to settings
    and place the `.css` file in each workspace directory
  * yours is in ~/MyUnixEnv/notes/markdown.css
* to see CSS classes used
  * open Command Palette
  * enter "Developer: Open Webview Developer Tools"
    which opens a Chrome devtools window
  * navigate to
* keyboard shortcuts
  * ? (cmd-opt-0) toggle between vertical and horizontal splits

## markdownlint extension

* lints Markdown files

## Minimap

* each editor tab includes a "minimap" on the right side
  which is a zoomed out view of the file
* can be useful for navigation and getting a sense of the file size
* but it takes up horizontal space
* to disable, add the following to settings:
  `"editor.minimap.enabled": false,`
* I mapped ctrl-M (cmd-M) to toggle display of this.

## Moving Lines

* don't have to select current line to move it
* to move more than one line, select them
* press option-up or option-down to move the line(s)
* sometimes messes up indentation in JavaScript files

## Multi-Cursor Editing

* after selecting some text, press ctrl-L (cmd-L)
  to "Select All Occurrences"
* now can edit all occurrences at the same time
* when finished press esc to get out of multi-cursor moe
* I don't understand why this feature is so popular.

## New Window

* to work on multiple sets of files simultaneously
  consider opening each set of tabs in a new window
* select File...New Window to open a new one

## Node.js

* no built-in ability to run Node code
  * could use an extension like "Code Runner"
* can open an embedded terminal, cd to code directory, and run `node` commands
* also see npm section
* also see Debugging ... "to debug server Node applications"

## npm

* two options to execute an npm script in `package.json` at top of workspace

  * option #1

    * add "NPM SCRIPTS" section to EXPLORER by
      adding the following in user setting

      ```json
      "npm.enableScriptEXPLORER": true,
      ```

    * displays a list of all scripts found in package.json for the workspace
    * click a script name to open package.json and scroll to its definition
    * right-click to see context menu containing
      * "Open" (same as clicking),
      * "Run"
      * "Debug" (see Debugging ... "to debug server Node applications")

  * option #2
    * select "Tasks: Run Task" from Command Palette
    * select a script from the list, all preceded by "npm:"
    * output goes in a new terminal window
    * supposedly can also parse tasks from Gulp and Grunt configuration files

* can define custom tasks in `tasks.json`
  * an advanced feature
  * should probably just use a `package.json` file

## Open File

* in Windows, ctrl-o

## Organize Imports

* for JavaScript and TypeScript files
* open Command Palette and enter "Organize Imports"
* doesn't work with Flow type imports
* can automate on save with

  ```json
  "editor.codeActionsOnSave": {
    "source.organizeImports": true
  },
  ```

## Outline

* shows a list of the functions, classes, and methods in a source file
* click one to navigate to it
* to open, click outline icon in left nav
  * I mapped ctrl+O (cmd+O) to this
    which was the shortcut for File...Open...

## Peek View

* displays results of several commands in an inline popup view
  * one example is "Find All References"
* list of references is on right
* source lines for selected reference is on left
  * can edit here
* can resize height of peek view by dragging bottom border
* to dismiss, press esc or click "x" in upper-right

## Perforce integration

* install "Perforce for VS Code" extension
* add the following to settings
  "perforce.activationMode": "always",
  "perforce.addOnFileCreate": true,
  "perforce.client": "{perforce-user-id}.v2s",
  "perforce.deleteOnFileDelete": true,
  "perforce.editOnFileModified": true,
  "perforce.editOnFileSave": true,
  "perforce.password": "{perforce-password}",
  "perforce.port": "ussl017:1666",
  "perforce.user": "{perforce-user-id}",`

## Prettier extension

* search for "prettier"
* I selected "Prettier - Code formatter 1.2.2"
* to format on save, add the following to user settings
  `"editor.formatOnSave": true`
* respects project-specific `.prettierrc` files
* hover over "Prettier" in the lower-right corner
  to see the version it is using
* will use version installed as dev dependency
  in package.json if present
* after using, look for "Prettier:" followed by a check mark
  in lower-right to know if it worked
  * if not, will be followed by an X
  * click to see syntax errors in your code that prevented formatting

## Preview Mode

* by default, clicking a file in the EXPLORER panel
  will open it in "Preview Mode"
* if no edits are performed and another file is clicked,
  it will open in the same tab, replacing the previous file
* to force always opening in a new tab, add the setting
  `"workbench.editor.enablePreview": false,`

## PrintCode extension

* adds PrintCode to Command Palette
* I configured keyboard shortcut alt+P (opt+P)
* opens URL in default browser and invokes print command for you
  * doesn't work in IE, but can copy URL to another browser
  * uses the same URL for all requests,
    so can just refresh other browser
* can optionally configure print options
* press "Print" button
  and print from there

## Quokka.js extension

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

## Refactoring

* to rename a symbol
  * can rename from any reference, not just definition
  * right-click and select "Rename Symbol"
  * enter new name
  * will change all occurrences
  * files with changes are not automatically saved; must do manually
* to extract code from a function or method
  into a new function or method
  * select lines of code
  * click light bulb icon
  * select one of
    * "Extract to inner function"
    * "Extract to function in module scope"
    * "Extract to constant in enclosing scope"
  * enter name for new function

## Reporting Issues

* select Help ... Report Issues
* fill in the provided template
* press "Preview on Github"
* verify contents
* press "Submit new issue"

## Save

* I configure both ctrl-s and cmd-s to save the current file.

## Search

* to open, click magnifying glass icon in left nav
  or press ctrl-F (cmd-F) for "find"
  * I mapped ctrl-S (cmd-S) and ctrl-F (cmd-F) to this
    which was workbench.action.files.saveAs
* can search for a string (default) or
  regular expression (toggle .\* button in popup)
  * do not surround regular expression with slashes
* can be case-sensitive (toggle button in popup)
* can only find whole words (toggle button in popup)
  * ex. when enabled, "class" does not match "className"
* to search only in current file, press ctrl-f (cmd-f)
* to search all files in current workspace,
  press ctrl-F (cmd-F) of select "View...Search"
* can specify files to include and exclude
  using glob patterns
* click left and right arrows in popup
  to move to previous and next matches
* search results are live and update as files are modified

## Selection

* "Expand Select" and "Shrink Select" commands
  * changes current selection in increments of
    * inside pair of delimiters
    * include the delimiters
    * entire line
    * enclosing block
  * to "Expand Select", press cmd-ctrl-shift-right arrow
  * to "Shrink Select", press cmd-ctrl-shift-left arrow
* "Expand Bracket Selection" command
  * similar to "Expand Select" but only moves to inside delimiters
  * no corresponding shrink command

## Settings

* to open, select Code...Preferences...Settings
  or click gear in lower-right and select Settings
  or press ctrl-, (cmd-,)
  * I mapped ctrl-U (cmd-U) for "User Settings" to open this.
* left side shows available settings
* right side shows settings that have been customized
  * has separate tabs for settings that are
    global, workspace-specific, and folder-specific
* many extensions can be configured by adding to user settings
* validates all entries so only correct settings
  can be entered without warnings
* can search for known settings containing given text
  using the search field at the top
  * search is fuzzy
  * hover over a found setting on the left side
    and click the pencil icon that appears
    to select a value and add it to the right side
    which shows the settings to be saved
  * ex. enter "lig" to find the setting "editor.fontLigatures"
    which is false by default
* can use /\* \*/ and // comments in this file
  * useful to temporarily disable settings
* stored in the files settings.json and keybindings.json
  * in OS-specific locations
    * Windows: %APPDATA%\Code\User\
    * macOS: $HOME/Library/Application Support/Code/User/
    * Linux: $HOME/.config/Code/User/
  * can copy to another machine to share settings
  * also consider automating synchronization of settings
    (described earlier)
* project-specific customizations

  * stored in project directory in .vscode directory
    * files are settings.json and keybindings.json
  * can check into version control so project team can share

* Settings Cycler extension
  * to configure, modify user settings and add a keybinding
  * for example, to enable toggling of line number display in editors
    * add the following to user settings
      ```json
      "settings.cycle": [
        {
          "id": "editor.lineNumbers",
          "values": [
            {
              "editor.lineNumbers": "on"
            },
            {
              "editor.lineNumbers": "off"
            }
          ]
        }
      ],
      ```
    * add the following in `keybindings.json`
      ```json
      {
        "key": "shift+cmd+l",
        "command": "settings.cycle.editor.lineNumbers"
      }
      ```

## Settings Sync extension

* useful when using VS Code from more than one computer
  or just to have an offline backup of settings
* saves many things

  * date and time of last upload
  * list of installed extension and their versions
  * custom keybindings including Windows and macOS versions
  * user settings
  * custom snippets for each language (JavaScript, TypeScript, ...)
  * custom icons

* install "Settings Sync" extension
* follow instructions to create a Github personal access token
  named "code-settings-sync"
* repeat on other computers
* may need to restart VS Code
* to automate uploads and downloads of settings changes
  select these commands from the Command Palette
  * "Sync: Advanced Options > Toggle Auto-Download on Startup"
    * adds "sync.autoDownload": true to user settings
    * false by default
  * "Sync: Advanced Options > Toggle Auto-Upload on Settings Change"
    * adds "sync.autoUpload": true to user settings
    * false by default
* to request a download of settings without restarting, press alt-D (opt-D)
* to request an upload of settings, press alt-U (opt-U)
* to see the gist it creates, browse <https://gist.github.com/mvolkmann>
  and look for mvolkmann/cloudSettings
* does it merge changes or overwrite them?
* to share your settings with others
  * by default, a secret Gist is created and only you can see it
  * to create a new, public Gist that can be shared with others,
    open the Command Palette, select "Sync : Advanced Options"
    and select "Share Settings with Public GIST"
    * replaces the private Gist with a public one
  * other users can download settings from your public Gist,
    but they can't upload their settings to your Gist

## Sidebar

* where the EXPLORER, Search, Source Control, Debug, and Extensions panels are displayed
* to toggle display, ctrl-S (cmd-S)

## Snippets

* to define custom snippets
  * click gear in lower-left
  * select "User Snippets"
  * select an existing snippets .json file,
    the language to which it will apply (creates {language}.json file),
    or "New Global Snippets file..."
  * copy the commented-out template or an existing snippet
  * modify the prefix and body
  * body can include placeholders in the form ${n:initial-value}
    where n is an integer starting at 1
    * use duplicate numbers for placeholders
      that should be replaced by the same value
  * optionally add a description
* multiple choice placeholder
  * ex. ${1|foo, bar, baz| }
* placeholder variables inside ${ }
  * CLIPBOARD - clipboard contents
  * TM_CURRENT_LINE - contents of current line
  * TM_CURRENT_WORD - word under cursor or empty string
  * TM_DIRECTORY - directory of current document
  * TM_FILENAME - current filename including extension
  * TM_FILENAME_BASE - current filename without extensions
  * TM_FILEPATH - full path of the current document
  * TM_LINE_INDEX - zero-based line number
  * TM_LINE_NUMBER - one-based line number
  * TM_SELECTED_TEXT - currently selected text or empty string
  * and many more
* to use a snippet
  * enter its name
  * select it from the popup of suggestions
    or press enter to select the first suggestion
  * typing automatically replaces the first placeholder
  * press tab to navigate to next placeholder
  * typing appends to default value, maybe only in Vim mode
    * perhaps a reason to only have a
      default value for the first placeholder
* for more detail, see
  <https://code.visualstudio.com/docs/editor/userdefinedsnippets>

## Sort Lines extension

* select lines
* press F9 or
  open Command Palette and enter "Sort Lines Ascending" command
  or one of the many other sorting options

## Source Control

* works with many version control systems, especially Git
  * see "Git" section
* to open, click branch icon in left nav
  * I mapped ctrl-G (cmd-G) to this
    which was "Find Next"

## Splits

* can split editor to see current file in multiple panes
* can open any number of files each each pane
* keyboard shortcuts
  * to split editor
    * View ... Split Editor
    * or press ctrl-\ (cmd-\)
  * to toggle between vertical and horizontal splits
    * View ...Toggle Editor Group Layout
    * or press alt-shift-0 (cmd-opt-0)
  * to move to a specific pane
    * ctrl-{pane-number} (cmd-{pane-number})
  * to move to previous/next editor, even across panes
    * ctrl-left/right (same in macOS)

## Stack Traces

* in macOS, cmd-clicking a stack trace line number
  in a terminal (integrated or not)
  opens the source in VS Code
  * How does it do this?
  * Is there an equivalent in Windows?

## Status Bar

* single-line section at bottom that displays status information
* can toggle display with the "Toggle Status Bar Visibility" command
  * I mapped this to ctrl-T (cmd-T).

## Tab Navigation

* to navigate to tabs to the right - "Open Next Editor",
  press ctrl-right (I added) or ctrl-tab (cmd-{)
* to navigate to tabs to the left - "Open Previous Editor",
  press ctrl-left (I added) or ctrl-shift-tab (cmd-})

## Terminal

* press ctrl-` (even in macOS) to open an integrated terminal (can run Fish!)
* press ctrl-C (cmd-C) to open a native terminal (Command Prompt in Windows)
  in the workspace directory

## Todo Highlight extension

* highlights TODO: and FIXME: in comments
* by default uses white text on a yellow background
* highly configurable
* to get a list of all these comments,
  open the Command Palette and enter
  "TODO-Highlight: List highlighted annotations"

## TypeScript

* under "Customize" on "Welcome" screen, install support for TypeScript

## Version Lens extension

* "shows the latest version for each package" in package.json
* look for packages that are not preceded by "Latest"
* clicking a version link updates `package.json` to refer to that version,
  but `npm install` must be run to actually install it

## Vim extension

* under "Customize" on "Welcome" screen,
  install keyboard shortcuts for Vim
* can save with ctrl-s (cmd-s) in addition to :w
* / search is case-insensitive unlike in real Vim
* to paste text that was copied to the system clipboard,
  perhaps in another application, press p, not ctrl-v
* just like in Vim
  * z-enter moves current line to top
  * zz moves current line to center

## vscode-database extension

* for querying MySQL and PostgreSQL databases

## vscode-icons extension

* adds file type icons in file view
* open Command Palette and enter "Icons: Activate VSCode Icons" to activate
* "Material Icon Theme" is also popular, but I prefer this icon set
  because they stand out a little less

## Windows

* can open multiple VS Code windows, each editing a different workspace
* to open a new window, select File...New Window
  or press ctrl-N (cmd-N)
* after opening a new window,
  the easiest way to load a workspace into it is to
  click a link under "Recent" in the "Welcome" page
  or press ctrl-r
* to switch windows
  * to cycle between all windows in the same app (not specific to VS Code)
    * in macOS, press cmd-`
    * in Windows (pre-10) there are two options
      * ctrl-click the app task bar icon repeatedly
      * hold down the Windows key and press the task bar number
        * drag VS Code to the beginning so the number is
    * in Windows 10, press alt-`
  * the "Switch Window" command opens a dropdown of window names
    from which one can be selected
    * hold and use arrow keys to move to window name to open
  * the "Quick Switch Window" command
    * press ctrl-W (cmd-W) to run
    * I mapped ctrl-W to the workbench.action.quickWindowSwitch command
      and removed the key mappings for workbench.action.closeWindow.
* by default, clicking in a VS Code window also processes
  the thing in the window that is clicked
  * ex. clicking a file in the Explorer opens that file
  * to make it so clicking in a window just moves the focus there
    add the setting `"window.clickThroughInactive": false,`

## Workspaces

* can save the opened folder as a workspace
  with File...Save Workspace As...
  * remembers the last opened tabs
* consider saving in a "VS Code Workspaces" directory
  under your home directory
  * or a directory that is backed up like One Drive
* later can reopen with File...Open Workspace...
  or by double-clicking a `.code-workspace` file
* can switch to another workspace within a window
  by pressing ctrl-r
  * a dropdown list of workspace names will be displayed
  * doesn't work when using the Vim plugin and an editor has focus

## Zen Mode

* hides all UI except the current editor panel and goes into full-screen mode
* ctrl-k ctrl-z (cmd-k cmd-z) toggles
  * Vim plugin conflicts with this,
    so I mapped ctrl-Z (cmd-Z) to this
