return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			config = {
				options = {
					-- Disable sections and component separators
					component_separators = "",
					section_separators = "",
					theme = "catppuccin-frappe",
				},
			},
			sections = {
				lualine_a = {
					{ "mode" },
					{
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then
								return ""
							end -- not recording
							return "recording to " .. reg
						end,
					},
				},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename", "selectioncount" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
