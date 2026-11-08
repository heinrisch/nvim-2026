-- Treesitter highlighting; install the initial parsers when the CLI is available.
if vim.fn.executable("tree-sitter") == 1 then
  require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "query", "bash", "json", "markdown", "markdown_inline" })
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(event.buf, lang)
    end
  end,
})
