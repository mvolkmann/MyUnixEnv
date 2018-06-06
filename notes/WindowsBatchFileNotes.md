# Windows Batch File Notes

- for more detail see
  <https://steve-jansen.github.io/guides/windows-batch-scripting/index.html>

- Comment lines

  - start with REM

- Line Continuation

  - can break long commands across multiple lines
    by ending each with ^
  - those are removed and lines are concatenated
    without adding any spaces

- Echo

  - on by default
  - turn on with "echo on"
  - turn off with "echo off"
  - when off, can echo with "echo:on some text"

- Running other .bat files

  - call {name}.bat

- Changing directories

  - use pushd {dir} and popd

- Clearing screen

  - cls

- Computer name
  - stored in COMPUTERNAME environment variable
  - output with echo %COMPUTERNAME%
