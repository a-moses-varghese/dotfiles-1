local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- NAVIGATION
vim.keymap.set("n", "<C-1>", "^")       -- move to start of line (first non-empty chracter)
vim.keymap.set("n", "<C-2>", "$")       -- move to enddd of line

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down half page + cursor position fixed
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move upp half page + cursor position fixed

vim.keymap.set('i', '<C-s>', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), 'n', false)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("^", true, false, true), 'n', false)
end) -- jump to start of line in insert mode

vim.keymap.set('i', '<C-e>', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), 'n', false)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("$", true, false, true), 'n', false)
end) -- jump to end of line in insert mode


-- INSERT
-- add something here

-- MODIFY
vim.keymap.set("n", "<C-x>", "ydd")            -- cut selection
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]]) -- copy to system clipboard (thanku prime + asbjornHaland)
-- vim.keymap.set("n", "<C-x>", '"+pe')           -- paste from system clipboard

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected code in visual mode (down)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected code in visual mode (up)

-- DELETE
vim.keymap.set("n", "<A-d>", "diw") -- delete a word
vim.keymap.set("n", "<A-s>", "dw")  -- delete a sentence (after cursor)

-- VARIABLES

-- FILES / FOLDERS
vim.keymap.set("n", "s", function() -- write file (remap s to :w)
  vim.cmd("w")
end)

-- ACTIONS
vim.keymap.set("i", "C-c", "<esc>", opts)                         -- esc in insert mode
vim.keymap.set({ "n", "v" }, "<Leader>w", ":q<Return>", opts)     -- quit
vim.keymap.set("n", "<Leader>q", ":qa<Return>", opts)             -- quit all
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<Return>", opts) -- open side panel

vim.keymap.set("n", "<Leader>u", ":Lazy update<CR>", opts)        -- lazy update
-- replace word cursor is on (prime)
vim.keymap.set("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- split screen: Map leader + l to perform :vert topleft split
vim.keymap.set('n', '<leader>l', ':vert topleft split<CR>', { noremap = true, silent = true })
-- Move to the left split with ; + ;
vim.keymap.set('n', ';;', '<C-w>h', { noremap = true, silent = true })
-- Move to the right split with ' + '
vim.keymap.set('n', "''", '<C-w>l', { noremap = true, silent = true })

-- MISC
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
