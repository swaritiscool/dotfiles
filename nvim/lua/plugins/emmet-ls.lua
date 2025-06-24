-- plugins/emmet-ls.lua

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      emmet_ls = {
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      },
    },
  },
}
