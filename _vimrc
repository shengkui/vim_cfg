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
Plugin 'VundleVim/Vundle.vim'           "Plug-in manager
Plugin 'tpope/vim-endwise'              "End certain structures automatically(C preprocessor...)
Plugin 'ConradIrwin/vim-bracketed-paste'    "Paste mode(automatic `:set paste`)
Plugin 'justmao945/vim-clang'           "Auto-completion
Plugin 'mbbill/undotree'                "Undo history visualizer
Plugin 'majutsushi/tagbar'              "Browse the tags
Plugin 'scrooloose/nerdtree'            "File explorer
Plugin 'will133/vim-dirdiff'            "Diff two directories
Plugin 'dkprice/vim-easygrep'           "Find and replace across multiple files
Plugin 'jsfaint/gen_tags.vim'           "Generate and load tags
Plugin 'editorconfig/editorconfig-vim'  "EditorConfig
Plugin 'vim-syntastic/syntastic'        "Syntax checking
"Plugin 'airblade/vim-gitgutter'         "Show git diff in the gutter
Plugin 'chrisbra/vim-diff-enhanced'     "Better Diff
Plugin 'EinfachToll/DidYouMean'         "Ask for the right file to open
Plugin 'rhysd/committia.vim'            "Improve for Git commit messag editor
Plugin 'tpope/vim-fugitive'             "Git Wrapper
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
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
syntax enable
colorscheme torte

"Toggle color scheme
function! g:ToggleBackground()
    if &background != 'dark'
        set background=dark
        colorscheme torte
    else
        set background=light
        colorscheme delek
    endif
endfunction
nnoremap <silent> <F6> :call g:ToggleBackground()<CR>


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
"General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50          "Keep 50 lines of command line history
set nobackup            "No backup file

set number              "Turn on line numbers
set ruler               "Show current positions at the bottom

set incsearch           "Do incremental searching
set hlsearch            "Highlight search strings
set showmatch           "Show matching brackets

set showcmd             "Show the command being typed
set showmode            "Show mode of Insert/Replace/Visual mode
set linebreak           "Wrap long lines at a blank
set noerrorbells        "No beep on errors
set wildignore=*.o,*~

"Set command-line completion operates in enhanced mode
set wildmode=list:full
set wildmenu

"Jump to line when reopen a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=[%F][%{&ff}]%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2            "Always show the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TAB
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4           "Number of spaces that a <Tab> counts for.
set softtabstop=4       "Number of spaces that a <Tab> counts for while editing.
set shiftwidth=4        "Number of spaces to be used for each step of (auto)indent.
set smarttab            "When hitting <Tab> or <Backspace> in front of line, 'shiftwidth' used.
"set expandtab          "No real tabs(insert spaces when <Tab> pressed).
set autoindent

"Set expandtab for some filetype
autocmd FileType make setlocal noexpandtab
autocmd FileType vim setlocal expandtab
au BufRead,BufNewFile *.log  set filetype=text
autocmd FileType text setlocal expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"paste mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set pastetoggle=<F2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tabpage
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:map <F4> :tabnew<CR>
:map <F5> :tabnext<CR>
:imap <F4> <ESC>:tabnew<CR>i
:imap <F5> <ESC>:tabnext<CR>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"persistent-undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version >= 703
    set undofile                    "Save undos after file closed
    set undodir=$HOME/.vim/undo     "Where to save undo histories
    "set undolevels=1000            "How many undos
    "set undoreload=10000           "Number of lines to save for undo

    "undotree
    nnoremap <F7> :UndotreeToggle<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-clang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_auto = 1
let g:clang_c_options = '-std=gnu11'
let g:clang_c_completeopt = 'longest,menuone,preview'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_cpp_completeopt = 'longest,menuone,preview'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EasyGrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let EasyGrepMode = 0
let EasyGrepRecursive = 1
let EasyGrepIgnoreCase = 1
let EasyGrepReplaceWindowMode = 2
let EasyGrepJumpToMatch = 0
let g:EasyGrepFilesToExclude = "GPATH,GRTAGS,GTAGS,tags,.svn,.git"
"let EasyGrepWindowPosition = "botright"

if executable('ag')
    set grepprg=ag
    let EasyGrepCommand = 1
elseif executable('grep')
    set grepprg=grep
    let EasyGrepCommand = 1
else
    set grepprg=''
    let EasyGrepCommand = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"gen_tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map <Ctrl>+<F12> to generate tags
nnoremap <C-F12> :GenGTAGS<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"preview
"nmap <leader>m :!markdown % \| lynx -stdin <CR><CR>
nmap <leader>m :!markdown % \| w3m -T text/html<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_c_checkers = ['gcc', 'cppcheck']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"editorconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

