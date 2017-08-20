function fned -a name -d better way to edit functions
  if test -z $name
    set_color $fish_color_error
    echo function name is required 1>&2
    set_color normal
    return 1
  end
  set fnpath $fish_function_path[1]
  funced $name; and funcsave $name; and source $fnpath/$name'.fish'
end
