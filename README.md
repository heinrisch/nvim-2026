# Neovim configuration

Uses Neovim's built-in `vim.pack` package manager and `vim.lsp.config` APIs.

- `init.lua`: entry point and startup order.
- `lua/config/options.lua`: editor options and leader key.
- `lua/config/keymaps.lua`: general editing and buffer mappings.
- `lua/config/plugins.lua`: package list, update hook, and plugin setup order.
- `lua/config/lsp.lua`: language server settings and LSP mappings.
- `lua/plugins/`: one module per plugin or feature, including its mappings.
- `nvim-pack-lock.json`: pinned package revisions.

To add a plugin, add its source to `vim.pack.add` in `lua/config/plugins.lua`,
create its setup module under `lua/plugins/`, and require that module after the
package list. Options load first so the leader key is available to every plugin.

The local ZMA plugin is loaded from `~/src/zma-nvim`. Lua LSP support requires
`lua-language-server` on your PATH. Initial Treesitter parser installation runs
when the `tree-sitter` CLI is available.
