" Load Pathogen -- A Vim plugin manager
runtime vimrc-include/load-pathogen.vimrc

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
