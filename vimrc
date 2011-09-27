call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype off
filetype plugin indent on

let mapleader = ","

set nocompatible

set pastetoggle=<F2>

set number

set foldmethod=syntax

"
" Colorscheme
"
set background=dark
colorscheme solarized

"
" Show trailing spaces
"
set listchars=tab:»·,trail:·
set list

"
" Tabs
"
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set autoindent

"Incremental search
set incsearch
set hlsearch

"
" Backup files
"
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"No noise
set noerrorbells

set wildmenu

set scrolloff=10

set foldmethod=syntax
set foldlevel=100

"
" Remaps
"

" Toggle number
nnoremap <F3> :set nonumber!<CR>

map <Leader>, :NERDTreeToggle<CR>
map <Leader>t :CommandT<CR>
map <Leader>f :CommandTFlush<CR>
map <Leader>b :BufExplorer<CR>
map <Leader>a :Ack 
map <Leader><Space> :noh<CR>

" Tabs
map <c-w>t :tabnew<CR>
map <Leader>p :tabnext<CR>
map <Leader>o :tabprev<CR>

map K <Nop>

" CommandT
let g:CommandTMaxHeight=20

"
" Rails
"

" Custom shit for Rails.vim 
autocmd User Rails Rnavcommand uploader app/uploaders -suffix=_uploader.rb -default=model()
autocmd User Rails Rnavcommand steps features/step_definitions -suffix=_steps.rb -default=web
autocmd User Rails Rnavcommand blueprint spec/blueprints -suffix=_blueprint.rb -default=model()
autocmd User Rails Rnavcommand factory spec/factories -suffix=_factory.rb -default=model()
autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
autocmd User Rails Rnavcommand feature features -suffix=.feature -default=cucumber
autocmd User Rails Rnavcommand support spec/support features/support -default=env

"
" Cucumber
"
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/\\\@<!|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

