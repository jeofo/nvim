# Neovim Config for Colemak

A Lua-based Neovim configuration optimized for the Colemak layout. Originally inspired by [The Ultimate NeoVim Config for Colemak Users](https://github.com/theniceboy/nvim), now rewritten end-to-end in Lua with `lazy.nvim` as the plugin manager.

> **Layout note:** The mappings below assume a Colemak keyboard. The home-row navigation is `u` `n` `e` `i` (up / left / down / right), and `k` enters insert mode. Anywhere standard Vim docs say `i`, use `k`; anywhere they say `iw`, use `kw`; etc.

---

## Table of Contents

1. [Editor Behavior](#1-editor-behavior)
2. [Core Editing Keymaps](#2-core-editing-keymaps)
3. [Cursor & Screen Movement](#3-cursor--screen-movement)
4. [Search and Replace](#4-search-and-replace)
5. [Buffers, Windows, Tabs](#5-buffers-windows-tabs)
6. [Terminal](#6-terminal)
7. [LSP & Diagnostics](#7-lsp--diagnostics)
8. [Completion (`nvim-cmp`)](#8-completion-nvim-cmp)
9. [Snippets (`LuaSnip`)](#9-snippets-luasnip)
10. [GitHub Copilot](#10-github-copilot)
11. [File Explorer (`nvim-tree`)](#11-file-explorer-nvim-tree)
12. [Fuzzy Finding (`fff.nvim` + Telescope)](#12-fuzzy-finding-fffnvim--telescope)
13. [Comments, Folding, Spelling](#13-comments-folding-spelling)
14. [Yank Helpers](#14-yank-helpers)
15. [Image Paste & Markdown Preview](#15-image-paste--markdown-preview)
16. [LaTeX (VimTeX)](#16-latex-vimtex)
17. [Custom Modules](#17-custom-modules)
18. [Plugin List](#18-plugin-list)

---

## 1 Editor Behavior

| Setting         | Value                                                    |
| --------------- | -------------------------------------------------------- |
| Leader          | `<Space>`                                                |
| Numbers         | absolute + relative                                      |
| Indent          | 2 spaces (`tabstop`, `shiftwidth`, `softtabstop`)        |
| Folding         | `indent` method, all folds open by default               |
| Splits          | open right and below                                     |
| Search          | `ignorecase` + `smartcase`, live `inccommand=split`      |
| Clipboard       | `unnamedplus` (system clipboard by default)              |
| Persistent undo | `~/.config/nvim/tmp/undo`                                |
| Spellfile       | `~/.config/nvim/spell/en.utf-8.add` (en_us)              |
| Hot reload      | `checktime` on `FocusGained` / `BufEnter` / `CursorHold` |
| Window border   | rounded                                                  |
| Status line     | global (`laststatus = 3`)                                |
| Command line    | hidden (`cmdheight = 0`)                                 |
| Jumplist        | cleared on every Vim start                               |

---

## 2 Core Editing Keymaps

### Mode entry

| Key | Action                              |
| --- | ----------------------------------- |
| `k` | Enter insert mode (Vim's `i`)       |
| `K` | Insert at start of line (Vim's `I`) |
| `;` | Enter command-line (`:`)            |

> **Reminder:** because `i` is now a motion key, every `i`-text-object becomes `k` — e.g. `ckw` instead of `ciw`, `dk(` instead of `di(`.

### Save / quit

| Key      | Action              |
| -------- | ------------------- |
| `S`      | `:w` (save)         |
| `Q`      | `:q` (close window) |
| `Ctrl-q` | `:qa` (quit all)    |

### Undo / Redo

| Key | Action |
| --- | ------ |
| `l` | undo   |
| `j` | redo   |

### Indent

| Key                | Action                      |
| ------------------ | --------------------------- |
| `>`                | indent line                 |
| `<`                | un-indent                   |
| `>` / `<` (visual) | keep selection after indent |

### Delete without yanking

| Key                  | Action                                            |
| -------------------- | ------------------------------------------------- |
| `<Leader>d`          | delete to black-hole register                     |
| `<Leader>p` (visual) | paste over selection without overwriting register |

### Misc

| Key          | Action                               |
| ------------ | ------------------------------------ |
| `` ` ``      | toggle case (`~`)                    |
| `Y`          | yank to end of line (`y$`)           |
| `<Leader>zz` | apply first spell suggestion (`1z=`) |

---

## 3 Cursor & Screen Movement

### Home-row navigation (Colemak)

| Key  | Vim equivalent | Description                 |
| ---- | -------------- | --------------------------- |
| `u`  | `k`            | up one line                 |
| `e`  | `j`            | down one line               |
| `n`  | `h`            | left one char               |
| `i`  | `l`            | right one char              |
| `gu` | `gk`           | up one _visual_ line (wrap) |
| `ge` | `gj`           | down one _visual_ line      |
| `U`  | `5k`           | up 5 lines                  |
| `E`  | `5j`           | down 5 lines                |
| `N`  | `0`            | start of line               |
| `I`  | `$`            | end of line                 |
| `W`  | `5w`           | jump 5 words forward        |
| `B`  | `5b`           | jump 5 words backward       |

### Screen position (rotated to keep `H/M/L` ergonomic)

| Key | Vim equivalent | Description           |
| --- | -------------- | --------------------- |
| `L` | `H`            | jump to top of screen |
| `H` | `M`            | jump to middle        |
| `M` | `L`            | jump to bottom        |

### Viewport scroll

| Key      | Action                       |
| -------- | ---------------------------- |
| `Ctrl-U` | scroll viewport up 5 lines   |
| `Ctrl-E` | scroll viewport down 5 lines |
| `Ctrl-y` | disabled                     |
| `Ctrl-e` | disabled                     |

### Insert-mode line jumps

| Key      | Action                |
| -------- | --------------------- |
| `Ctrl-n` | jump to start of line |
| `Ctrl-i` | jump to end of line   |

### Jumplist

| Key     | Action                                  |
| ------- | --------------------------------------- |
| `<Tab>` | jump forward (skips nvim-tree buffers)  |
| `<BS>`  | jump backward (skips nvim-tree buffers) |

---

## 4 Search and Replace

| Key                  | Action                                   |
| -------------------- | ---------------------------------------- |
| `<Leader>F`          | start search (`/`)                       |
| `=`                  | next match (Vim's `n`)                   |
| `-`                  | previous match (Vim's `N`)               |
| `<Esc>`              | clear search highlight (`:noh`)          |
| `<Leader>h`          | clear search highlight (explicit)        |
| `<Leader>H`          | start substitute on whole file (`:%s//`) |
| `<Leader>H` (visual) | substitute within selection (`:s//`)     |

---

## 5 Buffers, Windows, Tabs

### Buffers

| Key         | Action                                                  |
| ----------- | ------------------------------------------------------- |
| `[[`        | previous buffer                                         |
| `]]`        | next buffer                                             |
| `<Leader>q` | delete current buffer                                   |
| `<Leader>Q` | save all, wipe buffers, reopen last (`:w \| %bd \| e#`) |

### Window navigation

| Key         | Action               |
| ----------- | -------------------- |
| `<Leader>w` | cycle to next window |
| `<Leader>u` | move to window above |
| `<Leader>e` | move to window below |
| `<Leader>n` | move to window left  |
| `<Leader>i` | move to window right |

### Splits (`s` prefix — default `s` is disabled)

| Key  | Action                                 |
| ---- | -------------------------------------- |
| `su` | new horizontal split _above_ current   |
| `se` | new horizontal split _below_ current   |
| `sn` | new vertical split _left_ of current   |
| `si` | new vertical split _right_ of current  |
| `sh` | rearrange existing splits horizontally |
| `sv` | rearrange existing splits vertically   |
| `st` | move current window into a new tab     |

### Window resize (smart-splits.nvim)

| Key       | Action        |
| --------- | ------------- |
| `<Left>`  | shrink width  |
| `<Right>` | grow width    |
| `<Up>`    | grow height   |
| `<Down>`  | shrink height |

### Tabs

| Key   | Action         |
| ----- | -------------- |
| `tu`  | new tab        |
| `tn`  | previous tab   |
| `ti`  | next tab       |
| `tmn` | move tab left  |
| `tmi` | move tab right |

---

## 6 Terminal

| Key         | Action                                                                  |
| ----------- | ----------------------------------------------------------------------- |
| `<Leader>/` | open terminal in horizontal split below (auto-resized to half height)   |
| `<Leader>\` | open terminal in vertical split right (auto-resized to ~30% of columns) |
| `Ctrl-N`    | exit terminal-insert mode (in terminal buffer)                          |
| `Ctrl-O`    | exit terminal-insert mode and run one normal-mode command               |
| `<Esc>`     | exit terminal-insert mode                                               |

Terminals open in insert mode automatically, and `neoterm_autoscroll` is enabled.

---

## 7 LSP & Diagnostics

LSP is wired through **`lsp-zero`** + **`mason.nvim`** + **`mason-lspconfig`**. Servers are installed via `:Mason` and attached automatically.

### Buffer-local mappings (set on LSP attach)

| Key          | Action                                      |
| ------------ | ------------------------------------------- |
| `T`          | hover documentation                         |
| `<Leader>gd` | go to definition                            |
| `<Leader>rn` | rename symbol                               |
| `<Leader>ca` | code action                                 |
| `<Leader>=`  | jump to next diagnostic                     |
| `<Leader>-`  | jump to previous diagnostic                 |
| `q`          | dismiss diagnostic float (when one is open) |

Inline `virtual_text` diagnostics are **off**. Instead, a diagnostic float opens automatically on `CursorHold` (after `updatetime = 100ms`). Sign icons are `✘ ▲ ⚑ »` (error / warn / hint / info).

### Formatting (conform.nvim)

Auto-format on save (1s timeout, no LSP fallback). Configured formatters:

| Filetype                                           | Formatter                 |
| -------------------------------------------------- | ------------------------- |
| `python`                                           | `ruff_format`, `ruff_fix` |
| `go`                                               | `gofmt`                   |
| `javascript` / `ts` / `jsx` / `tsx`                | `biome`                   |
| `json` / `html` / `css` / `scss` / `sass` / `less` | `biome`                   |
| `markdown`                                         | `prettier`                |
| `typst`                                            | `typstyle`                |

---

## 8 Completion (`nvim-cmp`)

Sources, in priority order: `nvim_lsp` → `luasnip` → `cmp_r` → `buffer` → `path`.

| Key         | Action                               |
| ----------- | ------------------------------------ |
| `<Down>`    | next item (only if menu visible)     |
| `<Up>`      | previous item (only if menu visible) |
| `<CR>`      | confirm selection (replaces token)   |
| `<S-CR>`    | newline (bypass completion)          |
| `<C-Space>` | manually trigger completion          |

Menu has bordered windows for both completion and documentation. `completeopt = menu,menuone,noinsert`.

---

## 9 Snippets (`LuaSnip`)

Snippets live in `~/.config/nvim/snippets/`. Currently shipped:

- `all.lua`, `c.lua`, `markdown.lua`, `typescript.lua`
- `typst/general.lua`, `typst/math.lua` (autosnips, matrices, general, colors)

| Key       | Action                                      |
| --------- | ------------------------------------------- |
| `<Tab>`   | expand snippet, or jump to next placeholder |
| `<S-Tab>` | jump to previous placeholder                |

> `<Tab>` is shared with Copilot — see below.

### Snippet examples (TypeScript)

| Trigger  | Expands to                                      |
| -------- | ----------------------------------------------- |
| `fetchj` | `const data = await (await fetch(url)).json();` |
| `csl`    | `console.log(object);`                          |
| `fn`     | arrow-function template                         |
| `imp`    | `import { something } from 'module';`           |

---

## 10 GitHub Copilot

Powered by `copilot.lua`. Auto-trigger is on; suggestions are inline ghost text.

| Key      | Action              |
| -------- | ------------------- |
| `<Tab>`  | accept suggestion   |
| `Alt-]`  | next suggestion     |
| `Alt-[`  | previous suggestion |
| `Ctrl-]` | dismiss suggestion  |

Disabled for: `yaml`, `markdown`, `help`, `gitcommit`, `gitrebase`, and unknown filetypes.

---

## 11 File Explorer (`nvim-tree`)

Tree appears on the **right side**, 34 columns wide. Hijacks netrw. Git status, diagnostics, and dotfiles all visible by default.

| Key         | Action      |
| ----------- | ----------- |
| `<Leader>t` | toggle tree |

### Inside the tree

| Key | Action                            |
| --- | --------------------------------- |
| `e` | down                              |
| `u` | up                                |
| `E` | down 5                            |
| `U` | up 5                              |
| `R` | refresh                           |
| `[` | move root up one directory        |
| `]` | set node under cursor as new root |
| `O` | reveal in macOS Finder            |

(Other defaults from nvim-tree — `<CR>` to open, `a` to add, `d` to delete, `r` to rename, etc. — remain active.)

---

## 12 Fuzzy Finding (`fff.nvim` + Telescope)

### fff.nvim (fast file finder, native binary)

| Key            | Action                          |
| -------------- | ------------------------------- |
| `<Leader><CR>` | find files                      |
| `<Leader>fF`   | live grep (fuzzy + plain modes) |

### Telescope

| Key                | Action                    |
| ------------------ | ------------------------- |
| `<Leader><Leader>` | command palette           |
| `<Leader>ff`       | fuzzy find within buffer  |
| `<Leader>fb`       | switch buffers            |
| `<Leader>fd`       | list diagnostics          |
| `<Leader>fr`       | LSP references            |
| `<Leader>fz`       | spell suggestions         |
| `<Leader>fg`       | git log of current buffer |

`find_files` uses `rg --hidden`, ignoring `.git`, `node_modules`, `target`, `build`, `dist`.

---

## 13 Comments, Folding, Spelling

### Comments (NerdCommenter)

| Key         | Action               |
| ----------- | -------------------- |
| `<Leader>a` | toggle comment       |
| `<Leader>A` | "sexy" block comment |

### Folding

| Key         | Action             |
| ----------- | ------------------ |
| `<Leader>o` | toggle fold (`za`) |
| `<Leader>O` | close all (`zM`)   |
| `<Leader>U` | open all (`zR`)    |

### Spelling

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<Leader>sc` | toggle spell check           |
| `<Leader>sr` | toggle relative line numbers |
| `<Leader>zz` | apply first spell suggestion |

---

## 14 Yank Helpers

Custom helpers in `lua/custom/yank.lua`. All write to the system clipboard (`+` register).

| Key                  | Action                                                            |
| -------------------- | ----------------------------------------------------------------- |
| `<Leader>ya`         | yank current buffer's **absolute** path                           |
| `<Leader>yr`         | yank current buffer's **cwd-relative** path                       |
| `<Leader>y` (visual) | yank `relative/path:start-end` (line range), with brief highlight |

---

## 15 Image Paste & Markdown Preview

### img-clip.nvim

| Key         | Action                            |
| ----------- | --------------------------------- |
| `<Leader>p` | paste image from system clipboard |

### Markdown preview

Provided by `iamcco/markdown-preview.nvim`. Run `:MarkdownPreview` / `:MarkdownPreviewStop`. Build dependency: `cd app && yarn install` (handled automatically by lazy.nvim).

---

## 16 LaTeX (VimTeX)

Loaded only on `*.tex` files. Viewer is **Skim** (`vimtex_view_method = 'skim'`).

| Key         | Action                   |
| ----------- | ------------------------ |
| `<Leader>L` | toggle table of contents |
| `<Leader>v` | view PDF in Skim         |

The Neovim server name is written to `/tmp/vimtexserver.txt` on every `tex` filetype event so Skim can sync back.

---

## 17 Custom Modules

In `lua/custom/`:

- **`yank.lua`** — buffer-path yank helpers (see §14).
- **`directory-watcher.lua`** — exposes `registerOnChangeHandler` for filesystem notifications on the working directory.
- **`hotreload.lua`** — listens to `directory-watcher` and runs `:checktime` on the changed buffer when it is visible, unmodified, and a real file (not `diffview://` etc.). Also wires up periodic `checktime` on `FocusGained`, `BufEnter`, `WinEnter`, `CursorHold`, `CursorHoldI`.

These together give you instant external-edit pickup without the usual "file changed" prompts.

---

## 18 Plugin List

Plugins managed by [`lazy.nvim`](https://github.com/folke/lazy.nvim). Pinned versions live in `lazy-lock.json`.

| Plugin                                                                         | Purpose                                     |
| ------------------------------------------------------------------------------ | ------------------------------------------- |
| `catppuccin/nvim`                                                              | Active colorscheme (`catppuccin-mocha`)     |
| `vague-theme/vague.nvim`                                                       | Alternative colorscheme                     |
| `nvim-tree/nvim-tree.lua`                                                      | File explorer (right side)                  |
| `elihunter173/dirbuf.nvim`                                                     | Editable directory buffers                  |
| `itchyny/lightline.vim`                                                        | Status line (wombat colorscheme)            |
| `nvim-treesitter/nvim-treesitter`                                              | Syntax (main branch — Neovim 0.11+ rewrite) |
| `HiPhish/rainbow-delimiters.nvim`                                              | Rainbow brackets                            |
| `sindrets/diffview.nvim`                                                       | Git diff / file history viewer              |
| `scrooloose/nerdcommenter`                                                     | Comment toggling                            |
| `echasnovski/mini.icons`                                                       | Icon set (mocks `nvim-web-devicons`)        |
| `lervag/vimtex`                                                                | LaTeX integration with Skim                 |
| `iamcco/markdown-preview.nvim`                                                 | Live Markdown preview                       |
| `ap/vim-css-color`                                                             | Inline CSS color preview                    |
| `dmtrKovalenko/fff.nvim`                                                       | Native-binary file finder + live grep       |
| `nvim-telescope/telescope.nvim`                                                | Fuzzy finder for everything else            |
| `VonHeikemen/lsp-zero.nvim`                                                    | LSP scaffolding                             |
| `williamboman/mason.nvim` + `mason-lspconfig.nvim`                             | LSP server installer                        |
| `neovim/nvim-lspconfig`                                                        | LSP client configs                          |
| `L3MON4D3/LuaSnip`                                                             | Snippet engine                              |
| `HakonHarnes/img-clip.nvim`                                                    | Paste images from clipboard                 |
| `hrsh7th/nvim-cmp` (+ `cmp-nvim-lsp`, `cmp-buffer`, `cmp-path`, `cmp_luasnip`) | Completion                                  |
| `stevearc/conform.nvim`                                                        | Format-on-save                              |
| `mrjones2014/smart-splits.nvim`                                                | Arrow-key window resize                     |
| `zbirenbaum/copilot.lua`                                                       | GitHub Copilot                              |

### Tree-sitter parsers installed eagerly

`c`, `lua`, `python`, `javascript`, `typescript`, `tsx`, `markdown`, `markdown_inline`, `vim`, `vimdoc`, `query`, `bash`, `json`, `yaml`, `html`, `css`.

---

## Plugin Setup Notes

### Markdown preview

```sh
# Plugin auto-runs `cd app && yarn install` on install.
# Make sure Node + yarn are available on PATH.
```

### LaTeX

Install [Skim](https://skim-app.sourceforge.io/) and enable its **PDF-Sync** support so `<Leader>v` can jump to the cursor location.

### Mason

On first run, install language servers with `:Mason` (e.g. `lua_ls`, `pyright`, `ts_ls`, `gopls`, `tinymist`).

### Copilot

Authenticate once via `:Copilot auth`.
