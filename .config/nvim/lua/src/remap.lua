-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local kp = vim.keymap -- remap vim.keymap to just kp
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- TODO
-- real copy paste cut actions
-- move line(s) up / down
-- switch tabs
-- delete folders
-- any other cool keymaps??E


-- NEW SETUP

-- NAVIGATION
vim.keymap.set("n", "<leader>1", "^")   -- move to start of line (first non-empty chracter)
vim.keymap.set("n", "<leader>2", "$")   -- move to enddd of line

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down half page + cursor position fixed
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move upp half page + cursor position fixed

-- INSERT

-- MODIFY
vim.keymap.set("n", "<C-x>", "ydd")            -- cut selection
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]]) -- copy to system clipboard (thanku prime + asbjornHaland)
vim.keymap.set("n", "<C-v>", '"+pe')           -- paste from system clipboard

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")   -- move selected code in visual mode (down)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")   -- move selected code in visual mode (up)

-- DELETE
vim.keymap.set("n", "<A-d>", "diw") -- delete a word
vim.keymap.set("n", "<A-s>", "dw")  -- delete a sentence (after cursor)

-- VARIABLES

-- FILES / FOLDERS
vim.keymap.set("n", "s", function() -- write file (remap s to :w)
  vim.cmd("w")
end)

-- ACTIONS
vim.keymap.set("n", "<Leader>w", ":q<Return>", opts)              -- quit
vim.keymap.set("n", "<Leader>q", ":qa<Return>", opts)             -- quit all
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<Return>", opts) -- open side panel

vim.keymap.set("n", "<Leader>u", ":Lazy update<CR>", opts)

vim.keymap.set("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word cursor is on

-- MISC
-- vim.keymap.set("i", "<Leader>y", "<esc>") -- space+y to esc
