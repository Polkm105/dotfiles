return {
  'ellisonleao/dotenv.nvim',
    lazy = false,
  priority = 2000,
  config = function()
    -- Initialize the plugin defaults
    require("dotenv").setup({
      enable_on_load = true,
      verbose = false,
    })

    -- Force Neovim to load your global .env file from the root nvim configuration directory
    local global_env = vim.fn.stdpath("config") .. "/.env"
    if vim.fn.filereadable(global_env) == 1 then
      vim.cmd.Dotenv(global_env)
    end
  end,
}
