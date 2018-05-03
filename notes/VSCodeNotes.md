# VS Code Notes

Keyboard shortcuts in these notes show the Windows version
followed by the macOS version in parentheses.

## Overview

* code editor from Microsoft
* implemented with the Electron framework
* mostly implemented in TypeScript
* mostly open source; see <https://github.com/Microsoft/vscode>

## To install

* browse <https://code.visualstudio.com/https://code.visualstudio.com/>

## Basics

* can reopen recently edited files with File...Open Recent
* to open the Command Palette, press ctrl-P (cmd-P)
* to edit a file from a terminal, code {file-name}
  * will launch VS Code if not already running
  * otherwise will use existing VS Code session
* reopens last set of tabs when restarted

## Auto Close Tag extension

* automatically adds closing tag when an opening tag is entered
* ex. entering `<span>` adds `</span>` after the cursor
* not good in JavaScript files that use generics or JSX with empty tags

## Auto Rename Tag extension

* automatically renames other side of tag when one is renamed
* ex. can change "header" to "footer" in either `<header>` or `</header>`

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

* adds a new section at the bottom of the Explorer left nav
* lists all the functions, classes, and methods defined
  in the current editor tab
* clicking a name scrolls to it in the editor tab

## Color Themes

* default is "Dark+"
* to change theme
  * click gear in lower-left and select "Color Theme"
    or select Code...Preferences...Color Theme
    and select one from the menu
  * use up and down arrow keys to navigate the list of themes
  * will update to show the theme colors as you navigate
  * will be stored in settings as "workbench.colorTheme"
* to customize colors for nearly everying in the editor, see
  <https://code.visualstudio.com/docs/getstarted/theme-color-reference>
* to customize colors for specific syntax elements (tokens)
  in editor windows
  * modify settings
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
* Explorer file names have a white circle before
  the names of files with unsaved changed
* can horizontally scroll through tabs
* right-click to get menu containing
  * Close, Close Others, Close to the Right, Close Saved, Close All
  * Copy Path
  * Reveal in Explorer
    * handle to open in another app that supports printing
  * Reveal in Side Bar
* keyboard shortcuts
  * ctrl-\ (cmd-\) to workbench.action.splitEditor
  * ctrl-w to workbench.action.closeActiveEditor (custom)
  * ctrl-left workbench.action.previousEditor (custom)
  * ctrl-right workbench.action.nextEditor (custom)
  * ctrl-n moves focus to nth editor group or split

## Emmet

* type a snippet and press tab to expand
* shows expansion in a popup before tab is pressed
* in React source files, `.foo` expands to `<div className="foo"></div>`
* to wrap selected lines with a new tag
  * open Command Palette and enter "Emmet: Wrap with Abbreviation"
  * will see preview
  * press enter to accept or esc to reject

## Error Navigation

* to jump to the next error, press F8
* to jump to the previous error, press shift-F8

## ESLint extension

* runs ESLint on JavaScript files
* uses version of ESLint in current project directory
  or global version if not found in project
* will use project .estingrc.json file if found

## Explorer

* can right-click a section title to decide which sections should be hidden
  * for example, you may want to hide the "Open Editors" section
* to delete a file
  * select and press delete key (cmd-delete)
  * will ask for confirmation to move to trash / recycle bin
    unless you check "Do not ask me again" (not advised)
* to move a file to a different directory
  * drag it
  * will ask for confirmation

## Extensions - to install

* click the "Extensions" square in the left button strip
* search for a name
* note the number of downloads and number of stars for each option
* select one
* press the "Install" button
* after it finished, press the "Reload" button
  to use in current session
* click on name of extension for documentation

## ESLint and TSLint extensions

* to jump to next error in Windows, press Fn-F8

## File Icon Theme

* controls icons displayed for specific file types and folders
* can download new themes
* to change
  * click gear in lower-left
  * select "File Icon Theme"
  * select one from the list
