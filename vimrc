"
"
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


" Indenting
filetype plugin indent on
" DarkScreen
set bg=dark
" turns off vi compatibility -- Unleashes the power of viM
set nocompatible
" Bash-style completion
set wildmode=longest,list
"syntax highlighting
syntax on
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

"  For SPACES, instead of TABS.  The combination of expandtab, softtabstop, and shiftwidth does the following (perfect in my opinion) behavior:
"     - expandtab   -- <TAB> will expand to N spacess.  Using <CTRL-V>, <TAB> to insert a real tab character
"     - softtabstop -- <BACKSPACE> will delete N spaces.  <TAB> will insert a mix of tabs and spaces, when expandtab is off.  But when expandtab is on, which it will be here, then <TAB> will ONLY insert spaces.) 
"     - shiftwidth  -- >> will indent N spaces
set expandtab
set softtabstop=4
set shiftwidth=4

"  For TABS, instead of SPACES.  <TAB> to display as N spaces.
"set tabstop=8 

" show whitespace characters
"set list

" set the gui font
set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
" set show match
set showmatch
" for java
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
" tags
set tags+=~/.tags
