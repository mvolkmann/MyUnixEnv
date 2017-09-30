function orderShirt -a size color
  set -q size[1]; or set size 'large'
  set -q color[1]; or set color 'white'
  echo I see you want to order a $size shirt that is $color.
end
