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

function! GetMpcStatusline()
  " Get the last line of output from the "mpc status" command.
  let lines = split(system('mpc status'), '\n')
  let lastLine = lines[len(lines) - 1]
  "echomsg('lastLine = ' . lastLine)

  " Get the current settings for the "repeat" and "random" options.
  let settings = split(lastLine, '   ')
  "echomsg('settings is a ' . GetTypeStr(settings))
  let [repeat, random] = [settings[1], settings[2]]
  "echomsg('s:repeat = ' . s:repeat)
  "echomsg('s:random = ' . s:random)

  " Get the number of tracks using the "mpc playlist" command.
  let trackCount = len(split(system('mpc playlist'), '\n'))
  "echomsg('s:trackCount = ' . s:trackCount)

  " Form the status line.
  return ' ' . repeat . ' --- ' . random . ' ---%=' . trackCount . ' songs '
endfunction

set buftype=nofile
setlocal statusline=%!GetMpcStatusline()

" Define a command that plays the song described by the current cursor line.
command! -buffer PlaySelectedSong call mpc#PlaySong(line('.'))
command! -buffer ToggleRandom call mpc#ToggleRandom()
command! -buffer ToggleRepeat call mpc#ToggleRepeat()
