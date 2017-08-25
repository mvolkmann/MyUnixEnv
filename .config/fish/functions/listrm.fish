# Removes an item from a given list.
# usage: listrm myList someItem
function listrm -a listName item
  set list $$listName
  if set -l index (contains -i $item $list)
    set -eg $listName[1][$index]
  else
    echo '"'$item'"' was not found in $listName 1>&2
  end
end
