return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapuiconfig = function()
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

			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "[D]ebug step over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "[D]ebug step in" })
			vim.keymap.set("n", "<S-F11>", dap.step_out, { desc = "[D]ebug step out" })
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "[D]ebug continue" })
			vim.keymap.set("n", "<F4>", dap.terminate, { desc = "[D]ebug end" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebug toggle [B]reakpoint" })
			vim.keymap.set("n", "<leader>dc", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "[D]ebug toggle [C]onditional breakpoint" })

			dap.adapters.codelldb = {
				type = "executable",
				command = "codelldb",
				detached = false,
			}
		end,
	},
}
