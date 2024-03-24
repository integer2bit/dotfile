return{
  {
    keys = {
      { "<c-p>", ":Telescope find_files hidden=true<cr>", desc = "find files" },
      { "<leader>fg", ":Telescope live_grep hidden=true<cr>", desc = "grep file" },
      { "<leader>rs", ":Telescope resume<cr>", desc = "resume" },
      { "<c-q>", ":Telescope oldfiles<cr>", desc = "oldfiles" },
    },
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }, --ripgrep,fd-find
    config = function()
      require("telescope").setup({
        extensions = {
          ['ui-select'] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  }
}