* use up and down arrow keys to navigate the list of themes
* will update to show the theme icons as you navigate

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

## Full Screen

* toggle with F11 (cmd-ctrl-f)

## Git

* has really strong Git integration that is provided and enabled by default
* source control icon in left nav
  * click to see lists of changes in each active repository
  * badge on icon shows number of uncommitted changes
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

## Go to

* File - ctrl-p (cmd-p)
  * puts nothing at front of search string
* Symbol in File - ctrl-O (cmd-O)
  * puts @ at front of search string
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

## Images

* when an image file is selected in the Explorer panel
  it is rendered in an editor tab

## Import Cost extension

* shows size in red to right of JavaScript imports

## Indenticator

* highlights current indentation depth by drawing a vertical line
  between the beginnings of the starting and ending lines of the block
* sensitive to column of cursor

## Intellisense

* opens automatically in most cases as you type
* can trigger manually with ctrl-space

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

## Key Bindings

* can install presets such as Vim key bindings as an extension
  * see "Vim emulation for Visual Studio Code"
  * supports some popular plugin features including
    easymotion, surround, commentary, indent-object, and sneak

## Keyboard Shortcuts

* to view, click gear icon in lower-left and select "Keyboard Shortcuts"
* can search by text in associated commands
* click pencil icon to left of one to change the shortcut
* right-click to copy which allows having
  more than one shortcut for the same command

## Left Nav

* a thin strip that does not include the "Explorer"
* contains buttons for major modes
  * Explorer - for files
  * Search
  * Source Control
  * Debug
  * Extensions
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

## Markdown

* stays up to date with changes in tab containing raw Markdown
* to view source and preview side-by-side with live updating,
  click button in tab of the file that shows
  side by side rectangles and a magnifying glass
* when finshed, close the preview tab
* Prettier formats Markdown if you have it configured to "formatOnSave"
  * renumbers ordered lists
* can customize CSS used in preview
  * add `markdown.styles": ["markdown.css"],` to settings
    and place the `.css` file in each workspace directory
* to see CSS classes used
  * open Command Palette
  * enter "Developer: Open Webview Developer Tools"
    which opens a Chrome devtools window
  * navigate to

## mardownlint extension

* lints Markdown files

## Minimap

* each editor tab includes a "minimap" on the right side
  which is a zoomed out view of the file
* can be useful for navigation and getting a sense of the file size
* but it takes up horizontal space
* to disable, add the following to settings:
  `"editor.minimap.enabled": false,`

## Moving Lines

* don't have to select current line to move it
* to move more than one line, select them
* press option-up or option-down to move the line(s)
* sometimes messes up indentation in JavaScript files

## Multiple Cursors

* after selecting some text, press ctrl-L (cmd-L)
  to "Select All Occurrences"
* now can edit all occurrences at the same time
* when finished press esc to get out of multi-cursor moe

## New Window

* to work on multiple sets of files simulatenously
  consider opening each set of tabs in a new window
* select File...New Window to open a new one

## Node.js

* to execute an npm script in `package.json` at top of workspace
  * select "Tasks: Run Task" from command palette
  * select a script from the list, all preceded by "npm:"
  * output goes in a new terminal window
  * supposedly can also parse tasks from Gulp and Grunt configuration files
* can define custom tasks in `tasks.json`
  * an advanced feature
  * should probably just use a `package.json` file
* no built-in ability to run Node code
  * could use an extension like "Code Runner"
* can open an embedded terminal, cd to code directory, and run `node` commands

## Open File

* in Windows, ctrl-o

## Organize Imports

* for JavaScript and TypeScript files
* open Commannd Palette and enter "Organize Imports"

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
* after using, look for "Prettier:" followed by a checkmark
  in lower-right to know if it worked
  * if not, will be followed by an X
  * click to see errors

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
  * click light blub icon
  * select one of
    * "Extract to inner function"
    * "Extract to function in module scope"
    * "Extract to constant in enclosing scope"
  * enter name for new function

## Search

