vim.cmd([[
	try
		colorscheme tokyonight
	catch /.*/
		colorscheme default
	endtry
]])

require("plugins.colorscheme.tokyonight")
