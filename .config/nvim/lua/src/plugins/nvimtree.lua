-- nvim tree for file explorer tree
return {
  -- nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        -- (recommended) disable netrw
        disable_netrw = true,
        hijack_netrw = true,
        -- other actions
        actions = {
          open_file = {
            quit_on_open = true, -- close nvimtree after opening a filename
          },
        },
        view = {
          width = 30, -- set the width of nvimtree
          relativenumber = true,
        },
        renderer = {
          group_empty = false,
          icons = {
            git_placement = "signcolumn",
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
            glyphs = {
              default = "", -- Default file icon
              symlink = "",
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = {
            "node_modules/.*",
          },
        },
      })
    end,
  },
}
