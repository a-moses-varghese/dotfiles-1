vim.opt.laststatus = 0        -- Disable the statusline

vim.opt.number = true         -- show line number
vim.opt.relativenumber = true -- use relative line number

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.scrolloff = 8

-- these highlight the line num the cursor is on
vim.opt.cul = true
vim.opt.culopt = "number"

-- folding
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false  -- Automatically enable folding when opening files
vim.opt.foldlevel = 99      -- prevent all folds from closing

