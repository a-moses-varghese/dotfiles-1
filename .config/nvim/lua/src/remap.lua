-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local kp = vim.keymap -- remap vim.keymap to just kp
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Save file, quit all
vim.keymap.set("n", "<Leader>w", ":update<Return>", opts)
vim.keymap.set("n", "<Leader>q", ":qa<Return>", opts)

vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<Return>", opts)

-- TO BE CHANGED

-- Essentials

-- TODO
-- real copy paste cut actions
-- move line(s) up / down
-- switch tabs
-- delete folders
-- any other cool keymaps??E

-- delete file
-- :call delete(expand('%')) | bdelete!

-- NEW SETUP

-- NAVIGATION
vim.keymap.set("n", "1", "^") -- move to start of line (first non-empty chracter)
vim.keymap.set("n", "0", "$") -- move to enddd of line

-- vim.keymap.set({ "n", "v" }, "j", "k") -- reverse direction up
-- vim.keymap.set({ "n", "v" }, "k", "j") -- reverse direction down

-- INSERT

-- MODIFY
vim.keymap.set("n", "<C-x>", "ydd")  -- cut selection
vim.keymap.set("n", "<C-v>", '"+pe') -- paste from clipboard
-- vim.keymap.set("n", "<A-Down>", "Vyddp") -- move line down

vim.keymap.set("n", "<A-Up>", "ddkP")        -- move line uppp
vim.keymap.set("n", "<A-Down>", "Vyddp")     -- move line down

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected code in visual mode (down)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected code in visual mode (up)

-- vim.keymap.set("n", "<A-Up>", "xkP")  -- move selection uppp
-- vim.keymap.set("n", "<A-Down>", "xp") -- move selection down

-- DELETE
vim.keymap.set("n", "<A-d>", "diw") -- delete a word
vim.keymap.set("n", "<A-s>", "dw")  -- delete a sentence (after cursor)

-- VARIABLES

-- FILES / FOLDERS

-- ACTIONS
-- vim.keymap.set("n", "#", "zM") -- delete a word


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word cursor is on

-- MISC
