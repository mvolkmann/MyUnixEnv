function! CompareNumbers(n1, n2)
  return a:n1 - a:n2
endfunction

function! mpc#EncodeSong(item)
  let pieces = split(a:item, ' @')

  if (len(pieces) == 3) " missing title
    call add(pieces, 'unknown')
  endif

  return {
    \ 'position': pieces[0],
    \ 'artist': '@ar' . pieces[1] . 'ar@',
    \ 'album': '@al' . pieces[2] . 'al@',
    \ 'title': '@ti' . pieces[3] . 'ti@'
  \ }
endfunction

" This is not currently used.  Rather than removing the delimiters,
" they are hidden using syntax conceal.
function! mpc#DecodeSong(item)
  " Use substitute to replace all occurrences of 2+ spaces with one.
  let items = split(substitute(a:item, ' \{2,}', ' ', 'g'), ' @')

  " Leading @ is already removed by split.
  " 2 in [2:-4] removes rest of leading delimiter.
  " -4 in [2:-4] removes trailing delimiter.
  return {
    \ 'position': items[0],
    \ 'artist': items[1][2:-4],
    \ 'album': items[2][2:-4],
    \ 'title': items[3][2:-4]
  \ }
endfunction

function! mpc#GetPlaylist()
  " Get lines describing each track in the playlist in a custom format.
  " The @ character will be used for parsing out the pieces of these lines
  " later.  It is needed because some pieces can contain spaces.
  let cmd = "mpc --format '%position% @%artist% @%album% @%title%' playlist"
  let lines = split(system(cmd), '\n')
  let playlist = []
  let maxLengths = {'position': [], 'artist': [], 'album': []}

  for line in lines
    call add(playlist, mpc#EncodeSong(line))
  endfor

  for track in playlist
    " Append the length of each property
    " to its list in the maxLengths Dictionary.
    call add(maxLengths.position, len(track.position))
    call add(maxLengths.artist, len(track.artist))
    call add(maxLengths.album, len(track.album))
  endfor

  call sort(maxLengths.position, 'CompareNumbers')
  call sort(maxLengths.artist, 'CompareNumbers')
  call sort(maxLengths.album, 'CompareNumbers')

  let maxPosition = maxLengths.position[-1]
  let maxArtist = maxLengths.artist[-1]
  let maxAlbum = maxLengths.album[-1]

  for track in playlist
    " Right-align the position.
    if (maxPosition + 1 > len(track.position))
      let track.position =
      \ repeat(' ', maxPosition - len(track.position)) . track.position
    endif
    let track.position .= ' ' " append a space

    " Left-align the artist.
    let track.artist .= repeat(' ', maxArtist + 2 - len(track.artist))

    " Left-align the album.
    let track.album .= repeat(' ', maxAlbum + 2 - len(track.album))
  endfor

  return playlist
endfunction

function! mpc#DisplayPlaylist()
  let playlist = mpc#GetPlaylist()
  let firstTrackPosition = playlist[0].position

  for track in playlist
    let line = track.position . ' ' .
      \ track.artist . track.album . track.title
    if (track.position == firstTrackPosition)
      " Go to first line,
      " delete all lines to bottom of buffer,
      " and enter insert mode.
      execute 'normal! 1GdGI' . line
    else
      call append(line('$'), line)
    endif
  endfor
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

function! mpc#TogglePlayback()
  " Sometimes when music is playing the "mpc toggle" command
  " takes a long time to stop it! (up to 30 seconds)
  let line2 = split(system('mpc toggle'), '\n')[1]
  let state = split(line2, ' ')[0]
  "echomsg '[mpc] ' . (state == '[paused]' ? 'PAUSED' : 'PLAYING')
endfunction

function! mpc#ToggleRandom()
  let lines = split(system('mpc random'), '\n')
  let lastLine = lines[len(lines) - 1]
  let state = split(lastLine, '   ')[2]

  " If state starts with a space, remove it.
  if (state[0:0] == ' ')
    let state = state[1:]
  endif

  "echomsg '[mpc] ' . (state == 'random: off' ? 'RANDOM: OFF' : 'RANDOM: ON')
endfunction

function! mpc#ToggleRepeat()
  let lines = split(system('mpc repeat'), '\n')
  let lastLine = lines[len(lines) - 1]
  let state = split(lastLine, '   ')[1]
  "echomsg '[mpc] ' . (state == 'repeat: off' ? 'REPEAT: OFF' : 'REPEAT: ON')
endfunction
