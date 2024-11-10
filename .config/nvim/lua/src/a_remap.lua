local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- NAVIGATION
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down half page + cursor position fixed
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move upp half page + cursor position fixed

-- INSERT
-- add something here

-- MODIFY
vim.keymap.set("v", "<leader>x", [["+ydd]]) -- cut selection to sys clipboard
vim.keymap.set("v", "<leader>y", [["+y]])   -- copy to sys clipboard (prime + asbjornHaland)
--vim.keymap.set("n", "<leader>p", '"+pe')           -- paste from system clipboard

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
vim.keymap.set("i", "C-c", "<esc>", opts)                     -- esc in insert mode
vim.keymap.set({ "n", "v" }, "<leader>w", ":q<Return>", opts) -- quit
vim.keymap.set("n", "<leader>q", ":qa<Return>", opts)         -- quit all
vim.keymap.set("n", "<Leader>e", ":Ex<Return>", opts)         -- open side panel

vim.keymap.set("n", "<leader>u", ":Lazy update<CR>", opts)    -- lazy update
-- replace word cursor is on (prime)
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- split screen: Map leader + l to perform :vert topleft split
vim.keymap.set("n", "<leader>l", ":vert topleft split<CR>", { noremap = true, silent = true })
-- Move to the left split with ; + ;
vim.keymap.set("n", ";;", "<C-w>h", { noremap = true, silent = true })
-- Move to the right split with ' + '
vim.keymap.set("n", "''", "<C-w>l", { noremap = true, silent = true })

-- MISC
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- LONG REMAPS --

-- some remaps are lengthy and can cause clutter so we'll put them here

-- INSERT

-- ACTIONS
vim.keymap.set("n", "z", function()
  local current_line = vim.fn.line(".")
  local is_folded = vim.fn.foldclosed(current_line)

  if is_folded ~= -1 then
    vim.cmd("normal! zo")
  else
    vim.cmd("normal! zc")
  end
end, { noremap = true, silent = true }) -- toggle fold for current code block

vim.keymap.set("n", "Z", function()
  local foldlevel = vim.api.nvim_eval('foldlevel(".")') -- Check the current fold level

  if foldlevel > 0 then
    vim.cmd("normal! zR")
  else
    vim.cmd("normal! zM")
  end
end, { noremap = true, silent = true }) -- toggle fold for all code blocks
