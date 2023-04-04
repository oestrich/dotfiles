local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
  },
  { "jlanzarotta/bufexplorer" },
  { "bkad/CamelCaseMotion" },
  { "sheerun/vim-polyglot" },
  { "tpope/vim-projectionist" },
  { "sainnhe/sonokai" },
}, {
  concurrency = 30,
  install = {
    missing = true,
    colorscheme = { "sonokai" },
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
