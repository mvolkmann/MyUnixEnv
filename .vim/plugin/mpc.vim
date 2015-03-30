function! OpenMpc()
  let bufName = 'mpc.mpdv'

  if (bufexists(bufName))
    let mpcWin = bufwinnr(bufName)
    if (mpcWin != -1) " window exists
      execute mpcWin . 'wincmd w' " switch to existing window
      return
    endif

    execute 'sbuffer ' . bufnr(bufName)
  else
    execute 'new ' . bufName " open new window with existing buffer
  endif

  call mpc#DisplayPlaylist()
endfunction
