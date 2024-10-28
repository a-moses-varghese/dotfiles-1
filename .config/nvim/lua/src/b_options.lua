vim.opt.laststatus = 0        -- Disable the statusline

vim.opt.number = true         -- show line number
vim.opt.relativenumber = true -- use relative line number
-- these highlight the line num the cursor is on
vim.opt.cul = true
vim.opt.culopt = "number"

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.scrolloff = 8

-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false -- Automatically enable folding when opening files
vim.opt.foldlevel = 99     -- prevent all folds from closing

-- go specific options, there's probably a better way but i'm lazy rn
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.expandtab = false -- Use tabs instead of spaces
    vim.bo.shiftwidth = 4    -- Set the width for auto-indents to 4
    vim.bo.tabstop = 4       -- Set the tab width to 4 spaces
  end,
})
