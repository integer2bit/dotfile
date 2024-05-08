vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt
-- true color
opt.termguicolors = true
-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.swapfile = false
vim.g.mapleader = " "
-- vim number
opt.number = true
opt.relativenumber = true
-- set vim spell check
vim.opt.spelllang = "en_us,cjk"
vim.opt.spell = true
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
-- set cursorline
opt.cursorline = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- set undodir
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME/.undo//")
-- set folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- gx open browser with wsl
function _G.open_cursor_link()
	local link = vim.fn.expand("<cfile>")
	if link and link ~= "" then
		local cmd
		if vim.fn.has("wsl") == 1 then
			cmd = "/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0/powershell.exe Start chrome " .. link
		end
		vim.fn.system(cmd)
	else
		print("No link detected under cursor.")
	end
end
vim.api.nvim_set_keymap("n", "gx", ":lua open_cursor_link()<CR>", { noremap = true, silent = true })

-- copy to system if not on wsl
-- opt.clipboard = "unnamedplus"

-- copy to system clip board in wsl
if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = vim.api.nvim_create_augroup("Yank", { clear = true }),
		callback = function()
			vim.fn.system("/mnt/c/Windows/System32/clip.exe", vim.fn.getreg('"'))
		end,
	})
end
-- highlight after copy
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})
-- conseal leavel for markdown
vim.opt.conceallevel = 2
-- open help in a vertical split
-- local group = vim.api.nvim_create_augroup("vertical_help", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = group,
-- 	pattern = "help",
-- 	command = "wincmd L",
-- })
-- keymap
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
-- https://www.reddit.com/r/vim/comments/3k4cbr/problem_with_gj_and_gk/
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
-- window operation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
-- quit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
-- change directory into current file path
vim.keymap.set("n", "<leader>cd", function()
	local cwd = vim.fn.expand("%:h")
	vim.cmd("cd " .. cwd)
	print("Changed directory to " .. cwd)
end, { desc = "Set current buffer directory as working directory" })
-- black hole register keymap
vim.keymap.set("n", '<leader>"', '"_', { noremap = true, silent = true, desc = "black hole register" })
-- window management
vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = true, silent = true, desc = "window operation" })
-- buffer management
vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" }) -- open new tab
vim.keymap.set("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Previous buffer" }) -- open new tab
vim.keymap.set("n", "<leader>bl", "<cmd>blast<CR>", { desc = "Last buffer" }) -- open new tab
vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { desc = "Delete current buffer" }) --  move current buffer to new tab
-- Disable bufferline
vim.opt.showtabline = 0
-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
