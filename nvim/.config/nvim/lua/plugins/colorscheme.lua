vim.cmd [[
	try
    "colorscheme darkplus
		colorscheme gruvbox-baby
	catch /^Vim\%((\a\+)\)\=:(E185|E518)/
		colorscheme default
		set background = dark
	endtry
]]
