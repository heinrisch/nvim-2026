-- Break undo history at spaces while typing.
vim.keymap.set("i", "<Space>", "<C-g>u<Space>")

-- Buffer navigation
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set({ "n", "i", "x" }, "<D-s>", function()
  vim.cmd.stopinsert()
  vim.cmd.write()
  vim.cmd.bdelete()
end, { desc = "Save and close buffer" })

vim.keymap.set("n", "<leader>bd", "<cmd>update | bdelete<CR>", {
  desc = "Save and close buffer",
})

vim.keymap.set("n", "<leader>bq", "<cmd>bdelete!<CR>", {
  desc = "Close buffer without saving",
})
