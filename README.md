# Neovim Configuration

I'm writing this down so I don't forget all the keymaps, plugins, options, and random tweaks in my Neovim setup.

## Keymaps

#### Leader Key: `Space`

### General

| Keymap      | Action                                     |
| ----------- | ------------------------------------------ |
| `<C-n>`     | Toggle nvim-tree                           |
| `<leader>u` | Toggle undo-tree                           |
| `<C-p>`     | Toggle markdown preview (opens in browser) |

### Fuzzy Find (Telescope)

| Keymap            | Action           |
| ----------------- | ---------------- |
| `<leader>pf`      | Find ALL files   |
| `<leader>ps`      | Grep search      |
| `<leader>pg`      | Find git files   |
| `<C-k>` / `<C-j>` | Navigate results |

### Harpoon (The Primeagen plugin)

| Keymap                    | Action                             |
| ------------------------- | ---------------------------------- |
| `<leader>a`               | Mark/add current file to Harpoon   |
| `<C-f>`                   | Toggle Harpoon menu                |
| `<leader>1` - `<leader>4` | Instantly jump to marked files 1-4 |

### Editing & Text Manipulation

| Keymap                | Mode   | Action                                  |
| --------------------- | ------ | --------------------------------------- |
| `J` / `K`             | Visual | Move selected lines up/down             |
| `<leader>p`           | Visual | Paste without losing what's in register |
| `<C-c>`               | Visual | Copy to system clipboard                |
| `gcc`                 | Normal | Toggle line comment                     |
| `gc`                  | Visual | Toggle comment in selected region       |
| `gbc`                 | Normal | Toggle block comment                    |
| `gcO` / `gco` / `gcA` | Normal | Add comment above/below/end of line     |

### LSP Operations

| Keymap      | Action           |
| ----------- | ---------------- |
| `K`         | Hover docs       |
| `gd`        | Go to definition |
| `<space>ca` | Code actions     |
| `gf`        | Format buffer    |

### Auto Completion (Defaults)

- `<C-n>` / `<C-p>` - Navigate suggestions
- `<C-Space>` - Manually trigger completion
- `<CR>` (Enter) - Accept suggestion
- `<C-e>` - Close completion menu
- `<C-b>` / `<C-f>` - Scroll documentation up/down

### Few More Keymaps

- `<C-d>` / `<C-u>` - Scroll half page down/up while cursor stays in the middle of the screen
- `n` / `N` - Next/previous search while cursor stays in the middle again
- `Q` - Disabled because nobody uses Ex mode

## Plugins Installed

### Core

- **packer.nvim** - Plugin manager (deprecated but still works)
- **telescope.nvim** - Fuzzy finder
- **nvim-tree.lua** - File explorer
- **harpoon** - Quick file navigation
- **undotree** - Visual undo history

### Appearance

- **gruvbox.nvim** - Color scheme (with transparency enabled)
- **lualine.nvim** - Status line at the bottom
- **alpha-nvim** - Greeter/dashboard on startup

### LSP & Completion

- **mason.nvim** - Manages LSP installations
- **nvim-lspconfig** - LSP configurations
- **mason-lspconfig.nvim** - Bridges Mason and lspconfig
- **nvim-cmp** - Completion engine
- **cmp-nvim-lsp** - LSP completions for nvim-cmp
- **LuaSnip** - Snippet engine
- **friendly-snippets** - Pre-made snippets for common languages

### Formatting & Linting (none-ls)

- **none-ls.nvim** - Formatting and diagnostics
- **none-ls-extras.nvim** - Extra sources (ESLint)

### Editor Enhancements

- **nvim-treesitter** - Better syntax highlighting
- **Comment.nvim** - Smart commenting
- **nvim-autopairs** - Auto-close brackets/quotes
- **diffview.nvim** - Git diff viewer
- **markdown-preview.nvim** - Live markdown preview
- **telescope-ui-select.nvim** - Nicer UI for code actions

## Language Support (LSP)

All managed through Mason. Auto-installed on first run:

| Language              | LSP Server    | Formatter              |
| --------------------- | ------------- | ---------------------- |
| Python                | pyright       | black, isort           |
| C/C++                 | clangd        | clang-format           |
| JavaScript/TypeScript | ts_ls, eslint | prettier               |
| Rust                  | rust_analyzer | (built-in)             |
| HTML/CSS              | html, cssls   | prettier               |
| Bash                  | bashls        | shfmt                  |
| Lua                   | lua_ls        | stylua                 |
| Markdown              | marksman      | prettier, markdownlint |

## General Settings (lua/maggi/set.lua)

- **Line numbers**: Relative numbering enabled
- **Indentation**: 4 spaces (expandtab on)
- **No line wrapping**: `wrap = false`
- **Clipboard**: Isolated from system (use `<C-c>` to copy out)
- **Undo history**: Persistent across sessions in `~/.vim/undodir`
- **Search**: No highlight, incremental, smart case-sensitive
- **Scroll offset**: 4 lines (cursor never at screen edge)
- **No swap files**: They're annoying
- **No sign column**: For a cleaner look

## Visual Tweaks

- **Transparency**: Enabled for Normal, NormalFloat, and Pmenu
- **Borders**: Rounded borders on completion, docs, and Mason
- **Colorscheme**: Gruvbox dark mode
- **Statusline**: Hidden Vim mode display (lualine shows it)
