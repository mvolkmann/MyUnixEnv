set foo 1
function scope-demo
  set foo 2
  begin
    set -l foo 3
    echo in block, foo = $foo
    set bar 4
  end
  echo in function, foo = $foo
  echo in function, bar = $bar
end
echo outside function, foo = $foo
echo outside function, bar = $bar
