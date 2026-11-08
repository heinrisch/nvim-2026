-- Leader key
vim.g.mapleader = " "

-- Appearance
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Editing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.undofile = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- System clipboard (Wayland)
vim.opt.clipboard = "unnamedplus"

-- Window behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- More undu
vim.keymap.set("i", "<Space>", "<C-g>u<Space>")
vim.opt.undolevels = 10000
vim.opt.undofile = true

-- Pack
vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/neovim/nvim-lspconfig",
  { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
})

vim.cmd.colorscheme("tokyonight-night")

-- Keybinding hints
require("which-key").setup({
  spec = {
    { "<leader>f", group = "Find" },
  },
})

-- Buffer tabs
require("bufferline").setup({
  options = { diagnostics = "nvim_lsp" },
})

-- Flash navigation
require("flash").setup()
vim.keymap.set({ "n", "x", "o" }, "<leader>j", function()
  require("flash").jump()
end, { desc = "Flash jump" })
vim.keymap.set({ "n", "x", "o" }, "<leader>k", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

-- Local ZMA plugin
vim.opt.runtimepath:prepend(vim.fn.expand("~/src/zma-nvim"))
require("zma").setup()

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

-- fzf

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

-- Buffer navigation
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")

vim.keymap.set({ "n", "i", "x" }, "<D-s>", function()
  vim.cmd.stopinsert()
  vim.cmd.write()
  vim.cmd.bdelete()
end, { desc = "Save and close buffer" })

-- lsp

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

vim.keymap.set("n", "<leader>bd", "<cmd>update | bdelete<CR>", {
  desc = "Save and close buffer",
})
