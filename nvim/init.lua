vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local opt = vim.opt

opt.expandtab = true -- Use spaces instead of tabs
opt.list = true -- Show some invisible characters (tabs...
opt.number = true -- Print line number
opt.scrolloff = 4 -- Lines of context
opt.shiftwidth = 2 -- Size of an indent
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.wrap = false -- Disable line wrap
opt.autoindent = true
opt.backup = false
opt.gdefault = true
opt.splitbelow = true

require("lazy").setup({
  { "chaoren/vim-wordmotion" },
  { "dstein64/vim-startuptime" },
  { "echasnovski/mini.comment", version = false },
  { "echasnovski/mini.indentscope", version = false },
  { "ggandor/leap.nvim" },
  { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "jlanzarotta/bufexplorer" },
  { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = "all",
      ignore_install = { "haskell", "phpdoc" },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "RRethy/vim-illuminate" },
  { "sheerun/vim-polyglot" },
  { "tpope/vim-projectionist" },
  { "nvim-tree/nvim-tree.lua" },
  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = {"http", "rest"},
    opts = {
      -- your configuration comes here
      global_keymaps = true,
    },
  },
})


--
-- keymaps
--

vim.keymap.set("n", "K", "<Nop>")
vim.keymap.set("v", "K", "<Nop>")

vim.keymap.set("n", "<leader><space>", ":noh<CR>")

-- BufExplorer
vim.keymap.set("", "<leader>m", ":BufExplorer<CR>")

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- windows
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right" })
vim.keymap.set("n", "<C-w>-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<C-w>|", "<C-W>v", { desc = "Split window right" })

vim.cmd("cnoreabbrev E Explore")

--
-- autocmd
--
-- This file is automatically loaded by plugins.init

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

--
-- plugin setup
--

require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
 })

require("telescope").setup({
  defaults = { file_ignore_patterns = { "node_modules", "_build", "deps", "tmp" } }
})

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

require("leap").add_default_mappings(true)

require("mini.comment").setup()

require("mini.indentscope").setup({
  symbol = "│",
  options = { try_as_border = true },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

require("alpha").setup(require("alpha.themes.startify").config)

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  view = {
    side = 'right',
    width = 40,
  },
  update_focused_file = {
    enable = true,
    update_root = false,
  },
})

local function open_nvim_tree(data)
  
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file or no_name then
    return
  end

  local tree = require("nvim-tree.api").tree

  if not tree.is_visible then
    tree.toggle({ focus = false, find_file = true, })
  end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, { callback = open_nvim_tree })

local function toggle_tree(data)
  local tree = require("nvim-tree.api").tree
  tree.toggle({ focus = false, find_file = true, })
end

vim.keymap.set('n', '<leader>t', toggle_tree)

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "kanagawa",
    callback = function()
        if vim.o.background == "light" then
            vim.fn.system("kitty +kitten themes Kanagawa_light")
        elseif vim.o.background == "dark" then
            vim.fn.system("kitty +kitten themes Kanagawa_dragon")
        else
            vim.fn.system("kitty +kitten themes Kanagawa")
        end
    end,
})

vim.api.nvim_set_hl(0, "@string.special.symbol", { link = "Atom" })

-- vim.cmd('hi @string.special.symbol.elixir guifg=Red')

require('kanagawa').setup({
  overrides = function(colors)
    return {
      ["@string.special.symbol"] = { fg = colors.theme.syn.special3 },
    }
  end,
})

vim.cmd("colorscheme kanagawa")

require('lualine').setup()

vim.api.nvim_set_option("clipboard","unnamed")
