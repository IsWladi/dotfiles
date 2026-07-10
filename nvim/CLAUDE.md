# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration targeting Neovim 0.11+, running on NixOS. Plugins are managed by **lazy.nvim**, which auto-installs on first `nvim` launch.

## Structure

- `init.lua` — entry point: loads `settings`, `keymaps`, then lazy.nvim with `lua/plugins/`
- `lua/settings.lua` — vim options and autocmds (wrap, whitespace cleanup, cursor restore)
- `lua/keymaps.lua` — global keymaps
- `lua/plugins/` — one file per plugin or plugin group, each returning a lazy.nvim spec table
- `lua/wladi/dap/` — DAP adapter configuration
- `lua/utils.lua` — utility functions (currently: helpers to toggle rtns visual mode mappings)
- `lua/wrap.lua` — filetype-based wrap logic applied via autocmd
- `after/ftplugin/` — filetype-specific overrides (java, lua, python, html)

## Key Conventions

### Custom hjkl Remapping (RTNS)
Navigation keys are remapped from hjkl to **rtns** in normal, visual, and operator-pending modes:
- `r` = Left, `t` = Down, `n` = Up, `s` = Right

This affects many standard Vim motions. Be aware when writing keymaps:
- `n` is NOT "next search match" — use `m` / `M` for next/prev match
- `s` is NOT "substitute" — it moves right

### Leader Key
Leader is `,` (comma).

### LSP Setup (Two-Track)
- **Mason-managed** (auto-installed): `ts_ls`, `tailwindcss`, `jsonls`, `dockerls`, `yamlls`, `html`, `jdtls`
- **Nix-managed** (binaries on PATH, enabled manually): `lua_ls`, `nil_ls`, `pyright`, `rust_analyzer`, `bashls`, `gdscript`

When adding a new LSP server, decide which track it belongs to and configure accordingly in `lua/plugins/lsp.lua`.

### Completion
Uses **blink.cmp** (`lua/plugins/cmp.lua`), not nvim-cmp. SQL/MySQL filetypes use the dadbod source. Always call `require("blink.cmp").get_lsp_capabilities()` when configuring LSP capabilities.

### Formatting
**conform.nvim** (`lua/plugins/conform.lua`) runs format-on-save. Formatters per filetype: stylua (lua), autopep8 (python), prettier (js/ts/css/json/md/yaml/xml).

## Important Keymaps

| Key | Action |
|-----|--------|
| `,` | Leader |
| `<CR>f` | Find files (snacks picker) |
| `<CR>g` | Grep (snacks picker) |
| `<CR>s` | LSP symbols |
| `<CR><CR>` | LSP diagnostics |
| `gd` / `gr` / `gi` / `gt` | LSP go-to via snacks picker |
| `<Space>ha` | Harpoon add file |
| `<Space>hm` | Harpoon menu |
| `<Space>r/t/n/s` | Harpoon slots 1–4 |
| `-` | Oil file explorer (float) |
| `,gg` | Neogit |
| `,gd` / `,gD` | DiffviewOpen / Close |
| `K` | LSP hover |
| `<CR>r` | LSP rename |
| `<CR>ca` | LSP code action |
| `<CR>e` / `<CR>E` | Next/prev diagnostic |
| `<F1>` | Toggle DAP UI |
| `m` / `M` | Next/prev search match (replaces `n`/`N`) |

## Plugin Highlights

- **snacks.nvim** — picker (replaces telescope), image preview, indent guides, dim mode (`:Dim` to toggle)
- **harpoon2** — file bookmarks, slots mapped to `<Space>r/t/n/s` (mirrors rtns nav)
- **nvim-dap** — Python (debugpy at `~/.virtualenvs/debugpy/bin/python`), Java (attach port 5005/8000)
- **neogit** + **diffview** — git UI
- **oil.nvim** — file manager as buffer, opens floating
- **dadbod** — database UI with blink.cmp SQL completion

## Java Spring Boot Debugging

```sh
mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"
```
Then open the main class to load LSP, set breakpoints in Controller, and start DAP from the main class.
