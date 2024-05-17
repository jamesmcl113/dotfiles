vim.opt.number = true
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.spell = true

-- fold stuff not really working yet...
--[[
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 1

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  desc = "update folds in markdown after editing.",
  callback = function()
    vim.opt.foldmethod = "expr"
    print("done")
  end
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  desc = "update folds in markdown after editing.",
  callback = function()
    vim.cmd("norm zR")
  end
})
--]]
