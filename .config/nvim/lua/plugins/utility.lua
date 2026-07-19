vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = "[^l]*",
	nested = true,
	command = "cwindow",
})

return {
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"NMAC427/guess-indent.nvim", -- Detect tabstop and shiftwidth automatically

	-- mini icons
	{ "nvim-mini/mini.nvim", version = false },

	-- toggle terminal floating window
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- Change default :bd to keep splits open
	{
		"famiu/bufdelete.nvim",
		config = function()
			local bd = require("bufdelete")
			vim.keymap.set("n", "<leader>bd", bd.bufdelete, { desc = "Delete current [B]uffer" })
		end,
	},
}
