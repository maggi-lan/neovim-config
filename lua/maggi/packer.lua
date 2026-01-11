-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Gruvbox theme
    use { "ellisonleao/gruvbox.nvim" }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Harpoon: file switcher
    use 'ThePrimeagen/harpoon'

    -- Undo tree visualizer
    use 'mbbill/undotree'

    -- File manager
    use 'nvim-tree/nvim-tree.lua'

    -- Status line
    use 'nvim-lualine/lualine.nvim'

    -- Mason: language server manager
    use 'mason-org/mason.nvim'

    -- lspconfig: connects neovim to the language server
    use 'neovim/nvim-lspconfig'

    -- Bridges mason and lspconfig
    use 'mason-org/mason-lspconfig.nvim'

    -- Telescope UI for LSP code actions
    use 'nvim-telescope/telescope-ui-select.nvim'

    -- Linter/Formatter
    use 'nvimtools/none-ls.nvim'
    use 'nvimtools/none-ls-extras.nvim'

    -- Commenter
    use 'numToStr/Comment.nvim'

    -- Autocomplete engine
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    -- Snippet engine
    use {
        'L3MON4D3/LuaSnip',
        requires = {
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    }

    -- Autopair completion
    use {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        requires = { "hrsh7th/nvim-cmp" },
        config = function()
            require("nvim-autopairs").setup({})

            local cmp = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }

    -- Git diff viewer
    use "sindrets/diffview.nvim"

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = {
            "markdown" } end, ft = { "markdown" }, })

    -- Greeter
    use {
        'goolord/alpha-nvim',
        requires = { { 'nvim-tree/nvim-web-devicons' } },
    }
end)
