" Inspirations:
"	http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"	https://statico.github.io/vim3.html (goldmine)
"
" Sections:
"    -> Plugins
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins (Vundle)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
" Set leader key
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","

" python startup errors workaround
" https://unix.stackexchange.com/questions/305415/enabling-python3-on-vim-in-fedora-24#306188
if exists('py2') && has('python')
elseif has('python3')
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" navigate seamlessly between vim and tmux splits using <ctrl-direction> hotkeys
Plugin 'itchyny/lightline.vim'
Plugin 'taohexxx/lightline-buffer'
Plugin 'taohexxx/lightline-solarized'
Plugin 'maximbaz/lightline-ale'  " warnings and errors on lightline
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'  " for :Gbrowse
" Plugin 'tpope/vim-commentary'  " gc to comment
" Plugin 'tpope/vim-repeat'  " . command working for a set of plugins
" Plugin 'tpope/vim-sleuth'  " heuristically set tab and space settings
Plugin 'airblade/vim-gitgutter'
Plugin 'lambdalisue/suda.vim'  " :w !sudo tee % doest not work in neovim. Usage: :w suda://%
Plugin 'vimwiki/vimwiki'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Bundle 'Valloric/YouCompleteMe'
" Plugin 'vim-syntastic/syntastic' replaced by asynchronous ALE below
Plugin 'w0rp/ale'  " Asynchronous Linting Engine
" Plugin 'kien/ctrlp.vim' replaced by fzf
Plugin 'junegunn/fzf.vim'  " the fzf must be cloned and installed manually
Plugin 'mileszs/ack.vim'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
Plugin 'python-mode/python-mode'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'plasticboy/vim-markdown'
Plugin 'sheerun/vim-polyglot' " better leave it at the end so that it does not interfere with the above
Plugin 'ryanoasis/vim-devicons' " should be loaded as the last one

" Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'altercation/vim-colors-solarized'

" Vim has undo branches and this plugin visualizes the undo tree
" https://github.com/mbbill/undotree

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" " Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin-related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" in order to make the ui more powerline-like (arrows), see:
" https://github.com/itchyny/lightline.vim/issues/274
let g:lightline = {
	\ 'colorscheme': 'lightline_solarized',
	\ 'tabline': {
	\   'left': [ [ 'bufferinfo' ], [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'buffers' ], ],
	\ },
	\ 'active': {
	\	'left': [['mode', 'paste'],	['gitbranch', 'filename', 'modified']],
	\	'right': [['lineinfo'], ['percent'],
	\			 ['readonly', 'linter_errors', 'linter_warnings']]
	\ },
	\ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
	\   'linter_warnings': 'lightline#ale#warnings',
	\   'linter_errors': 'lightline#ale#errors',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
	\   'linter_warnings': 'warning',
	\   'linter_errors': 'error',
    \ },
	\ 'component_function': {
	\	'gitbranch': 'fugitive#head',
	\	'bufferinfo': 'lightline#buffer#bufferinfo',
	\ },
	\ 'component': {
	\	'separator': '',
	\	'buffers': 'buffers',
	\ },
	\ }

" lightline-ale icons
let g:lightline#ale#indicator_warnings = "▲"  " \uf071 not found
let g:lightline#ale#indicator_errors = "✗"  " \uf05e not found
" let g:lightline#ale#indicator_ok = "\uf00c" not found

set showtabline=2
" lightline-buffer ui settings
let g:lightline_buffer_logo = '⛁ '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '+'  " '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)

" let g:gitgutter_async = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_map_prefix = '<leader>v'
" let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ensures autocomplete window goes away after you're done
let g:ycm_autoclose_preview_window_after_completion=1

" Shortcut for goto definition
map <leader>gd  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Enable Python 3 syntax checking
let g:pymode_python = 'python3'
let g:syntastic_python_python_exec = 'python3'
let g:pymode_options_max_line_length=88

" Autocomplete fix
autocmd BufNewFile *.py :set omnifunc=python3complete#Complete

