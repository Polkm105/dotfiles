return {

	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts

		opts = {
			-- Id is automatically added at the beginnin, and name at the end
			-- See :help oil-columns
			columns = {
				"icon",
				"size",
				"mtime",
			},
			-- Configuration for the floating window in oil.open_float
			float = {
				-- Padding around the floating window
				padding = 2,
				-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				max_width = 0.8,
				max_height = 0.85,
				win_options = {
					winblend = 0,
				},
				border = "rounded",
				relative = "editor",
				style = "minimal",
				-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
				get_win_title = nil,
				-- preview_split: Split direction: "auto", "left", "right", "above", "below".
				preview_split = "auto",
			},

			-- Watch for filesystem changes and reload oil
			watch_for_changes = true,

			keymaps = {
				["<C-h>"] = false,
				["<C-v>"] = { "actions.select", opts = { vertical = true } },
			},

			view_options = {
				show_hidden = true,
			},
		},

		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },

		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations
		lazy = false,

		config = function(_, opts)
			local oil = require("oil")
			oil.setup(opts)

			vim.keymap.set("n", "-", function()
				if vim.bo.filetype ~= "oil" then
					oil.open_float()
				end
			end, { desc = "Open the parent directory" })
		end,
	},
	{
		"benomahony/oil-git.nvim",
		dependencies = { "stevearc/oil.nvim" },
	},
}
