require("colorscheme.onedark")

vim.cmd([[
	try
		colorscheme onedark
	catch /.*/
		colorscheme default
	endtry
]])
