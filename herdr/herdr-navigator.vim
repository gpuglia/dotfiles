" herdr-aware ctrl+hjkl navigation: move between nvim splits first; when the
" move doesn't change the window (split edge), cross into the neighbouring
" herdr pane. Inside tmux, defer to vim-tmux-navigator as before.
function! s:navigate(direction)
  if strlen($TMUX)
    execute 'TmuxNavigate' . {'h': 'Left', 'j': 'Down', 'k': 'Up', 'l': 'Right'}[a:direction]
    return
  endif
  let l:before = winnr()
  execute 'wincmd' a:direction[0]
  if winnr() != l:before || empty($HERDR_PANE_ID)
    return
  endif
  let l:herdr_dir = {'h': 'left', 'j': 'down', 'k': 'up', 'l': 'right'}[a:direction]
  call jobstart([
        \ empty($HERDR_BIN_PATH) ? 'herdr' : $HERDR_BIN_PATH,
        \ 'pane', 'focus', '--direction', l:herdr_dir,
        \ '--pane', $HERDR_PANE_ID],
        \ {'detach': 1})
endfunction

command! -bar HerdrNavigateLeft  call s:navigate('h')
command! -bar HerdrNavigateDown  call s:navigate('j')
command! -bar HerdrNavigateUp    call s:navigate('k')
command! -bar HerdrNavigateRight call s:navigate('l')
