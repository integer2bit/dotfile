return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		name = "gruvbox",
		opt = ...,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
