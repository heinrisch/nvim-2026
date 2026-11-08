require("fzf-lua").setup()

vim.keymap.set("n", "<leader>ff", function()
  require("fzf-lua").files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
  require("fzf-lua").live_grep()
end, { desc = "Search project" })

vim.keymap.set("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "Find buffers" })
