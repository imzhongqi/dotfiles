require("colorscheme.onedark")

vim.cmd([[
	try
		colorscheme onedark
	catch /.*/
		colorscheme default
	endtry
]])

vim.cmd([[
    hi Pmenu blend=10 
	hi NormalFloat blend=10
	hi FloatBorder blend=10
]])
