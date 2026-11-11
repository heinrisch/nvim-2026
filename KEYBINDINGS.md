# Keyboard shortcuts

Reference for this Neovim configuration, including the enabled plugin defaults.
Standard Vim commands are not exhaustively listed; use `:help index` for the full
built-in reference. Plugin defaults reflect the locally installed versions.

## Notation

- **Leader** is **Space**. `Space f f` means press those keys in sequence.
- `Ctrl`, `Shift`, and `Alt` indicate keys held together with the following key.
- `D-s` means Super/Command + s and requires a frontend that sends that key.
- **Normal** is the command mode; **Insert** is typing mode; **Visual** selects
  text; **Operator-pending** follows an operator such as `d`, `c`, or `y`.
- Uppercase letters are case-sensitive: `H` means Shift + h.

## Buffers and editing

| Shortcut | Mode | Action |
| --- | --- | --- |
| `H` | Normal | Previous buffer. |
| `L` | Normal | Next buffer. |
| `Space b n` | Normal | Next buffer. |
| `Space b p` | Normal | Previous buffer. |
| `Space b d` | Normal | Save if modified, then close the buffer. |
| `D-s` | Normal, Insert, Visual | Leave Insert mode, save, then close the buffer. |
| `Space` | Insert | Insert a space and start a new undo block. |

Saving and closing requires a writable file name; a failed save prevents closing.
Bufferline displays buffers but this configuration adds no bufferline-specific
keyboard shortcuts.

## Finding files and text

| Shortcut | Mode | Action |
| --- | --- | --- |
| `Space f f` | Normal | Find files with fzf-lua. |
| `Space f g` | Normal | Search project contents with live grep. |
| `Space f b` | Normal | Find open buffers. |

Which-key shows available continuations after a mapped prefix such as `Space f`.

### Inside fzf-lua pickers

These apply while a picker is open. Some actions depend on the picker or previewer;
press `F1` to see the available bindings for the current picker.

| Shortcut | Action |
| --- | --- |
| `Up` / `Down`, `Ctrl-p` / `Ctrl-n` | Move through results. |
| `Tab` / `Shift-Tab` | Toggle selection and move down / up when multiselection is enabled. |
| `Enter` | Accept the selection; file pickers open a file or send multiple selections to quickfix. |
| `Esc`, `Ctrl-c`, `Ctrl-z` | Abort the picker. |
| `Alt-Esc` | Hide the picker. |
| `Ctrl-s` / `Ctrl-v` / `Ctrl-t` | Open a file result in a split / vertical split / tab. |
| `Alt-q` / `Alt-Q` | Send file selections to quickfix / location list. |
| `Alt-i` | Toggle ignore rules where supported. |
| `Alt-h` | Toggle hidden files where supported. |
| `Alt-f` | Toggle following symbolic links where supported. |
| `Ctrl-u` | Delete the query back to the beginning of the line. |
| `Ctrl-a` / `Ctrl-e` | Move to the beginning / end of the query. |
| `Ctrl-f` / `Ctrl-b` | Move down / up half a page of results. |
| `Alt-a` | Toggle all selections. |
| `Alt-g` / `Alt-Shift-g` | Go to the first / last result. |
| `F1` | Toggle help. |
| `F2` | Toggle fullscreen. |
| `F3` | Toggle preview wrapping. |
| `F4` | Toggle the preview. |
| `F5` | Rotate the built-in preview clockwise. |
| `F6` | Toggle built-in preview behavior. |
| `F7` | Toggle Treesitter context in the built-in preview. |
| `F8` / `F9` | Decrease / increase built-in preview Treesitter context. |
| `Shift-Left` | Reset the built-in preview position. |
| `Shift-Down` / `Shift-Up` | Scroll the preview down / up a page. |
| `Alt-Shift-Down` / `Alt-Shift-Up` | Scroll the preview down / up a line. |

## Navigation with Flash

| Shortcut | Mode | Action |
| --- | --- | --- |
| `Space j` | Normal, Visual, Operator-pending | Start Flash jump: type search text, then a displayed label to jump. |
| `Space k` | Normal, Visual, Operator-pending | Select a Treesitter node using displayed labels; requires a parser. |
| `f` / `F` + character | Normal, Visual, Operator-pending | Find a character forward / backward, with Flash highlighting across lines. |
| `t` / `T` + character | Normal, Visual, Operator-pending | Move just before / after a character match. |
| `;` / `,` | Normal, Visual, Operator-pending | Repeat the character search in the same / opposite direction. |

While a Flash character search is active, the lowercase motion key (`f` or `t`)
moves to the next match and its uppercase form moves to the previous match.
`Esc` cancels an active Flash jump. Flash integration with `/` and `?` is disabled
by default; those remain ordinary searches.

