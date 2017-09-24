function fish_indent2 -a fnName
  set file $fnName'.fish'
  fish_indent -w $file
  sed 's/    /  /g' $file > $file'-new'
end
