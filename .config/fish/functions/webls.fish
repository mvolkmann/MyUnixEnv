# This lists all files in the current directory,
# but files related to web applications
# are output in special colors.
# These include .html, .css, and .js files.
# TODO: Make colors and file extensions configurable.
# Like this: webls --html yellow --js purple
function webls
  for file in (ls -1)
    set pieces (string split '.' $file)
    set extension $pieces[2]
    switch $extension
      case 'css' 'scss'
        set_color green
      case 'html'
        set_color blue
      case 'js'
        set_color red
      case '*'
        set_color normal
    end
    echo $file
  end
end
