# Vim Reminders

## matchit macro
- press % to jump to corresponding delimiter
- works with HTML/XML tags also when enabled

## splitjoin.vim
* `gJ` to join a multi-line statement to one line
* `gS` to split a single-line statement to multiple lines

## vim-emmet plugin
* trigger key (user-emmet-leader-key) for me is `ctrl-e`
* `ctrl-e ,` in normal mode to expand a snippet
* `ctrl-e ,` in visual mode to wrap selected text
  in expansion of snippet entered next
* `ctrl-e n` to jump to next edit point
* `ctrl-e N` to jump to previous edit point
* `ctrl-e d` repeatedly to select and expand selection
  outward to balanced tags
* `ctrl-e /` toggles whether tag under cursor is commented out
* `ctrl-e m` in visual mode merges selected lines to a single line
* `ctrl-e a` in insert mode changes a URL to
  an anchor tag where the URL is the href value
  (must start with http:// or https://)

## vim-expand-region plugin
* `+` repeatedly to expand selection
* `-` repeatedly to shrink selection

## vim-surround plugin
* delimeters can be ' " ` ( ) { } [ ]
* `S{delimiter}` surrounds selected text with the delimiter
  - left delimiter includes space inside, right does not
  - ex. `S(` on foo gives ( foo ) and `S)` gives (foo)
* `S<tag-name` surrounds select text with an HTML/XML tag
  - ex. `S<div` or `S<div>` on foo gives <div>foo</div>
  - can type attributes in tag
* `cs{current}{new}` changes the delimiter around cursor position
  - ex. to change double quotes around cursor to single, cs"'
* `cst{new-tag}` changes tag surrounding cursor position
* `ds{delimiter}` deletes delimiter surround cursor position
  - ex. `ds"` changes "foo" to foo
* `dst` deletes tag surrounding cursor position
