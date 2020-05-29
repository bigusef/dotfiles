"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          __   _ _ _ __ ___  _ __ ___                          "
"                          \ \ / / | '_ ` _ \| '__/ __|                         "
"                           \ V /| | | | | | | | | (__                          "
"                            \_/ |_|_| |_| |_|_|  \___|                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugin Manager                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install the plugin manager if it doesn't exist
let s:plugin_manager=expand('~/.vim/autoload/plug.vim')
let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:plugin_manager))
    echom 'vim-plug not found. Installing...'
    if executable('curl')
        silent exec '!curl -fLo ' . s:plugin_manager . ' --create-dirs ' . s:plugin_url
    elseif executable('wget')
        call mkdir(fnamemodify(s:plugin_manager, ':h'), 'p')
        silent exec '!wget --force-directories --no-check-certificate -O ' . expand(s:plugin_manager) . ' ' . s:plugin_url
    else
        echom 'Could not download plugin manager. No plugins were installed.'
        finish
    endif
    augroup vimplug
        autocmd!
        autocmd VimEnter * PlugInstall
    augroup END
endif

" List all plugins
"" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugins')

" Colorscheme, status bar and tabline bar
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'

" Tree and file explorer and icon for files
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" General Programing pack
Plug 'tpope/vim-sensible'

" Programing language syntax
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-dotenv'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Global Settings                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tab
set expandtab

" Fix arabic direction
set termbidi

" Fix italic highlighting
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" Enable line numbers
set number
set relativenumber
set nocompatible

" Highlight search results
set hlsearch

" Access your system clipboard
set clipboard=unnamed

" Turn backup off, since most stuff is in SVN, git etc.
set nobackup
set nowb
set noswapfile

" Open new split to below or right
set splitbelow
set splitright
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           custom bindings for key mapping                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change leader key to Space
let mapleader = "\<Space>"

" Change split navigations key mapping
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Set leader+s to save current file
nmap <Leader>s :w<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               ColorScheme Settings                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set colors for termnail
set t_Co=256

" Dracula setting
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 0

" Set colorscheme
colorscheme dracula
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Airline Settings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rrequired settings
set laststatus=2

" set theme
let g:airline_theme='dracula'

" Allow theme and icon as powerline
let g:airline_powerline_fonts=1

" Tabline enable and settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Set git integration
let g:airline#extensions#branch#enabled=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                NERDTree Settings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toogle NERDTree
nmap <Leader>t :NERDTreeToggle<CR>

" Open and close folder
let g:DevIconsEnableFoldersOpenClose = 1

" Change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Python Settings                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config syntax plugin
let g:python_highlight_builtins = 1
let g:python_highlight_doctests = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1
let g:python_highlight_string_formatting = 1

" set tab and indent width
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set fileformat=unix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         HTML, CSS, Javascript Settings                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tab and indent width
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          __   _ _ _ __ ___  _ __ ___                          "
"                          \ \ / / | '_ ` _ \| '__/ __|                         "
"                           \ V /| | | | | | | | | (__                          "
"                            \_/ |_|_| |_| |_|_|  \___|                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
