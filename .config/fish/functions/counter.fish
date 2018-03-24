function counter
  set count 0
  while true
    set count (math "$count + 1")
    echo $count
    breakpoint
  end
end
