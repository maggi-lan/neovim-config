local dap, dapui = require("dap"), require("dapui")

-- Toggle breakpoint
vim.keymap.set("n", "<Leader>db", function()
	dap.toggle_breakpoint()
end)

-- Start DAP server
vim.keymap.set("n", "<Leader>dc", function()
	dap.continue()
end)

-- Set up dependencies
require("dapui").setup()
require("dap-python").setup("~/.venvs/debugpy/bin/python")

-- DAP-UI settings
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

------------------
-- GDB settings --
------------------

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

-- Binary picker for gdb
local pick_executable = function()
	return coroutine.create(function(coro)
		local has_telescope, telescope = pcall(require, "telescope.builtin")
		if not has_telescope then
			-- fallback to normal input
			local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			coroutine.resume(coro, path)
			return
		end

		telescope.find_files({
			prompt_title = "Select executable",
			cwd = vim.fn.getcwd(),
			find_command = { "fd", "--type", "x" }, -- only show executable files
			previewer = false, -- disable grep preview
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local entry = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)
					coroutine.resume(coro, entry.path)
				end)
				return true
			end,
		})
	end)
end

-- Configure for C
dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = pick_executable,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
}

-- Configure for C++ and Rust
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