* can for a string (default) or
  regular expression (toggle .\* button in popup)
  * do not surround regular expression with slashes
* can be case-sensitive (toggle button in popup)
* can only find whole words (toggle button in popup)
  * ex. when enabled, "class" does not match "className"
* to search only in current file, press ctrl-f (cmd-f)
* to search all files in current workspace,
  press ctrl-F (cmd-F) of select "View...Search"
* click left and right arrows in popup
  to move to previous and next matches
* search results are live and update as files are modified

## Sidebar

* where the Explorer, Search, Source Control, Debug, and Extensions panels are displayed
* to toggle display, ctrl-b (cmd-b)
  * the Vim extension overrides this keyboard shortcut,
    so you'll have to delete that shortcut to get the default one
  * I mapped this to ctrl-h (cmd-h) instead

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

## Sorting selected lines

* install "Sort lines" extension
* select lines
* press F9 or
  open Command Palette and enter "Sort Lines Ascending" command

## Synchronize Settings

* COULDN'T GET THIS TO WORK! settings.json never syncs
* useful when using VS Code from more than one computer
* install "Settings Sync" extension
* follow instructions to create a Github personal access token
  named "code-settings-sync"
* may need to restart VS Code
* press alt-U
* enter personal access token
* enter gist id?
* repeat on other computers
* select these commands from the Command Palette
  to automate uploads and downloads of settings changes
  * "Sync: Advanced Options > Toggle Auto-Download on Startup"
    * adds "sync.autoDownload": true to settings.json
  * "Sync: Advanced Options > Toggle Auto-Upload on Settings Change"
    * adds "sync.autoUpload": true to settings.json
* does it merge changes or overwrite them?

## Tab Navigation

* to navigate to tabs to the right - "Open Next Editor",
  press ctrl-right (I added) or ctrl-tab (cmd-{)
* to navigate to tabs to the left - "Open Previous Editor",
  press ctrl-left (I added) or ctrl-shift-tab (cmd-})

## Terminal

* press ctrl-` to open an integrated terminal (can run Fish!)

## Todo Highlight extension

* highlights TODO: and FIXME: in comments
* by default uses white text on a yellow background
* highly configurable
* to get a list of all these comments,
  open the Command Palette and enter
  "TODO-Highlight: List highlighted annotations"

## TypeScript

* under "Customize" on "Welcome" screen, install support for TypeScript

## User settings

* to open, select Code...Preferences...Settings
  or click gear in lower-right and select Settings
  or press ctrl-, (cmd-,)
* many extensions can be configured by adding to user settings
* validates all entries so only correct settings
  can be entered without warnings
* can use /\* \*/ and // comments in this file
  * useful to temporarily disable settings
* stored in the files settings.json and keybindings.json
  * in OS-specific locations
    * Windows: %APPDATA%\Code\User\
    * macOS: $HOME/Library/Application Support/Code/User/
    * Linux: $HOME/.config/Code/User/
  * can copy to another machine to share settings
  * also consider automating synchrononization of settings
    (described earlier)
* project-specific customizations
  * stored in project directory in .vscode directory
    * files are settings.json and keybindings.json
  * can check into version control so project team can share

## Vim extension

* under "Customize" on "Welcome" screen,
  install keyboard shortcuts for Vim
* can save with ctrl-s (cmd-s) in addition to :w

## vscode-icons extension

* adds file type icons in file view
* I don't see any change!

## Workspaces

* can save the opened folder as a workspace
  with File...Save Workspace As...
  * remembers the last opened tabs
* consider saving in a "VS Code Workspaces" directory
  under your home directory
  * or a directory that is backed up like One Drive
* later can reopen with File...Open Workspace...
  or by double-clicking a `.code-workspace` file

## Zen Mode

* hides all UI except the current editor panel and goes into full-screen mode
* ctrl-k z (cmd-k z) toggles
  * Vim plugin conflicts with this,
    so you mapped ctrl-z (cmd-z) to this
