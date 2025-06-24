return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          basedpyright = {
            typeCheckingMode = "basic", -- or "strict"
            disableOrganizeImports = false,
          },
        },
      },
    },
    setup = {
      basedpyright = function(_, opts)
        -- Optional: organize imports and format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.py",
          callback = function()
            vim.lsp.buf.code_action({
              context = { only = { "source.organizeImports" } },
              apply = true,
            })
            vim.lsp.buf.format({ async = false })
          end,
        })
        return false -- Use default setup
      end,
    },
  },
}