" Disable rope from python-mode bundle
" (tends to hang for a few secs in dirs with lots of files)
" let g:pymode_rope=1
" let g:pymode_rope_autoimport = 1

let g:pymode_folding = 0

" let g:pymode_lint_options_mccabe={'complexity': 15}

" YouCompleteMe JediHTTP python binary path
let g:ycm_python_binary_path='python3'

" put syntastic into passive mode
" let g:syntastic_mode_map = { 'mode': 'passive' }

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_lint_delay = 2000
" Don't run while typing, can be set to insert or normal, see :help
" let g:ale_lint_on_text_changed = 'never'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.fzf
" ; would be great for that
nmap <leader>f :Buffers<CR>
nmap <C-p> :Files<CR>
" nmap <Leader>r :Tags<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack/ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag installed with package manager
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
nmap <leader>ag :Ack! "\b<cword>\b" <CR>
" nmap <leader>ag :Ag


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :UndotreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NerdTree shortcut
map <F9> :NERDTreeToggle<CR>
nmap \e :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType go nmap <leader>b	<Plug>(go-build)
autocmd FileType go nmap <leader>r	<Plug>(go-run)

" Automatically format and rewrite import declarations
let g:go_fmt_command = "goimports"

" Run checkers on save
let g:go_metalinter_autosave = 1

" Run :GoInfo
autocmd FileType go nmap <leader>i <Plug>(go-info)
" Show info whenever cursor is moved
let g:go_auto_type_info = 1

" Beautification
" let g:go_highlight_types		= 1
" let g:go_highlight_fields		= 1
let g:go_highlight_functions	= 1
" let g:go_highlight_methods		= 1
let g:go_highlight_operators	= 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-polyglot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:polyglot_disabled = ['python', 'go']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
set undolevels=700

" turn off linewise keys -- normally, the `j' and `k' keys move the cursor down
" one entire line. with line wrapping on, this can cause the cursor to actually
" skip a few lines on the screen because it's moving from line N to line N+1 in
" the file. I want this to act more visually -- I want `down' to mean the next
" line on the screen
nnoremap j gj
nnoremap k gk

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Map sort fuction to a key
vnoremap <leader>s :sort<cr>

" Easier moving of code blocks (re-enter visual mode after identing)
vnoremap < <gv 
vnoremap > >gv

" :R runs current file
command! R !./%

" Allow Alt-key shortcuts
" https://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
if !has('nvim')
    let c='a'
    while c <= 'z'
        exec "set <A-".c.">=\e".c
        exec "imap \e".c." <A-".c.">"
        let c = nr2char(1+char2nr(c))
    endw
endif

set timeout ttimeoutlen=20

" Sessions handling
set ssop-=options   " do not store global and local values in a session 
set ssop-=folds     " do not store folds

" if vim is opened without arguments, it creates/loads the corresponding session and saves it on exit
" otherwise it only creates new session if one doesn't exist
" this way you can open single files in a directory with a session without overwriting it
" https://stackoverflow.com/questions/1642611/how-to-save-and-restore-multiple-different-sessions-in-vim/47656092#47656092
function! MakeSession(overwrite)
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
  au VimLeave * :call MakeSession(1)
else
  au VimLeave * :call MakeSession(0)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7  " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu  " show possible completions on the command line
