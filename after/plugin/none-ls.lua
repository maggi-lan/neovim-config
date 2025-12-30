local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Lua
		null_ls.builtins.formatting.stylua,

		-- Python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,

		-- C / C++
		null_ls.builtins.formatting.clang_format,

		-- JavaScript / TypeScript / JSON / HTML / CSS / Markdown
		null_ls.builtins.formatting.prettier,

		-- Bash
		null_ls.builtins.formatting.shfmt,

		-- Markdown (extra linting)
		null_ls.builtins.diagnostics.markdownlint,

		-- Spellcheck (completion only, safe everywhere)
		null_ls.builtins.completion.spell,

		-- ESLint diagnostics (from none-ls-extras.nvim)
		require("none-ls.diagnostics.eslint"),
	},

	on_init = function(client)
		client.config.cmd_env = {
			PATH = vim.env.PATH,
		}
	end,
})

-- Format current buffer
vim.keymap.set("n", "gf", function()
	vim.lsp.buf.format({ async = true })
end)
