setlocal conceallevel=3
setlocal concealcursor=nivc

" Returns the type name of a given variable.
" This is useful for debugging.
function! GetTypeStr(var)
  let num = type(a:var)
  return num == 0 ? 'Number' :
    \ num == 1 ? 'String' :
    \ num == 2 ? 'FuncRef' :
    \ num == 3 ? 'List' :
    \ num == 4 ? 'Dictionary' :
    \ num == 5 ? 'Float' :
    \ 'unknown'
endfunction

set buftype=nofile
"call mpc#UpdateStatusline()

" Define a command that plays the song described by the current cursor line.
command! -buffer PlaySelectedSong call mpc#PlaySong(line('.'))
command! -buffer ToggleRandom call mpc#ToggleRandom()
command! -buffer ToggleRepeat call mpc#ToggleRepeat()

" Define key mappings
nnoremap <silent> <plug>MpcTogglePlayback :TogglePlayback<cr>
nnoremap <silent> <buffer> <c-x> :PlaySelectedSong<cr>
nnoremap <silent> <buffer> <c-a> :ToggleRandom<cr>
nnoremap <silent> <buffer> <c-e> :ToggleRepeat<cr>
if !hasmapto("<plug>MpcToggleplayback")
  nmap <leader>p <plug>MpcTogglePlayback
endif
