-- Pack
vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("TreesitterUpdate", { clear = true }),
  callback = function(event)
    if event.data.spec.name == "nvim-treesitter" and event.data.kind == "update" then
      require("nvim-treesitter").update()
    end
  end,
})

vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/neovim/nvim-lspconfig",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
})

-- Keep plugin setup explicit so dependencies and startup order are easy to follow.
require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.which-key")
require("plugins.bufferline")
require("plugins.flash")
require("plugins.zma")
require("plugins.completion")
require("plugins.fzf")
