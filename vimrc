" List of vim-plugins to install:
"
"   matchit -- finds matching tags and closing braces
"       http://www.vim.org/scripts/script.php?script_id=39
"
"   fuzzyfinder -- finding files quickly
"       http://www.vim.org/scripts/script.php?script_id=1984
"   
"   surround -- surround this block of text with something: html tags, curly braces
"       http://www.vim.org/scripts/script.php?script_id=1697
"
"   snipmate -- quick autocomplete templates
"       http://www.vim.org/scripts/script.php?script_id=2540
"   
"   tcomment -- commenting code blocks
"       http://www.vim.org/scripts/script.php?script_id=1173
"
"   nerdtree -- file browsing
"       http://www.vim.org/scripts/script.php?script_id=1658
"
"   matrix -- screen saver
"       http://www.vim.org/scripts/script.php?script_id=1189

" Enables Pathogen -- A Vim plugin manager
" Requires the plugin to be installed in .vim/autoload/pathogen.vim
" Pathogen needs to be loaded before any 'filetype' settings are activated
call pathogen#incubate()
call pathogen#helptags()

" Following the advice of Vimcast (url below), we shall install Pathogen
" plugins as Git 'submodules' within Quy's own vim-config Git repo.
"
" Install Plugin
" ==============
"
" To install a vim plugin, do the following:
" 
" 1)  Get the git repo URL of the plugin.
"
" 2)  At the root of our vim-config git repo, add the plugin's git repo URL as
" a submodule, with the local path of ./vim/bundle/{plugin-name}
"
"   e.g. The git repo for the vim plugin vim-sensible is: https://github.com/tpope/vim-sensible.git
"   
"   cd vim-config
"   git submodule add vim/bundle/vim-sensible
"
" Update/Synchronize Plugin
" =========================
"
" To synchronize the vim-config onto another system, we need to do more than
" just do a git update on the vim-config update.  Git submodules don't
" automatically get updated with a git update.  We need to do the following:
"
" 1) Go to the root of Quy's vim-config
" 2) git submodule update --init
"
" We only need to do this once for every new batch up vim plugins. i.e. if we
" install a new batch of 20 new vim plugins, to synchronize those new plugins,
" we'd only need to run that 'git submodule update --init' command once, for the entire batch of new
" plugins.
"
"
" Remove Plugin
" =============
"
" 1. Remove it from .gitmodules
" 2. Remove it from .git/config
" 3. Run git rm --cached <path-to-module></path-to-module>
"
" More Info
" =========
"
" See: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

" For Colors
set t_Co=16
" turns off vi compatibility -- Unleashes the power of viM
set nocompatible
" syntax highlighting
syntax on
" DarkScreen
set bg=dark
" Toggle Dark/Light
call togglebg#map("<F5>")
" Choose the popular Solarized colorscheme
colorscheme solarized
" Seems to fix a backspace problem with Vim on Mac OSX
set bs=2
" For MAC OS X
set clipboard=unnamed
" Indenting
filetype plugin indent on
" Bash-style completion
set wildmode=longest,list
" line number
set nu
" case insensitive search
set ignorecase
" highlight searches
set hlsearch
" highlight incremental searches
set incsearch
" wrap search
set wrapscan


" Seems to fix a backspace problem with Vim on Mac OSX
set bs=2
" For MAC OS X
set clipboard=unnamed

"  For SPACES, instead of TABS.  The combination of expandtab, softtabstop, and shiftwidth does the following (perfect in my opinion) behavior:
"     - expandtab   -- <TAB> will expand to N spacess.  Using <CTRL-V>, <TAB> to insert a real tab character
"     - softtabstop -- <BACKSPACE> will delete N spaces.  <TAB> will insert a mix of tabs and spaces, when expandtab is off.  But when expandtab is on, which it will be here, then <TAB> will ONLY insert spaces.) 
"     - shiftwidth  -- >> will indent N spaces

" Uncommented for MDi XML
"set expandtab
"set softtabstop=4
"set shiftwidth=4
set list

" show whitespace characters
"set list

" Toggle on/off showing whitespace characters.
"set list!

" Binding the keystroke \l (Backslash-L) to toggle showing whitespace
" characters.
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Format xml
nmap <leader>f :%! xmlstarlet fo -t<CR>

" For the Git plugin, fugitative.vim.  Brings up the staging menu
noremap <leader>g <Esc>:Gstatus<CR>
"
" For the Git plugin, Extradate.vim.  A Git Extension.  For looking at the
" history of one particular file
noremap <leader>e <Esc>:Extradite<CR>
 
noremap <leader>o <Esc>:CommandT<CR>

" Configures whitespace characters shown, when 'set list' is enabled.  These
" are the ones used by TextMate -- not that I care.  TextMade licks dick.
set listchars=tab:▸\ ,eol:¬

" set show match
set showmatch
" for java
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
" tags
set tags+=~/.tags


let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 1,
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ic' :0,
      \ 'ac' :0,
      \ 'it' :0,
      \ 'at' :0,
      \ 'ii' :0,
      \ 'ai' :0,
      \ 'if' :0,
      \ 'af' :0,
      \ })
