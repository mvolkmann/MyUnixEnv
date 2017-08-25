# Adds an item to the end of a given list.
# usage: listadd myList someItem
function listadd -a listName item
  set list $$listName
  set $listName $$listName $item
end
