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
          "gopls",
          "pyright",
          "css-lsp",
          "typescript-language-server",
          "tailwindcss-language-server",
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
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })

      -- automation
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

      -- Web / Mobile Development
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, -- Ensure React file types are supported
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        on_attach = function(client)
          -- Disable tsserver/ts_ls own formatting, let Prettier handle it
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })

      -- misc
      lspconfig.lua_ls.setup({ capabilities = capabilities })
    end,
  },
}
