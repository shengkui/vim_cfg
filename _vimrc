"Turn off vi-compatible mode
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("compatible")
filetype off
"set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/vinarise.vim'
Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/vim-pseudocl'
Plugin 'junegunn/vim-oblique'
Plugin 'chrisbra/csv.vim'
Plugin 'will133/vim-dirdiff'
call vundle#end()
filetype plugin indent on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Man
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime ftplugin/man.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme torte

if &t_Co > 2 || has("gui_running")
    syntax on       "syntax highlighting
    set hlsearch    "highlight search pattern
endif

"Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50          "Keep 50 lines of command line history
set nobackup            "No backup file

set number              "Turn on line numbers
set ruler               "Show current positions at the bottom
set incsearch           "Do incremental searching
set showmatch           "Show matching brackets
set showcmd             "Show the command being typed
set showmode            "Show mode of Insert/Replace/Visual mode
set linebreak           "Wrap long lines at a blank

"Set command-line completion operates in enhanced mode
set wildmode=list:full
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TAB
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       "Number of spaces that a <Tab> in the file counts for.
set softtabstop=4   "Number of spaces that a <Tab> counts for while editing.
set shiftwidth=4    "Number of spaces to be used for each step of (auto)indent.
set smarttab        "When hitting <Tab> or <Backspace> in front of line, 'shiftwidth' used.
set expandtab       "No real tabs(insert spaces when <Tab> pressed).
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"GVIM only
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set mouse=a                 "Use mouse everywhere
    set guifont=monospace\ 14   "Set font of GVIM
    "set cursorline             "Highlight current line
    "set cursorcolumn           "Highlight current column
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"paste mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tabpage
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:map <F4> :tabnew<CR>
:map <F5> :tabprevious<CR>
:map <F6> :tabnext<CR>
:imap <F4> <ESC>:tabnew<CR>i
:imap <F5> <ESC>:tabprevious<CR>i
:imap <F6> <ESC>:tabnext<CR>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"persistent-undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version >= 703
    set undofile                    "Save undos after file closes
    set undodir=$HOME/.vim/undo     "Where to save undo histories
    "set undolevels=1000            "How many undos
    "set undoreload=10000           "Number of lines to save for undo

    "gundo
    nnoremap <F7> :GundoToggle<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplcache
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0               " Disable AutoComplPop.
let g:neocomplcache_enable_at_startup = 1
let g:complcache_enable_ignore_case = 0
let g:neocomplcache_enable_smart_case = 1   " Use smartcase
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1  " Use underbar completion.
let g:neocomplcache_min_syntax_length = 3   " Set minimum syntax keyword length.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_disable_auto_complete = 1
inoremap <expr><C-p> pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"csv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:csv_autocmd_arrange = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map <Ctrl>+<F12> to generate ctags for current folder
map <C-F12> :!ctags -R --languages=c,c++,asm --fields=+iaS --extra=+q .<CR><CR>

"Set ctags search path
set tags=tags,../tags,../../tags,../../../tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=[%F][%{&ff}]%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2            "Always show the status linea