return {
	{
		--	"ellisonleao/gruvbox.nvim",
		--	priority = 1000,
		--	lazy = false,
		--	name = "gruvbox",
		--	opt = ...,
		--	config = function()
		--		vim.cmd.colorscheme("gruvbox")
		--	end,
		 "catppuccin/nvim", name = "catppuccin", priority = 1000,
		     config = function()
		     vim.cmd.colorscheme "catppuccin-frappe"
		   end,
		-- "navarasu/onedark.nvim",
		-- name = "onedark",
		-- config = function()
    --   require('onedark').setup  {
    --     style = 'cool'
    --   }
		-- 	vim.cmd.colorscheme("onedark")
		-- end,
	},
}
