vim.cmd([[
	try
    "colorscheme darkplus
		colorscheme gruvbox-baby
	catch /^Vim\%((\a\+)\)\=:(E185|E518)/
		colorscheme default
		set background = dark
	endtry
  highlight debugPC guibg=#1c5187
  highlight breakpoint guifg=#fa0000
]])