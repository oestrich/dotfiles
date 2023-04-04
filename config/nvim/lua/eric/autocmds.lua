local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufnewFile", "BufRead" }, {
  pattern = "*.md",
  callback = function()
    vim.opt_local.filetype = "markdown"
  end,
})
