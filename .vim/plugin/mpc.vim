function! OpenMpc()
  let bufName = 'mpc.mpdv'

  if (bufexists(bufName))
    let winNum = bufwinnr(bufName)
    if (winNum != -1) " window exists
      " switch to existing window by number
      execute winNum . 'wincmd w'
      return
    endif

    " open new split window and display given buffer number
    execute 'sbuffer ' . bufnr(bufName)
  else
    " open new window with existing buffer
    execute 'new ' . bufName
  endif

  call mpc#DisplayPlaylist()
endfunction

" Define a command that displays the playlist.
command! MpcBrowser call OpenMpc()

" Define a command to toggle the play/pause state.
command! TogglePlayback call mpc#TogglePlayback()
