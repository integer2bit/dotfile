return {
	{
		--	keys = {
		--		{ "<c-n>", ":Neotree filesystem reveal left<cr>", desc = "Neotree reveal" },
		--	},
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			vim.keymap.set("n", "<c-n>", ":Neotree filesystem reveal left<cr>", {}),
		},
	},
}
