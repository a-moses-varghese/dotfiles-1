-- telescope for fuzzy finding files, strings, and other actions
return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require('telescope').setup({})

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})         -- space+space to search for file names
            vim.keymap.set('n', '<leader>f', builtin.live_grep, {})                 -- space+f to search string across all files
            vim.keymap.set('n', '<leader>d', builtin.current_buffer_fuzzy_find, {}) -- space+d to search string across current file (buffer)
            -- for more actions, use ':help telescope' in nvim
            -- add more actions here...
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
