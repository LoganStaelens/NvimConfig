return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup({
				layouts = {
					-- Left panel: Scopes, Breakpoints, Stacks, Watches
					{
						elements = {
							{ id = "scopes", size = 0.4 },
							{ id = "stacks", size = 0.4 },
                            { id = "breakpoints", size = 0.2 },
						},
						size = 40, -- width in columns
						position = "left",
					},
					-- Bottom panel: REPL and Console output
					{
						elements = {
							{ id = "repl", size = 1.0 },
						},
						size = 10, -- height in lines
						position = "bottom",
					},
				},
			})
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"mason-org/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = {
				"debugpy",
				"cpptools",
			},
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")

			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/openDebugAD7",
			}

			dap.configurations.cpp = {
				{
					name = "Remote GDB Server",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					MIMode = "gdb",
					miDebuggerServerAddress = "localhost:4711",
					miDebuggerPath = "/usr/bin/gdb",
					stopAtEntry = false,
					externalConsole = false,
				},
			}

			dap.adapters.python = {
				-- type = "executable",
				-- command = "python",
				-- args = { "-m", "debugpy" },
				type = "server",
				host = "127.0.0.1",
				port = 5678,
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "attach",
					name = "Remote Odoo Debugger",
					connect = {
						host = "127.0.0.1",
						port = 5678,
					},
				},
			}
		end,
	},
}
