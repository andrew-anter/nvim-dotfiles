# Neovim Configuration

A personal Neovim configuration built on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), using the built-in `vim.pack` plugin manager.

## Features

- **Plugin management** via `vim.pack` (built into Neovim)
- **LSP** with Mason auto-install for Go, Python, TypeScript, Lua, HTML, Django, and more
- **Treesitter** for syntax highlighting, indentation, and code navigation
- **Telescope** fuzzy finder with fzf-native, ui-select, and multi-grep
- **Blink.cmp** autocomplete with LuaSnip snippets
- **Conform** for on-save formatting (ruff, goimports, gofumpt, stylua, djlint)
- **Gitsigns** for git gutter signs and hunk operations
- **Neogit** + Diffview for a Magit-style git interface (`<leader>gg`)
- **Oil** as the file explorer (`<leader>e`)
- **Neotest** for running/debugging tests (Python via pytest, Go)
- **nvim-dap** + DAP UI for debugging (Python via debugpy, Go via delve)
- **OpenCode** integration for AI-assisted editing (`<leader>oa`, `go` operator)
- **Render-markdown** for rendered markdown previews in-buffer
- **Persistence** for session save/restore (`<leader>ld`, `<leader>ls`, `<leader>ll`)
- **Tokyonight Night** colorscheme (transparent background)

## Structure

```
init.lua              -- Core config (options, keymaps, plugins)
lua/
  config/             -- Plugin-specific config (multigrep)
  core/keymaps.lua    -- Additional keymaps (DAP, NeoTest, sessions, windows)
  custom/plugins/     -- Personal plugin configs (auto-loaded)
  kickstart/plugins/  -- Kickstart example plugins (indent-line, autopairs)
snippets/             -- Custom LuaSnip snippets
```

## Key Keymaps

| Key | Action |
|-----|--------|
| `<leader>e` | Open Oil file explorer |
| `<leader>gg` | Open Neogit |
| `<leader>f` | Format buffer |
| `<leader>sh` | Search help |
| `<leader>sf` | Search files |
| `<leader>sg` | Live grep |
| `<leader>/` | Fuzzy search current buffer |
| `<leader><leader>` | Find buffers |
| `<leader>d` | Toggle diagnostics |
| `<leader>Tn` | Run nearest test |
| `<leader>Tf` | Run file tests |
| `<leader>Ts` | Toggle test summary |
| `<F5>` | DAP continue |
| `<leader>b` | Toggle breakpoint |
| `<leader>du` | Toggle DAP UI |
| `<leader>oa` | Ask OpenCode |
| `go` | OpenCode operator |
| `<leader>ld` | Load session for directory |
| `<C-h/j/k/l>` | Navigate splits |

## Installation

1. Clone to `~/.config/nvim`:
   ```sh
   git clone <this-repo> ~/.config/nvim
   ```
2. Run `nvim` — plugins are installed automatically via `vim.pack`.
3. Run `:Mason` to install LSP servers and tools.

## Requirements

- Neovim >= stable (latest release or nightly)
- `git`, `make`, `unzip`, `gcc`
- [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd)
- [Nerd Font](https://www.nerdfonts.com/) (configured)
- Language runtimes as needed: `go`, `npm`, `python`, etc.
