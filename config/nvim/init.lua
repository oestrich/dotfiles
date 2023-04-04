vim.g.mapleader = ","

require("eric.lazy")
vim.cmd.colorscheme("sonokai")
require("eric.autocmds")

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"

vim.g.omni_sql_no_default_maps = 1

vim.opt.pastetoggle = "<F2>"
vim.opt.foldlevel = 100
vim.opt.hidden = true
vim.opt.ruler = true

vim.opt.listchars = { tab = "»·", trail = "·" }
vim.opt.list = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.autoindent = true

-- Incremental search
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Backup files
vim.opt.backup = false
vim.opt.backupdir = "~/.vim/backup"
vim.opt.directory = "~/.vim/tmp"

-- No noise
vim.opt.errorbells = false

vim.opt.wildmenu = true

vim.opt.scrolloff = 10

-- /g when searching and replacing
vim.opt.gdefault = true

-- have the split open below the current window
vim.opt.splitbelow = true

vim.g.session_autoload = "no"

vim.opt.laststatus = 2

vim.g.loaded_logipat = 1

vim.cmd([[cnoreabbrev E Explore]])

vim.opt.number = true
vim.cmd([[
nnoremap <F3> :set nonumber!<CR>

map <leader>m :BufExplorer<CR>
map <Leader>a :Ggrep
map <Leader><Space> :noh<CR>

" Tabs
map <c-w>t :tabnew<CR>
map <Leader>p :tabnext<CR>
map <Leader>o :tabprev<CR>

nnoremap K <Nop>
vnoremap K <Nop>

" Splits
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" Kill help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Easy substitution
nnoremap <Leader>s :s//c<left><left>
vnoremap <Leader>s :s//c<left><left>
nnoremap <Leader>d :s///c<left><left><left>
vnoremap <Leader>d :s///c<left><left><left>

" Source vimrc
nnoremap <Leader>` :source $MYVIMRC<CR>

" Remove trailing whitespace
nnoremap <Leader>ts :%s/\s\+$//<CR>

" re-indent xml
map <F4> :%s/>\s*</>\r</g<CR>:set ft=xml<CR>gg=G

" easier quickfix list navigation
nnoremap <Leader>n :cn<CR>
]])