## Language support

| Shortcut | Mode | Action |
| --- | --- | --- |
| `g d` | Normal | Go to definition using the attached language server. |

Lua support requires `lua-language-server` on PATH. ZMA also supplies language
support for its notes. Neovim supplies additional LSP defaults; see
`:help lsp-defaults` for the installed version's complete list.

## Completion with blink.cmp

These are the enabled `default` preset bindings in Insert mode. Completion and
documentation actions apply when their corresponding UI is available; most keys
fall back to their usual behavior otherwise.

| Shortcut | Action |
| --- | --- |
| `Ctrl-Space` | Show completion; when open, show or hide documentation. |
| `Ctrl-e` | Cancel completion and undo its insertion preview. |
| `Ctrl-y` | Accept the selected completion, selecting the first item if needed. |
| `Up` / `Ctrl-p` | Select the previous completion. |
| `Down` / `Ctrl-n` | Select the next completion. |
| `Ctrl-b` / `Ctrl-f` | Scroll documentation up / down. |
| `Tab` / `Shift-Tab` | Move to the next / previous snippet placeholder. |
| `Ctrl-k` | Show or hide signature help when available. |

### Command-line completion

Blink's default command-line preset applies when editing commands and searches.

| Shortcut | Action |
| --- | --- |
| `Tab` / `Shift-Tab` | Show completion and insert an item, then select next / previous; accept a single match. |
| `Ctrl-Space` | Show completion. |
| `Ctrl-n` / `Ctrl-p` | Select next / previous. |
| `Right` / `Left` | Select next / previous when completion handles the key. |
| `Ctrl-y` | Accept the selected completion. |
| `Ctrl-e` | Cancel completion. |
| `End` | Hide completion. |

## ZMA notes

| Shortcut | Mode / context | Action |
| --- | --- | --- |
| `Space z` | Normal, Visual | Open the ZMA command menu; Visual mode provides the selection to applicable actions. |
| `Space l w` | Normal, Visual | Wrap selected text as a wiki link `[[text]]`, or use clipboard text in Normal mode. |
| `Space l p` | Normal, Visual | Wrap selected text as a person link `@[text]`, or use clipboard text in Normal mode. |
| `Tab` / `Ctrl-n` | Insert, ZMA completion menu | Select the first / next suggestion. |
| `Ctrl-p` | Insert, ZMA completion menu | Select the previous suggestion. |
| `Ctrl-y` | Insert, ZMA completion menu | Accept the suggestion. |
| `Ctrl-x Ctrl-o` | Insert, ZMA note | Invoke omnifunc completion manually. |

Blink is disabled when the buffer uses ZMA's omnifunc. Outside its completion
menu, ZMA's Tab mapping inserts a normal tab (subject to `expandtab`).
The ZMA menu exposes tasks, link actions, formatting, and other note commands.

### ZMA task manager

Open **Tasks** from `Space z` or run `:ZmaTasks`. All bindings below are Normal
mode mappings local to the task panel.

| Shortcut | Action |
| --- | --- |
| `Enter` | Open the task's source note at its line, keeping the panel open. |
| `d` / `i` / `t` | Set status to DONE / DOING / TODO. |
| `u` | Undo the last status or category change in the panel. |
| `c` | Change category; empty or Inbox removes the category. |
| `+` / `-` | Increase / decrease priority. |
| `s` | Snooze for a number of days; 0 clears snoozing. |
| `g` | Filter by category or show all groups. |
| `a` | Toggle active tasks versus all tasks, including done and snoozed tasks. |
| `f` | Search displayed tasks with fzf and open a selection. |
| `r` | Refresh tasks, filters, and sorting from notes. |
| `q` | Close the task panel. |

### ZMA action preview

All bindings below are Normal mode mappings local to a generated action preview.

| Shortcut | Action |
| --- | --- |
| `a` | Apply the result: replace the selection, insert at the cursor, or apply proofreading to the note. |
| `p` | Insert the result below; available for summaries, not proofreading. |
| `y` | Copy the generated result to the system clipboard. |
| `q` | Discard and close the preview. |

## Inspecting shortcuts

- `:map` lists Normal, Visual, Select, and Operator-pending mappings.
- `:imap` lists Insert mappings; `:cmap` lists command-line mappings.
- `:verbose nmap <Space>` shows leader mappings and where they were defined.
- `:help index` lists built-in Vim keys; `:help lsp-defaults` covers LSP defaults.

Configuration sources: `lua/config/keymaps.lua`, `lua/config/lsp.lua`, and
`lua/plugins/`. ZMA's own mappings live in `~/src/zma-nvim/lua/zma/`.
