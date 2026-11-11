-- Local ZMA plugin
vim.opt.runtimepath:prepend(vim.fn.expand("~/src/zma-nvim"))
require("zma").setup()

vim.keymap.set({ "n", "x" }, "<leader>lw", function()
  require("zma").paste_link("wiki")
end, { desc = "ZMA: wrap as wiki link" })

vim.keymap.set({ "n", "x" }, "<leader>lp", function()
  require("zma").paste_link("person")
end, { desc = "ZMA: wrap as person link" })
