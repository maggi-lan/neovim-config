-- Set up mason
require("mason").setup({
    ui = {
        border = "rounded",
    },
})

-- Include language servers using mason-lspconfig
require("mason-lspconfig").setup {
    ensure_installed = {
        -- Python
        "pyright",

        -- C / C++
        "clangd",

        -- JavaScript / TypeScript / JSX
        "ts_ls",
        "eslint",

        -- Rust
        "rust_analyzer",

        -- HTML / CSS
        "html",
        "cssls",

        -- Bash
        "bashls",

        -- Lua
        "lua_ls",
        "stylua",

        -- Markdown
        "marksman",
    },
}

-- Some configurations
vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

-- Enable nvim-cmp to communicate with LSPs
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("pyright", { capabilities = capabilities })
vim.lsp.config('clangd', { capabilities = capabilities })
vim.lsp.config('ts_ls', { capabilities = capabilities })
vim.lsp.config('eslint', { capabilities = capabilities })
vim.lsp.config('rust_analyzer', { capabilities = capabilities })
vim.lsp.config('html', { capabilities = capabilities })
vim.lsp.config('cssls', { capabilities = capabilities })
vim.lsp.config('bashls', { capabilities = capabilities })
vim.lsp.config('lua_ls', { capabilities = capabilities })
vim.lsp.config('marksman', { capabilities = capabilities })

-- Connect neovim with the language servers
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('ts_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('bashls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('marksman')

-- Some default keymaps
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded" })
end)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action)
