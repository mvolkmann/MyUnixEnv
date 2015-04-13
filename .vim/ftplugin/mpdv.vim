function! GetMpcStatusline()
  let lines = split(system('mpc status'), '\n')
  let lastLine = lines[len(lines) - 1]
  let settings = split(lastLine, '   ')
  let [repeat, random] = [settings[1], settings[2]]
  let trackCount = len(split(system('mpc playlist'), '\n'))
  return ' ' . repeat . ' --- ' . random . ' ---%=' . trackCount . ' songs '
endfunction

set buftype=nofile
setlocal statusline=%!GetMpcStatusline()
