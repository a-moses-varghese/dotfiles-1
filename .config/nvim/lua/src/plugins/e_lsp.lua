-- lsp for language server protocol
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "rust-analyzer",
          "clangd",
          "zls",
          "pyright",
          "css-lsp",
          "typescript-language-server",
          "tailwindcss-language-server",
          "eslint-lsp"
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "tailwindcss",
          "eslint",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      -- systems
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.zls.setup({ capabilities = capabilities })

      -- automation
      -- lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off", -- or "basic" for some type checking
            },
          },
        },
      })

      -- Web Development
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, -- Ensure React file types are supported
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        on_attach = function(client)
          -- Disable tsserver/ts_ls own formatting, let Prettier handle it
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, -- Enable for React
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll", -- Automatically fix issues on save
          })
        end,
      })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })

      -- misc
      lspconfig.lua_ls.setup({ capabilities = capabilities })
    end,
  },
  -- rust
  {
    "rust-lang/rust.vim", -- format on save
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim", -- crate version completion
    ft = { "toml" },
    config = function()
      require("crates").setup({
        completion = {
          cmp = {
            enabled = true,
          },
        },
      })
      require("cmp").setup.buffer({
        sources = { { name = "crates" } },
      })
    end,
  },
  -- zig
  {
    "ziglang/zig.vim",
    ft = "zig",
    init = function()
      vim.g.zig_fmt_autosave = 1
    end,
  },
}
