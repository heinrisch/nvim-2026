-- Local ZMA plugin
vim.opt.runtimepath:prepend(vim.fn.expand("~/src/zma-nvim"))
require("zma").setup()
