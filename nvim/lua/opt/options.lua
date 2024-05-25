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
vim.g.markdown_recommended_style = 0 -- set default tabstop in markdown file
-- vim number
opt.number = true
opt.relativenumber = true
-- scrolloff, keep the cursor at the middle of screen
vim.opt.scrolloff = 999
-- local function center_cursor()
-- 	local pos = vim.api.nvim_win_get_cursor(0)
-- 	vim.api.nvim_command("normal! zz")
-- 	vim.api.nvim_win_set_cursor(0, pos)
-- end
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 	pattern = "*",
-- 	callback = center_cursor,
-- })

-- set vim spell check
vim.opt.spelllang = "en_us,cjk"
vim.opt.spell = true
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
-- set cursorline
opt.cursorline = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- substitute preview in split
opt.inccommand = "split"
-- default split
opt.splitbelow = true
opt.splitright = true
-- set undodir
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME/.undo//")
-- built-in indent blank line
opt.list = true
opt.listchars = { leadmultispace = "│ ", multispace = "│ ", tab = "│ " }

-- set folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
-- shada file
vim.opt.shada = { "'50", "<100", "s100", "h" }

-- clipboard settings
vim.opt.clipboard = "unnamedplus"
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
