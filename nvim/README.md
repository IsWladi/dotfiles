# Neovim in NixOS

<a href="https://dotfyle.com/IsWladi/neovim"><img src="https://dotfyle.com/IsWladi/neovim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/IsWladi/neovim"><img src="https://dotfyle.com/IsWladi/neovim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/IsWladi/neovim"><img src="https://dotfyle.com/IsWladi/neovim/badges/plugin-manager?style=flat" /></a>

## Requirements

- Neovim 0.12+
- NixOS (some LSP servers are managed via Nix, not Mason)
- `git`, `curl`, `tar` (for lazy.nvim and parser downloads)

## Install Instructions

> Always review the code before installing a configuration.

**On NixOS**, install Neovim via nixpkgs and clone the config:

```sh
git clone git@github.com:IsWladi/Neovim ~/.config/nvim
nvim
```

Plugins install automatically on first launch via **lazy.nvim**. Treesitter parsers install on first launch via `:TSInstall`.

**On other systems**, install Neovim 0.12+ via your package manager or appimage, then clone as above.

## Key Remaps

Navigation is remapped from `hjkl` to **`rtns`**:

| Key | Action |
|-----|--------|
| `r` | Left |
| `t` | Down |
| `n` | Up |
| `s` | Right |
| `m` / `M` | Next / prev search match (replaces `n` / `N`) |

Leader key: `,` (comma)

## Plugin Highlights

| Plugin | Purpose |
|--------|---------|
| **lazy.nvim** | Plugin manager |
| **nvim-treesitter** (main) | Syntax parsing, Neovim 0.12 compatible |
| **blink.cmp** | Completion |
| **snacks.nvim** | Picker (files, grep, LSP symbols) |
| **harpoon2** | File bookmarks (slots: `<Space>r/t/n/s`) |
| **oil.nvim** | File manager as buffer (`-`) |
| **conform.nvim** | Format on save |
| **neogit** + **diffview** | Git UI |
| **nvim-dap** | Debugger (Python, Java) |
| **avante.nvim** | AI assistant |
| **dadbod** | Database UI |

## LSP Setup

LSP servers are split into two tracks:

- **Mason-managed** (auto-installed): `ts_ls`, `tailwindcss`, `jsonls`, `dockerls`, `yamlls`, `html`, `jdtls`
- **Nix-managed** (must be on PATH): `lua_ls`, `nil_ls`, `pyright`, `rust_analyzer`, `bashls`, `gdscript`

## Chrome Extension — Vimium Keymaps

```
map t scrollDown
map n scrollUp
map f LinkHints.activateModeToOpenInNewTab
map F LinkHints.activateMode
map s nextTab
map S previousTab
```

## Java Spring Boot Debugging

```sh
mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"
```

1. Open the main class to load LSP.
2. Open the Controller class and set breakpoints.
3. Start DAP from the main class (`<F1>` to toggle DAP UI).
4. Call the endpoint with the browser or Postman.
