vim.g.tokyonight_colors = {
	hint = "orange",
	error = "#ff0000",
}

vim.cmd([[
	try
		colorscheme tokyonight
  catch /.*/
		colorscheme default
	endtry
]])

require("plugins.colorscheme.tokyonight")
