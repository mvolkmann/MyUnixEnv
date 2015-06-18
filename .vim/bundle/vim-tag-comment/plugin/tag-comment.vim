" See the accompanying README for details.

" mt - mark the current location as "t"
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
" `t - return to the starting location that marked as "t"
command! ElementComment execute "normal! mtvat\<esc>`<:'<,'>s/<!--/<!__/ge\<cr>:'<,'>s/-->/__>/ge\<cr>:nohlsearch\<cr>`>i--\<esc>`<a!--\<esc>`t"

" mt - mark the current location as "t"
" ?!--\<cr> - search backward for beginning comment delimiter
" mb - mark beginning of comment
" 3x - delete the beginning comment delimiter
" /--\<cr> - search forward for ending comment delimiter
" me - mark end of comment
" 2x - delete the ending comment delimiter
" :'b,'es/<!__/<!--/g\<cr> - fix nested beginning comment delimiters
" :'b,'es/__>/-->/g\<cr> - fix nested ending comment delimters
" `t - return to the starting location that marked as "t"
command! ElementUncomment execute "normal! mt?!--\<cr>mb3x/--\<cr>me2x:'b,'es/<!__/<!--/ge\<cr>:'b,'es/__>/-->/ge\<cr>`t"

command! TagComment execute "normal! mtvi<\<esc>a--\<esc>`<i!--\<esc>`t"
command! TagUncomment execute "normal! mtvi<\<esc>hxx`<xxxh`t"

if !exists('g:tab_comment_map_keys')
  nnoremap <leader>tc :ElementComment<cr>
  nnoremap <leader>tu :ElementUncomment<cr>

  nnoremap <leader>tC :TagComment<cr>
  nnoremap <leader>tU :TagUncomment<cr>
endif
