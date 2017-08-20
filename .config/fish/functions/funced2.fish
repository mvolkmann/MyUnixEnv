function funced2 -a name -d better way to edit functions
  if test -z name
    echo function name is required
    return 1
  end
  set fnpath $fish_function_path[1]
  funced $name; and funcsave $name; and source $fnpath/$name'.fish'
end
