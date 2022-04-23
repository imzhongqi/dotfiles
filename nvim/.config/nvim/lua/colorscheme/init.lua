require("colorscheme.tokyonight")

vim.cmd([[
	try
		colorscheme tokyonight
	catch /.*/
		colorscheme default
	endtry
]])