set wildmode=longest,list,full  " first tab completes as much as possible, second tab provides a list, third and subsequent cycle through options
set wildignore=*.class,*.o,*~,*.pyc,.git  " Ignore certain files in completion
set shortmess+=A    " Don't bother me when a swapfile exists
set ruler           " Always show current position
" set cmdheight=2   " Height of the command bar
set undodir=$HOME/.vim/undodir
set undofile    " Persistent undo, even when vim is closed and reopened. Super great when combined with the undotree plugin
set hid			" A buffer becomes hidden when it is abandoned
set hlsearch	" Highlight search results
set ignorecase	" Case insensitive
set smartcase	" When searching with capital letters the search is case sensitive
set incsearch	" Search as you type
set inccommand=nosplit " Neovim only, shows in realtime what changes the ex command will do (currently only supports :s)
set infercase   " Completion recognizes capitalizaton
set lazyredraw	" Don't redraw while executing macros (good performance config)
set magic		" For regular expressions turn magic on
set showmatch	" Show matching brackets when text indicator is over them
set mat=2		" How many tenths of a second to blink when matching brackets
set foldcolumn=0  " Add a bit extra margin to the left
set encoding=utf8	" UTF-8 by default
set fileencodings=utf8
set ffs=unix,dos,mac  " Use Unix as the standard file type

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Display hybrid line numbers (both absolute and relative)
" only on focused buffer and in normal mode
" https://jeffkreeftmeijer.com/vim-number/
"set number relativenumber
"
"augroup numbertoggle
"	autocmd!
"	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
let python_highlight_all=1
syntax on
set background=dark

set t_Co=256
"color wombat256mod | molokai
try
    colorscheme solarized
catch
endtry

" molokai background color setting
" let g:molokai_original = 1

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile

" the location for vim to store swap files (dir created in zshrc)
set directory=$HOME/.vim/swapfiles//


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
 
" Be smart when using tabs ;)
" set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4  " Spaces 'feel' like tabs

" groovy indent configuration
autocmd FileType groovy setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent  " Carry over indenting from previous line
set wrap        " Wrap lines
" set si  " Smart indent (does not allow to indent comments with >> in python)

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za
vnoremap <space> zf

" Mark extra whitespace as bad, probably color it red
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffer management (switching)
" nnoremap <leader>b :ls<CR>:buffer

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" map <leader>h :bprevious<cr>
" map <leader>l :bnext<cr>
noremap <M-h> :bprevious<cr>
noremap <M-l> :bnext<cr>

" last accessed buffer
" map <leader>gl :b#<cr>
map gl :b#<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <M-n> :tabnext<cr>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Open new split panes to the right
set splitright

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
" try
"   set switchbuf=useopen,usetab,newtab
"   set stal=2
" catch
" endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Go to Definition
" http://tartley.com/?p=1277
map <f12> :!start /min ctags -R .<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Replaced with lightline-vim
" set rtp+=/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim
" /home/okonos/.local/lib/python3.5/site-packages/powerline/bindings/vim/

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Make Y copy from cursor to the end of line (more logical, as the help itself states)
nnoremap Y y$

" Run q macro with Q
nnoremap Q @q

" Indenting lines with Tab and Shift-Tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Move between errors in quickfix list
map <C-n> :cnext<cr>
map <C-m> :cprevious<cr>
nnoremap <leader>a :cclose<cr>
nmap \x :cclose<cr>

" Move between errors in location list
nnoremap <M-m> :lnext<cr>
nnoremap <M-S-m> :lprevious<cr>
nnoremap <leader>q :lclose<cr>

" Emacs-like bindings in command line -- `:help emacs-keys`
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Del>
cnoremap <C-e>  <End>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <C-g> <C-c>

" window diff (:windo diff{this,off})
nnoremap <silent> <leader>df :call ToggleDiff()<CR>

nmap =js :call SortJSON()<CR>

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" When you press <leader>sr you can search and replace the selected text
vnoremap <silent> <leader>sr :call VisualSelection('replace', '')<CR>
" <C-R>* paste register '*' (visual mode selection in this case)
" vnoremap <leader>sr <Esc>:%s/<C-R>*/
nnoremap <leader>sr *:%s/<C-R>///gc<left><left><left>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ag, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Q q  " :Q is :q
command! W w  " :W is :w

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Copy to system clipboard
map <leader>y "+y

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc nested source %


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleDiff()
    if &diff
        execute 'windo diffoff'
    else
        execute 'windo diffthis'
    endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! SortJSON()
    execute '%!python3 -m json.tool --sort-keys'
    execute '%!python3 -c "import json,sys; print(json.dumps(json.load(sys.stdin), indent=2))"'
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
