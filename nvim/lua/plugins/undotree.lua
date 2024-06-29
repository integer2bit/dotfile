return {
	{
		"mbbill/undotree",
		config = function()
			-- vim.g.undotree_WindowLayout = 3
			-- vim.g.undotree_SplitWidth = 30
			-- vim.g.undotree_DiffpanelHeight = 10
			-- vim.g.undotree_SetFocusWhenToggle = 1
			vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
}
