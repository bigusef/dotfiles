"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          __   _ _ _ __ ___  _ __ ___                          "
"                          \ \ / / | '_ ` _ \| '__/ __|                         "
"                           \ V /| | | | | | | | | (__                          "
"                            \_/ |_|_| |_| |_|_|  \___|                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 VIM Plugin List                               "
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

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" - Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" Colorscheme and statusLine 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'

" File Explorer and search into file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" General Programing pack
Plug 'tpope/vim-sensible'

" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Global Settings                              "
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
"                                    Key mapping                                "
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
"                                 Theming Settings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defualt color options
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

" Dracula colorscheme setting
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 0
colorscheme dracula

" StatusLine Option
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Python Settings                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set indent setting
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set fileformat=unix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         HTML, CSS, Javascript Settings                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set indent setting
au BufNewFile ,BufRead *.js,*.html,*.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          __   _ _ _ __ ___  _ __ ___                          "
"                          \ \ / / | '_ ` _ \| '__/ __|                         "
"                           \ V /| | | | | | | | | (__                          "
"                            \_/ |_|_| |_| |_|_|  \___|                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""