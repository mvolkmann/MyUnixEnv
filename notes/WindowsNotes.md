# Windows Notes

## Administrator

- to open a Command Prompt as Administrator

  - right-click task bar icon
  - right-click "Command Prompt"
  - click "Run as administrator"

## Command Aliases

- to create command aliases, enter `doskey name=command`
- to list the ones defined, enter `doskey /macros`

## Command Prompt startup

- to have a `.bat` file that automatically runs
  for each new Command Prompt that is opened
  (like `.bash_profile` in the bash shell)

  - create a `.bat` file (ex. `profile.bat` in home directory)
  - run `regedit`
  - go to HKEY_CURRENT_USER\Software\Microsoft\Command Processor
  - right-click and select New...String value
  - enter `AutoRun`
  - right-click "AutoRun" and select Modify...
  - enter full path to the .bat file
  - add commands to the .bat file such as
    - setting environment variables (including PATH)
    - defining aliases with doskey
    - probably want "echo off" at top

## Command Prompt Paste

- to paste into a command prompt window

  - option #1
    - right-click title bar and select Edit ... Paste
  - option #2
    - alt-space e p
  - option #3
    - enable QuickEdit in Command Prompt options
    - right-click mouse to paste
  - option #4
    - <https://dennisbabkin.com/clc/>

## Command Prompt Title

- to change the title of a command prompt window,
  enter `title some name with no quotes`

## DOS commands

- to delete a directory and everything inside it without prompting,
  enter `rmdir /s /q {dir}`
- to copy a directory recursively,
  enter `xcopy /s {src} {dest}`

## File Readability

- to make a file read-only, `attrib +r {file-name}`
- to make a file writable, `attrib -r {file-name}`
- to view whether files are writable, `attrib -r {file-name}`
  - second column will be "R" if read-only and empty if writable
- file-name can contain wildcards to process multiple files

## Help

- to get help on a command, enter `{command-name} /?`

## IP Address

- enter `ipconfig` in a Command Prompt window
- to map IP addresses to names, add lines to
  C:\Windows\system32\drivers\etc\hosts
  - ex. 141.102.95.154 dogstar

## Keyboard Layout

- to make Caps Lock key to be a Ctrl and keep existing Ctrl keys
- need admin rights
- run `regedit`
- navigate to HKEY_LOCAL_MACHINE...SYSTEM...
  CurrentControlSet...Control...Keyboard Layout
- right-click and select "New" to create a new key
- enter `Scancode Map` for the key name
- right-click and select "Modify Binary Data..."
- enter (These codes seem to have changed!)
  00 00 00 00 00 00 00 00
  02 00 00 00 1D 00 3A 00
  00 00 00 00
- restart

## Kill Listening Process

- create `klp.bat` in a directory in PATH containing:

  ```text
  @echo off
  REM This is not working yet!
  REM for /F "delims=\n" %%i in ('netstat -ano') do echo %%i
  for /F "tokens=4" %%i in ('netstat -ano') do echo %%i
  ```

- to kill the process listening on a given port

  - open a cygwin terminal as administrator
  - enter `klpw {port-number}`
  - this uses `netstat -ano`
    greps for the port number preceded by a colon,
    and finds the process number in the 5th token

## List Files

- to list files recursively

  - `dir /s {file-pattern}`
    - ex. `dir /s \*.ts`
  - your `ls` alias can be used in place of `dir`
  - to exclude files in node_modules directories,
    pipe `dir` command to `findstr /v /i node_modules`
  - to page the output, pipe to more command

## Screen Capture

- press shift-Prnt Scrn to capture the whole screen in the clipboard
- press Alt-Prnt Scrn to capture only the current window in the clipboard
- paste it an application that accepts pasting images
  - such as WordPad or PowerPoint
  - WordPad can edit RTF files

## Symbolic Links

- to create a soft symbolic link

  - run a command prompt as administrator
  - `mklink /D {link-name} {target-file-or-directory}`

## USB devices

- sometimes USB devices aren't assigned a drive letter
  or are assigned the same drive letter already used by another device
  or aren't assigned the letter yo want them to have
- to fix this
  - start...Control Panel...Administrative Tools...
    Computer Management...Storage...Disk Management
  - right-click the USB device
  - select "Change Drive Letter and Paths..."
  - in the dialog that appears,
    drive letters can be added, changed and removed

## which command

- Command Prompt doesn't support this,
  but it does have the "where" command
  which seems to be the same thing
- you added a doskey alias from which to where in profile.bat

## Zip files

- can create a zip file from a command prompt
  For example, to create a zip file containing
  all the files in the folder foo, run the following:
  `zip -r foo.zip foo`
- to see contents of a zip file,
  `unzip -l foo.zip`
- to extract the contents of a zip file,
  `unzip foo.zip`
