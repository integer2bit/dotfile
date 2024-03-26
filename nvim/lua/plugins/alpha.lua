return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.terminal.opts.redraw = true
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞  > Find file", ":cd $HOME | Telescope find_files hidden=true<cr>"),
			dashboard.button("n", "  > Neo tree", ":Neotree filesystem reveal left<cr>"),
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "󰗼  > Quit NVIM", ":qa<CR>"),
		}
		alpha.setup(dashboard.opts)
		vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
	end,
}
