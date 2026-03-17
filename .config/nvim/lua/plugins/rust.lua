return {
	{
		"mrcjkb/rustaceanvim",
		version = "^8", -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function ()
			vim.keymap.set("n", "<leader>dt", function()
				vim.cmd('RustLsp testables')
			end, { desc = "[D]ebug [T]est" })
		end,
	},
}
