#!/bin/bash
# This lists all files in the current directory, but files
# with certain extensions are output with specific colors.
# There are default colors for files with
# the extensions .html, .css, .js, and .scss files.
# These can be overridden and colors for other file extensions
# can be specified with arguments of the form extension=color.
# Files with unspecified extensions have a default color of white.
# For example, lscolor fish=magenta js=cyan

# Color ANSI escape sequences
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
orange='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m' # magenta
cyan='\033[0;36m'
yellow='\033[1;33m'
white='\033[1;37m'

# Default colors
cssColor=$green
defaultColor=$white
htmlColor=$blue
jsColor=$red
scssColor=$green

# Use colors specified in switches.
for arg in "$@"; do
  IFS="="
  pieces=$arg
  if [ ${#pieces[@]} -lt 2 ]; then
    echo 'invalid argument "'$arg'"'
    return 1
  fi
  extension=${pieces[0]}
  color=${pieces[1]}
  varName="${extension}Color}
  eval $varName=$color
done

for file in *; do
  IFS="."
  pieces=$file
  if [ ${#pieces[@]} -ge 2 ]; then
    extension=${pieces[1]}
    varName="${extension}Color"
    color=eval $$varName
    if [ -z $color ]; then
      color=$defaultColor
    fi
  else
    color=$defaultColor
  fi
  #set_color $color
  echo $file
done
