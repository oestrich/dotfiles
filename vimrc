call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on

let mapleader = ","

set nocompatible

set pastetoggle=<F2>
 
set autoindent
set number
 
"set ts=2
"set expandtab

set ts=4
set expandtab

"Incremental search
set incsearch
 
"Backup files
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
  
"No noise
set noerrorbells
   
set wildmenu
    
set scrolloff=10
     
set foldmethod=syntax
set foldlevel=100
     
"Toggle number
nnoremap <F3> :set nonumber!<CR>

map <Leader>, :NERDTreeToggle<CR>
