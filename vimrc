call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype off
filetype plugin indent on

let mapleader = ","

set nocompatible

set pastetoggle=<F2>
 
set number
 
"set ts=2
"set expandtab

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set autoindent

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
map <Leader>t :CommandT<CR>
map <Leader>f :CommandTFlush<CR>

" Custom shit for Rails.vim 
autocmd User Rails Rnavcommand uploader app/uploaders -suffix=_uploader.rb -default=model()
autocmd User Rails Rnavcommand steps features/step_definitions -suffix=_steps.rb -default=web
autocmd User Rails Rnavcommand blueprint spec/blueprints -suffix=_blueprint.rb -default=model()
autocmd User Rails Rnavcommand factory spec/factories -suffix=_factory.rb -default=model()
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
autocmd User Rails Rnavcommand feature features -suffix=.feature -default=cucumber
autocmd User Rails Rnavcommand support spec/support features/support -default=env

