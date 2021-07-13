" Load Pathogen -- A Vim plugin manager
runtime vimrc-include/load-pathogen.vimrc

" A hack for Windows Terminal to force the cursor to change when switching to
" and from Insert Mode
" https://github.com/microsoft/terminal/issues/4335
if &term =~ '^xterm'
  " enter vim
  autocmd VimEnter * silent !echo -ne "\e[3 q"
  " oherwise
  let &t_EI .= "\<Esc>[0 q"
  " insert mode
  let &t_SI .= "\<Esc>[5 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
  " leave vim
  autocmd VimLeave * silent !echo -ne "\e[5 q"
endif

scriptencoding utf-8
set encoding=utf-8

" turns off vi compatibility -- Unleashes the power of viM
set nocompatible

" For Colors
set t_Co=256
let g:solarized_termcolors=256
" DarkScreen
set bg=dark
" Choose the popular Solarized colorscheme
colorscheme solarized

" Load the common vimrc
runtime vimrc-include/common.vimrc
