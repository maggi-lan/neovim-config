require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",

    -- Automatically install parsers
	auto_install = true,
})

require("nvim-treesitter").install({ "lua", "rust", "javascript", "typescript", "c", "cpp", "python" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "lua", "rust", "javascript", "typescript", "c", "cpp", "python" },
	-- syntax highlighting, provided by Neovim
	callback = function()
		-- syntax highlighting, provided by Neovim
		vim.treesitter.start()
	end,
})
