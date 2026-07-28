# AGENTS.md

## What this is

Personal Neovim config (macOS primary, WSL supported). Uses Neovim's native `vim.pack` package manager — **not** lazy.nvim.

## Structure

- `init.lua` — entry point; optional `PROF=1` profiling via snacks.profiler, then loads `lua/core`
- `lua/core/` — options, events, commands, filetypes, settings, globals, icon utils
- `lua/keymap/` — keybindings; custom `bind.lua` DSL (`map_cmd`, `map_cr`, `map_cu`, `map_callback`)
- `plugin/` — per-plugin config files; auto-loaded by Neovim. Each file uses `vim.pack.add()` with lazy-loading
- `snippets/kubernetes.json` — custom K8s snippets for blink.cmp

## Plugin loading

Plugins are loaded lazily inside `plugin/*.lua` files via:
- `vim.api.nvim_create_autocmd('BufRead', { once = true, ... })` — load on first file open
- `vim.api.nvim_create_autocmd('InsertEnter', { once = true, ... })` — load on first insert
- `vim.api.nvim_create_autocmd('FileType', { pattern = '...', once = true })` — load per filetype
- `vim.schedule(function() ... end)` — deferred load after startup

When adding or modifying plugin loading, match the pattern used by sibling files in `plugin/`.

## Commands

- **Update plugins**: `<leader>pu` → `vim.pack.update`
- **List plugins offline**: `<leader>pp` → `vim.pack.update(nil, { offline = true })`
- **Restore lockfile**: `<leader>pr` → `vim.pack.update(nil, { target = 'lockfile' })`

## Format / lint

Formatter is Conform.nvim, loaded on first `BufWritePre`. Lua is formatted with **StyLua** (config: `.stylua.toml`). YAML/Markdown use prettierd. Format-on-save is on by default; toggle with `:FormatToggle`.

There is no linter configured. StyLua is the only enforced formatter.

## LSP

Mason auto-installs servers listed in `settings.lsp_deps`. Current list: bashls, clangd, html, jsonls, lua_ls, pylsp, gopls. Java uses nvim-java + jdtls (loaded on `FileType java`). LSP config is in `plugin/lsp.lua`.

## Keyboard layout

Uses **Colemak-DH**. Home-row navigation via Alt modifiers: `<A-m>` left, `<A-n>` down, `<A-e>` up, `<A-i>` right. Also uses a Chipper keyboard with `<PageUp>`/`<PageDown>` mapped to half-page scroll.

## Keybindings to know

| Key | Action |
|-----|--------|
| `<leader>e` | Snacks explorer |
| `-` | Oil floating file explorer |
| `<C-\>` | ToggleTerm |
| `<leader>o` | Toggle OpenCode terminal (vertical split, port 99) |
| `<C-x>` | OpenCode select menu |
| `<leader>gg` | LazyGit |
| `<leader>a` | Harpoon add file |
| `<C-j>` | Harpoon quick menu |
| `<C-n>` / `<C-e>` | Harpoon select 1st / 2nd |
| `,` | Leap jump |
| `<leader>,` | Leap across windows |
| `<leader>ff` | Snacks files picker |
| `<leader>fb` | Snacks buffers picker |
| `<leader>sw` | Snacks workspace grep |
| `<leader>gp` / `gs` / `gd` | Git preview / stage / reset hunk |
| `<leader>du` | Toggle DAP UI |
| `<Leader>;` | Dropbar pick symbols |
| `<leader>pu` | Update plugins |

## Style conventions

- **Lua**: 2-space indent, Unix line endings, single quotes preferred, no call parentheses unless input (StyLua `.stylua.toml`)
- **No comments** in new code unless explicitly requested
- Leader key is `<Space>`

## Profiling

Start with `PROF=1 nvim` to enable snacks.profiler.

## Neovide

GUI font: Iosevka Term Extended size 18. Config in `settings.neovide_config`.

## Gotchas

- `lazy-lock.json` is gitignored; `nvim-pack-lock.json` is the committed lockfile
- `plugin/packer_compiled.lua` is gitignored (legacy)
- `updatetime` must stay ≤ 500 or plugins break (set to 200)
- netrw is disabled; Oil and Snacks explorer are the file explorers
- Python provider auto-configures from `$CONDA_PREFIX` if set
- `require('vim._core.ui2').enable()` in `options.lua` — this enables Neovim's native UI2
- Java support requires jdtls caches; run `:CleanJdtls` to clear them
