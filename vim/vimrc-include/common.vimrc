"================================================================================================
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
"
"================================================================================================
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
"================================================================================================

"================================================================================================
" White Space and Indenting
"================================================================================================
"
"  For SPACES, instead of TABS.  The combination of expandtab, softtabstop, and shiftwidth does the following (perfect in my opinion) behavior:
"     - expandtab   -- <TAB> will expand to N spacess.  Using <CTRL-V>, <TAB> to insert a real tab character
"     - softtabstop -- <BACKSPACE> will delete N spaces.  <TAB> will insert a mix of tabs and spaces, when expandtab is off.  But when expandtab is on, which it will be here, then <TAB> will ONLY insert spaces.) 
"     - shiftwidth  -- >> will indent N spaces

" Uncommented for MDi XML
"set expandtab
"set softtabstop=4
"set shiftwidth=4
set list

" Configures whitespace characters shown, when 'set list' is enabled.  These
" are the ones used by TextMate -- not that I care.  TextMade licks dick.
set listchars=tab:▸\ ,eol:¬

"================================================================================================
" Editor Settings
"================================================================================================
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
" show a fully qualified path.
set statusline+=%F
" Show matching Brace
set showmatch
" Seems to fix a backspace problem with Vim on Mac OSX
set bs=2

" For MAC OS X
set clipboard^=unnamedplus

" Vim's clipboard registers clear on exit, so anything yanked into the system
" clipboard from inside vim, cannot be pasted once vim exits. This autocmd
" makes sure Vim persists the clipboard register to the environment.
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"================================================================================================
" Keymappings
"================================================================================================
" Reformat code
noremap <leader>r m'gg=G''

"reload vimrc
noremap <leader>z :source $MYVIMRC<CR>

"" Toggle Dark/Light
call togglebg#map("<F5>")

" Binding the keystroke \l (Backslash-L) to toggle showing whitespace
" characters.
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" For the Git plugin, fugitative.vim.  Brings up the staging menu
noremap <leader>g <Esc>:Gstatus<CR>
"
" For the Git plugin, Extradate.vim.  A Git Extension.  For looking at the
" history of one particular file
noremap <leader>e <Esc>:Extradite<CR>

imap jj <Esc>

" Clear highlight search
"let hlstate=0
"nnoremap <F4> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>
set nohlsearch
noremap * :set hlsearch<CR>:nohlsearch<CR>*
noremap / :set hlsearch<CR>:nohlsearch<CR>/
noremap ? :set hlsearch<CR>:nohlsearch<CR>?
nnoremap <F4> :set invhlsearch<CR>
inoremap <F4> <ESC>:set invhlsearch<CR>gi
nnoremap <CR> :set nohlsearch<CR>
nnoremap <F6> :colorscheme solarized<CR>

" Opens file in Browsers
nnoremap <F10>f :exe ':silent !firefox %'<CR>
nnoremap <F10>c :exe ':silent !google-chrome %'<CR>
"

" Top 5 vimrc remaps from this crazy mofo
" https://www.youtube.com/watch?v=hSHATqh8svM
"================================================================================================ 
" Capital "D", and Capital "C" effects from the cursor to the end of the line.
" Yet, Capital "Y" yanks the entire line.  Why?  Make "Y" yank from the cursor
" until the end of the line
nnoremap Y y$

" When the cursor jumps during finds or joins, have the screen/camera track
" the cursor, keeping the cursor in the middle.  This is a like the David
" Fincher camera think, or keeping the subject centered in frame, even if the
" subject is moving ever so slightly
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" This is a helpful ditty to undo just a phrase, or sentence, rather than a whole line.
" Create undo-breakss for a comma, period, exclamation, or question mark; whatever really.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

noremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

"================================================================================================
" Nerdtree Settings
"================================================================================================
map <C-n> :NERDTreeToggle<CR>
" Opens nerdtree when vim is opened with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif"
" Allows vim to exit without warning if Nerdtree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"================================================================================================
" vim-expand.git settings
" https://github.com/terryma/vim-expand-region/ 
" 
"================================================================================================

let g:expand_region_text_objects = {
			\ 'iw'  :0,
			\ 'iW'  :0,
			\ 'i"'  :0,
			\ 'i''' :0,
			\ 'i]'  :1,
			\ 'ib'  :1,
			\ 'iB'  :1,
			\ 'ip'  :0,
			\ 'ie'  :0,
			\ 'il'  :0,
			\ }

call expand_region#custom_text_objects({
			\ 'a]' :1,
			\ 'ab' :1,
			\ 'aB' :1,
			\ 'i>' :1,
			\ 'a>' :1,
			\ 'it' :1,
			\ 'at' :1,
			\ 'ic' :0,
			\ 'ac' :0,
			\ 'ii' :0,
			\ 'ai' :0,
			\ 'if' :0,
			\ 'af' :0,
			\ })


"
"================================================================================================
" Make / Compile Settings
"================================================================================================

" A way to show the output of ":make" in a vim sub-window
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"================================================================================================
" Java Editing Settings
"================================================================================================
" for java
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
" tags

"================================================================================================
" *****
" CtrlP
" *****
"
" A fast file launcher.  3 modes:
" 
"   1) Current directory
"   2) Any open Buffers
"   3) MRU (most recently used
"
" Keys
"
"   Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"   Press <c-f> and <c-b> to cycle between modes.
"   Press <c-d> to switch to filename only search instead of full path.
"   Press <c-r> to switch to regexp mode.
"   Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"   Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"   Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"   Use <c-y> to create a new file and its parent directories.
"   Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"================================================================================================

" Enables vim-repeat.git
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

map <leader>m :CtrlPMixed<CR>

if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"================================================================================================
" *********
" Syntastic
" *********
" https://github.com/scrooloose/syntastic
"
" Checks the syntax of the current filetype, and reports errors in-line.
"================================================================================================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"================================================================================================
" Airline Settings (the prompt at the bottom)
"================================================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme="solarized"

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'
