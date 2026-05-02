return {
	{
		"mrcjkb/rustaceanvim",
		version = "^8", -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			vim.keymap.set("n", "<leader>dt", function()
				vim.cmd("RustLsp testables")
			end, { desc = "[D]ebug [T]est" })

			local mason_registry = require("mason-registry")
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = require("mason.settings").current.install_root_dir .. "/extensions/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
			local cfg = require("rustaceanvim.config")

			vim.g.rustaceanvim = {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}

			local dap = require("dap")
			dap.configurations.rust = {
				{
					name = "Debug executable",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},

					preLaunchTask = function()
						local Terminal = require("toggleterm.terminal").Terminal
						local cargo_build = Terminal:new({ cmd = "cargo build", hidden = true })
						cargo_build:toggle()
					end,
				},
			}
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
}
