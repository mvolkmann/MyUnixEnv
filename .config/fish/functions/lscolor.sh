#!/usr/bin/env bash

# Color ANSI escape sequences
declare -A colors
colors[black]='\033[0;30m'
colors[red]='\033[0;31m'
colors[green]='\033[0;32m'
colors[orange]='\033[0;33m'
colors[blue]='\033[0;34m'
colors[purple]='\033[0;35m' # magenta
colors[cyan]='\033[0;36m'
colors[yellow]='\033[1;33m'
colors[white]='\033[1;37m'

# Default and predefined extension colors
declare -A extColors
extColors[default]=white
extColors[css]=green
extColors[html]=blue
extColors[js]=red
extColors[scss]=green

usage() {
  echo "  use: $0 [fileExtension=color ...] [default=DefaultColor]"
  echo "       where color can be black, red, green, orange, blue, purple, cyan, yellow, or white"
  exit -1
}

# Use colors specified in options.
for arg in "$@"; do
  extension=${arg%%=*}
  [[ -z $extension ]] && usage
  color=${arg##*=}
  [[ -z $color ]] && usage
  # ensure requested color is available
  if ! echo black red green orange blue purple cyan yellow white |grep $color &>/dev/null; then usage; fi
  extColors[$extension]=$color
done

for file in *; do
  extension=${file##*.}
  color=${extColors[$extension]}
  # either no file extension or no color for this extension
  [[ -z $color ]] && color=${extColors[default]}
  echo -e "${colors[$color]}$file"
done
