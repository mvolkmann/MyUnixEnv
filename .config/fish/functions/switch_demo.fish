function switch_demo
  set product 1
  for arg in $argv
    switch $arg
      case '-h' '--help'
        echo 'This function returns the product of its arguments.'
      case '*'
        # If $arg starts with a dash ...
        if string match -qr '^-' -- $arg
          echo "Unsupported switch $arg"
        end
        set product (math "$product * $arg")
    end
  end
  echo $product
end
