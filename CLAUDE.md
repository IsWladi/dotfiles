# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repo for a NixOS + Hyprland desktop setup. Only the following directories are tracked (see `.gitignore`):

- `nvim/` — Neovim configuration (has its own `CLAUDE.md` with full detail)
- `hypr/` — Hyprland compositor config + wallpapers + scripts
- `kitty/` — Kitty terminal config
- `swappy/` — Screenshot annotation tool config
- `Qmk-Lily58-Dvorak/` — QMK firmware config for a Lily58 Pro split keyboard

## Neovim (`nvim/`)

Full guidance lives in `nvim/CLAUDE.md`. Key points:

- Plugin manager: **lazy.nvim** (auto-installs on first `nvim` launch)
- Navigation remapped from `hjkl` → **`rtns`** — `n` is NOT next-search, `s` is NOT substitute
- Leader key: `,` (comma)
- LSP split between Mason-managed and Nix-managed servers (see `nvim/CLAUDE.md`)
- Completion: **blink.cmp** (not nvim-cmp)
- Format-on-save via **conform.nvim**

## Hyprland (`hypr/`)

- `hyprland.conf` — main compositor config: monitors, keybindings, autostart, window rules
- `hyprpaper.conf` — wallpaper assignment (currently `alone.jpg`, `fit_mode = cover`)
- `scripts/lid_switch.sh` — run on lid open/close events
- Wallpapers stored in `hypr/wallpalpers/` (note the typo in the directory name — preserve it)
- To change the wallpaper, update `hyprpaper.conf` and reload hyprpaper

**Monitor layout:** workspaces 1–4 on `HDMI-A-1`, workspace 5 on `eDP-1` (laptop screen)

**Key Hyprland binds:** `SUPER+RETURN` = kitty, `SUPER+D` = wofi launcher, `Print` = screenshot via `grim | swappy`, `SHIFT+Print` = screenshot to clipboard + file

## Kitty (`kitty/`)

Single `kitty.conf` file. Background opacity is `0.6` (dynamic). Font size `11.5`. Tab title shows the current working directory (`{cwd}`).

## QMK Lily58 (`Qmk-Lily58-Dvorak/`)

QMK firmware for a Lily58 Pro split keyboard, Dvorak layout. Requires Docker and QMK Firmware 0.23.5. The compiled `.hex` is committed.

```sh
# Copy config files into qmk_firmware and compile
./update_lily58_kb.sh

# Flash to keyboard (run once per side)
./keyboard_flash.sh
```

Both scripts assume `~/qmk_firmware/` exists on the system.
