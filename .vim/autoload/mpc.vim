function! mpc#DisplayPlaylist()
  let cmd = "mpc --format '%position% %artist% / %album% / %title%' playlist"
  let playlist = split(system(cmd), '\n')
  call append(0, playlist)
endfunction

" Call mpc#DisplayPlaylist() before calling this
" so the playlist is in the current buffer.
function! mpc#PlaySong(lineNum)
  " Get the song number on the given line number.
  let line = getline(a:lineNum) " in current buffer
  let songNum = split(line, ' ')[0]

  " Play the song with the format of the first line of output customized.
  let playOutput = system("mpc --format '%title% (%artist%)' play " . songNum)

  " Output the first line of output from the play command.
  let results = split(playOutput, '\n')
  let message = '[mpc] NOW PLAYING: ' . results[0]
  echomsg message
endfunction
