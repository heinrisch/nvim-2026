-- Flash navigation
require("flash").setup()
vim.keymap.set({ "n", "x", "o" }, "<leader>j", function()
  require("flash").jump()
end, { desc = "Flash jump" })
vim.keymap.set({ "n", "x", "o" }, "<leader>k", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
