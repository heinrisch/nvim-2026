vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
})

vim.lsp.enable("lua_ls")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
  desc = "Go to definition",
})
