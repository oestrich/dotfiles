-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})
