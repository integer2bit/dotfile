return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.g.mkdp_auto_close = true
		vim.g.mkdp_open_to_the_world = false
		vim.g.mkdp_open_ip = "127.0.0.1"
		vim.g.mkdp_port = "8181"
		vim.g.mkdp_echo_preview_url = true
		vim.g.mkdp_theme = "light"
		vim.g.mkdp_page_title = "${name}"
		_G.OpenMarkdownPreview = function(url)
			vim.cmd(string.format("!wsl-open %s", url))
		end
		vim.cmd([[
    function! OpenMarkdownPreview(url) 
    call luaeval("_G.OpenMarkdownPreview(_A['url'])", {'url': a:url})
    endfunction
]])
		vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
	end,
}
