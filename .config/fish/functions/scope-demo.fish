set foo 1
function scope-demo
  set foo 2
  begin
    set -l foo 3
    echo in block, foo = $foo
  end
  echo in function, foo = $foo
end
echo outside function, foo = $foo
