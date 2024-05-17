return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim", -- formatting
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"

    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }

    mason_lspconfig.setup {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "wgsl_analyzer",
        "tsserver",
        "pyright",
        "hls",
        "jsonls",
        "clangd",
        "gopls",
        "astro",
        "cssls",
        "html"
      },
      automatic_installation = true,
    }

    require("mason-null-ls").setup {
      ensure_installed = {
        "stylua",
        "gofmt",
        "eslint_d",
        "prettier",
      },
    }

    local null_ls = require "null-ls"
    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

    null_ls.setup {
      debug = false,
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              vim.lsp.buf.format { buffer = bufnr, timeout_ms = 3000 }
            end,
          })
        else
          print("not supported!")
        end
      end,
    }
  end,
}
