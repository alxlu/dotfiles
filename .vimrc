"Pathogen
"disabled for now..
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect()

set guifont=Monoid:h10

"vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
" Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }
call plug#end()

"Turn off compatability mode
set nocompatible
filetype plugin on
filetype plugin indent on
syntax on

"bind nohl
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"Shows current typed command
set showcmd

"Set autoindentt
set autoindent

"Tab completion
set wildmenu
set wildmode=list:longest,full

"Optimize for fast terminal connections
set ttyfast

"Enable mouse support
set mouse=a

"Show line numbers
set number

"Don't add empty newlines at end of files
"set binary
"set noeol

"Don't create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

"Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

"Remove buffer when closed
set nohidden

"Status line information
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

"Syntax highlighting
filetype plugin indent on
syntax on
set background=dark

"Color scheme
" colorscheme seoul256
" colorscheme gotham
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE


"Highlight current line
set cul

"Set tabs
set expandtab
"set tabstop=2
set shiftwidth=2
set softtabstop=2

"Ignore case of searches
set ignorecase

"Highlight dynamically as pattern is typed
set incsearch

"Show invisible characters
set listchars=tab:▸\ ,trail:·,nbsp:␣
set list

" Show the cursor position
set ruler

"Show the current mode
set showmode

"Show the (partial) command as it's being typed
set showcmd

"Allow deleting previous items and indents
set backspace=indent,eol,start

"Find path settings
set path=$PWD/**

"Key remaps
nnoremap <C-Q> <C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Change split behavior
set splitbelow
set splitright

"ctrlp
set runtimepath^=~/.vim/plugged/ctrlp.vim

"ctrlp only searches working directory
let g:ctrlp_working_path_mode = 0

"ignore certain directories and files
set wildignore+=*/node_modules/*,*/.git/*,*/tmp/*,*.so,*.swp,*.zip

"js syntax
":autocmd Syntax * call SyntaxRange#Include('@begin=js@', '@end=js@', 'javascript', 'NonText')
":autocmd Syntax * call SyntaxRange#Include('@begin=bash@', '@end=bash@', 'sh', 'NonText')

"orgmode agenda
"let g:org_agenda_files = ['~/Dropbox/orgmode/*.org']

let g:vimwiki_folding='expr'
