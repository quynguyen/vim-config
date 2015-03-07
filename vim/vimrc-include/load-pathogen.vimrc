" Imports Pathogen -- A Vim plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Loads Pathogen
" Pathogen needs to be loaded before any 'filetype' settings are activated
call pathogen#infect()
call pathogen#helptags()

" Now that Pathogen is loaded, enable syntax highlighting, and filetype
" detection.
syntax on
filetype plugin indent on
