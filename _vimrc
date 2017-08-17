"Turn off vi-compatible mode
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("compatible")
"filetype off
"Specify a directory for plugins
call plug#begin('~/.vim/bundle')
Plug 'justmao945/vim-clang'             "Auto-completion
Plug 'tpope/vim-endwise'                "End certain structures automatically(C preprocessor...)
Plug 'SirVer/ultisnips'                 "Code snippet
Plug 'honza/vim-snippets'               "Code snippet
Plug 'jsfaint/gen_tags.vim'             "Generate and load tags
Plug 'majutsushi/tagbar'                "Browse the tags
Plug 'Raimondi/delimitMate'             "Auto closing of parenthesis, brackets, ...

Plug 'editorconfig/editorconfig-vim'    "EditorConfig
Plug 'w0rp/ale'                         "Lint(Syntax checking)
"Plug 'vim-syntastic/syntastic'
Plug 'embear/vim-foldsearch'            "Fold away lines that don't match a search pattern
Plug 'gko/vim-coloresque'               "CSS/LESS/SASS/HTML color preview

Plug 'rhysd/committia.vim'              "Improve for Git commit message editor
Plug 'tpope/vim-fugitive'               "Git Wrapper
"Plug 'junegunn/gv.vim'                 "Git commit browser

Plug 'dkprice/vim-easygrep'             "Find and replace across multiple files
Plug 'tpope/vim-surround'               "Easily add, delete and change parentheses/brackets/quotes
Plug 'tpope/vim-repeat'                 "Repeating supported plugin maps with '.'

Plug 'will133/vim-dirdiff', { 'on': 'DirDiff' }     "Diff two directories
Plug 'chrisbra/vim-diff-enhanced'       "Better Diff

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }  "Undo history visualizer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  "File explorer
Plug 'EinfachToll/DidYouMean'           "Ask for the right file to open
Plug 'ConradIrwin/vim-bracketed-paste'  "Paste mode(automatic `:set paste`)

Plug 'vim-airline/vim-airline'          "Status/tabline
Plug 'vim-airline/vim-airline-themes'
call plug#end()
"filetype plugin indent on
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
set term=xterm-256color

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
    "set guifont=monospace\ 14   "Set font of GVIM
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 14
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
set expandtab           "No real tabs(insert spaces when <Tab> pressed).
set autoindent

"Set expandtab for some filetype
autocmd FileType make setlocal noexpandtab
autocmd FileType vim setlocal expandtab
au BufRead,BufNewFile *.log  set filetype=text
autocmd FileType text setlocal expandtab


"C/C++: Highlight trailling space
let c_space_errors = 1
"C/C++: Highlight mixed tab and space
let c_space_error = 1

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
"ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map movement through errors with wrapping.
nmap <silent> <C-h> <Plug>(ale_previous_wrap)
nmap <silent> <C-l> <Plug>(ale_next_wrap)
let g:ale_c_clang_options='-std=gnu11 -Wall'
let g:ale_c_gcc_options='-std=gnu11 -Wall'
let g:ale_cpp_clang_options='-std=gnu++14 -Wall'
let g:ale_cpp_gcc_options='-std=gnu++14 -Wall'
let g:ale_sh_shellcheck_options='-x'
let g:ale_sh_shellcheck_exclusions='SC2086,SC2181,SC2006,SC2039,SC2162'
let g:ale_c_cppcheck_options='--enable=style --suppress=variableScope'
let g:ale_cpp_cppcheck_options='--enable=style --suppress=variableScope'
let g:ale_linters = {'cpp': ['cppcheck', 'clang']}

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   'W%d E%d', all_non_errors, all_errors
    \)
endfunction
set statusline+=[%{LinterStatus()}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_sh_shellcheck_args='-x -e SC2086,SC2181,SC2006,SC2039,SC2162'
"let g:syntastic_c_cppcheck_args='--enable=style --suppress=variableScope'
"let g:syntastic_cpp_cppcheck_args='--enable=style --suppress=variableScope'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"editorconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_symbols_ascii = 1
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
