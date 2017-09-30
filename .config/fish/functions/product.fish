function product -d 'outputs product of any # of arguments'
  set result 1
  for arg in $argv
    switch $arg
      case '-h' '--help'
        echo 'This function returns the product of its arguments.'
        return
      case '*'
        # If $arg starts with a dash ...
        # -- is needed in case $arg starts with a dash.
        if string match -qr '^-' -- $arg
          echo "Unsupported switch $arg"
          return
        end
        set result (math "$result * $arg")
    end
  end
  echo $result
end
