# This echoes text using colors specified with the
# --color (-c) switch which can be used any number of times.
# For example,
# cecho -c red fire -c green grass -c normal cloud -c blue sky
# Tab completion can be used to select colors
# after the --color (-c) switch has been typed.
function cecho -d 'echoes given text in color'
  for arg in $argv
    switch $arg
      case '-c' '--color'
        set expectColor 'yes'
      case '*'
        if test -n "$expectColor"
          set_color $arg
          set expectColor # no value
        else
          echo -n $arg' ' # includes space between words
        end
    end
  end
  echo # for newline
end

# Configure completions for the color switch.
# -f disallows completion with filenames found in the current directory.
# -s specifies the short name of the color swtich
# -l specifies the long name of the color swtich
# -r specifies that the switch requires a value
# -a specifies the supported completions
set colors 'black blue cyan green magenta red white yellow'
complete --command cecho -f -r -s c -l color -a "$colors"
