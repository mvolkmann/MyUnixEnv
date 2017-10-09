#!/bin/bash

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
normal='\033[0m'

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
    exit 1
  fi
  extension=${pieces[0]}
  color=${pieces[1]}
  varName="${extension}Color}"
  eval $varName=$color
done

for file in *; do
  extension=${file##*.}
  # Two brackets is the only safe way!
  if [[ $extension == $file ]]; then  # no extension was found
    color=$defaultColor
  else
    colorName=${extension}Color
    color=${!colorName}
    if [ -z $color ]; then
      color=$defaultColor
    fi
  fi
  echo -e "$color$file"
done
