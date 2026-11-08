-- Completion
require("blink.cmp").setup({
  enabled = function()
    return vim.bo.omnifunc ~= "v:lua.require'zma'.omnifunc"
  end,
  keymap = { preset = "default" },
  completion = { documentation = { auto_show = true } },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  fuzzy = { implementation = "lua" },
})
