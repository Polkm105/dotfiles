return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
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

			vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "[D]ebug step over" })
			vim.keymap.set("n", "<leader>dl", dap.step_into, { desc = "[D]ebug step in" })
			vim.keymap.set("n", "<leader>dh", dap.step_out, { desc = "[D]ebug step out" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
			vim.keymap.set("n", "<leader>de", dap.terminate, { desc = "[D]ebug [E]nd" })
			vim.keymap.set("n", "<leader>dr", dap.run_last, { desc = "[D]ebug [R]un last" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebug toggle [B]reakpoint" })
			vim.keymap.set("n", "<leader>dd", function()
				vim.cmd("RustLsp testables")
			end, { desc = "[D]ebug toggle conditional breakpoint" })
		end,
	},
}
