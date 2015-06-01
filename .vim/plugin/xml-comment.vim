" This plugin defines commands that properly comment and uncomment
" tags in XML/HTML files.  It relies on the "vat" command
" to select the tag under the cursor.  This does not understand
" HTML tags that are not terminated (ex. <br> and <input>) or
" XML tags that are terminated in the shorthand way (ex. <x/> and <x />).
"
" It is recommended that these commands be mapped to keys like the following:
" nnoremap <leader>xc :XmlComment<cr>
" nnoremap <leader>xu :XmlUncomment<cr>

" When a tag containing comments is commented out,
" the comment delimiters are changed from <!-- --> to <!__ __>
" so they can be restored if the tag is uncommented later.

" vat - visually select all text with the current tag
" \<esc> - exit visual selection mode
" `< - jump to beginning of visual selection
" The substitute "e" flag in the following two commands tells Vim
" that not finding a match should not be treated as an error.
" :'<,'>s/<!--/<!__/ge\<cr> - replace all beginning comment delimiters in the range with <!__
" :'<,'>s/-->/__>/ge\<cr> - replace all ending comment delimiters in the range with __>
" :nohlsearch\<cr> - turn off highlighting of previous search results
" `> - jump to ending of previous visual selection
" i-- - insert ending comment delimiter --
" esc - exit insert mode
" `< - jump to beginning of previous visual selection
" a!-- - append beginning comment delimiter !--
" esc - insert mode
command! XmlComment execute "normal! vat\<esc>`<:'<,'>s/<!--/<!__/ge\<cr>:'<,'>s/-->/__>/ge\<cr>:nohlsearch\<cr>`>i--\<esc>`<a!--\<esc>"

" ?!--\<cr> - search backward for beginning comment delimiter
" mb - mark beginning of comment
" 3x - delete the beginning comment delimiter
" /--\<cr> - search forward for ending comment delimiter
" me - mark end of comment
" 2x - delete the ending comment delimiter
" :'b,'es/<!__/<!--/g\<cr> - fix nested beginning comment delimiters
" :'b,'es/__>/-->/g\<cr> - fix nested ending comment delimters
command! XmlUncomment execute "normal! ?!--\<cr>mb3x/--\<cr>me2x:'b,'es/<!__/<!--/ge\<cr>:'b,'es/__>/-->/ge\<cr>"
