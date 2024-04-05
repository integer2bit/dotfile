return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		require("lualine").setup({
			options = {
				theme = "catppuccin-frappe",
				sections = {
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
						},
						{ "encoding" },
						{ "fileformat" },
						{ "filetype" },
					},
				},
			},
		})
	end,
}
