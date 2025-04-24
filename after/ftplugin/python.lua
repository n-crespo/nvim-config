if package.loaded["lspconfig"] then
  require("lspconfig").pylsp.setup({
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "E501" }, -- this disables errors about lines being too long
          },
        },
      },
    },
  })
end
