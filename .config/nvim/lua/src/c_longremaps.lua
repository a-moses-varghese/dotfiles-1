-- some remaps are lengthy and can cause clutter so we'll put them in this file

-- INSERT
vim.keymap.set('n', '<C-m>', function()
  local line = vim.api.nvim_get_current_line()
  local filetype = vim.bo.filetype

  local comment_prefix = ""
  if filetype == "python" then
    comment_prefix = "# "
  elseif filetype == "lua" then
    comment_prefix = "-- "
  else
    comment_prefix = "// "
  end

  if vim.startswith(line:match("^%s*(.*)"), comment_prefix) then
    local new_line = line:gsub("^(%s*)" .. vim.pesc(comment_prefix), "%1", 1)
    vim.api.nvim_set_current_line(new_line)
  else
    local new_line = line:gsub("^(%s*)", "%1" .. comment_prefix)
    vim.api.nvim_set_current_line(new_line)
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end) -- single line comment (supports //, --, and #, assumes // is the main way to comment)
-- or just press enter bruh

vim.keymap.set('v', '<C-,>', function()
  local filetype = vim.bo.filetype

  local comment_prefix = ""
  if filetype == "python" then
    comment_prefix = "#"
  elseif filetype == "lua" then
    comment_prefix = "--"
  else
    comment_prefix = "//"
  end

  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("I", true, false, true), 'n', false)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(comment_prefix, true, false, true), 'n', false)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end) -- multi-line comment w visual block mode (assumes // is the main way to comment)

vim.keymap.set('v', '<C-.>', function()
  local filetype = vim.bo.filetype

  local comment_prefix = ""
  local jump_step = 0
  if filetype == "python" then
    comment_prefix = "#"
  elseif filetype == "lua" then
    comment_prefix = "--"
    jump_step = 1
  else
    comment_prefix = "//"
    jump_step = 1
  end

  for i = 1, jump_step do
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), 'n', false)
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("x", true, false, true), 'n', false)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end) -- multi-line uncomment with visual block mode (assumes // is the main way to comment)

-- ACTIONS
vim.keymap.set('n', 'z', function()
  local current_line = vim.fn.line('.')
  local is_folded = vim.fn.foldclosed(current_line)

  if is_folded ~= -1 then
    vim.cmd('normal! zo')
  else
    vim.cmd('normal! zc')
  end
end, { noremap = true, silent = true }) -- toggle fold for current code block

vim.keymap.set('n', 'Z', function()
  local foldlevel = vim.api.nvim_eval('foldlevel(".")') -- Check the current fold level

  if foldlevel > 0 then
    vim.cmd('normal! zR')
  else
    vim.cmd('normal! zM')
  end
end, { noremap = true, silent = true }) -- toggle fold for all code blocks
