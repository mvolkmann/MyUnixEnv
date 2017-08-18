function fndesc -a fnName -d 'displays description of a function'
  set lines (functions -Dv $fnName)
  echo $lines[5]
end
