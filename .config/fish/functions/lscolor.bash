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

usage() {
  echo invalid argument $0
  exit 1
}

# Use colors specified in switches.
for arg in "$@"; do
  extension=${arg%%=*}
  [[ -z $extension ]] && usage
  color=${arg##*=}
  [[ -z $color ]] && usage
  varName="${extension}Color"
  eval $varName=\${!color}
done

for file in *; do
  extension=${file##*.}
  if [[ $extension == $file ]]; then # no extension found
    color=$defaultColor
  else
    colorVar=${extension}Color
    color=${!colorVar}
    if [ -z $color ]; then
      color=$defaultColor
    fi
  fi
  echo -e "$color$file"
done
