require("colorscheme.onedark")

vim.cmd([[
	try
		colorscheme onedark
	catch /.*/
		colorscheme default
	endtry
]])

vim.cmd([[
    hi! Pmenu blend=10 
]])
