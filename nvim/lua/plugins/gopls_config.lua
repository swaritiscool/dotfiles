return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            staticcheck = true,
          },
        },
      },
    },
    setup = {
      gopls = function(_, _)
        -- Auto organize imports + format Go files on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
            vim.lsp.buf.code_action({
              context = { only = { "source.organizeImports" } },
              apply = true,
            })
            vim.lsp.buf.format({ async = false })
          end,
        })
        return false -- use default setup
      end,
    },
  },
}
