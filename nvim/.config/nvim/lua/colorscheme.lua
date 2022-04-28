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

vim.cmd([[
    hi link DapUIVariable Normal
    hi DapUIScope guifg=#ffffff
    hi DapUIType guifg=#60878b
    hi link DapUIValue Normal
    hi DapUIModifiedValue guifg=#00F1F5 gui=bold
    hi DapUIDecoration guifg=#fcecc5
    hi DapUIThread guifg=#434649
    hi DapUIStoppedThread guifg=#ffffff
    hi link DapUIFrameName Normal
    hi DapUISource guifg=#106ba3
    hi DapUILineNumber guifg=#949699
    hi DapUIFloatBorder guifg=#ffffff
    hi DapUIWatchesEmpty guifg=#F70067
    hi DapUIWatchesValue guifg=#A9FF68
    hi DapUIWatchesError guifg=#F70067
    hi DapUIBreakpointsPath guifg=#ffffff
    hi DapUIBreakpointsInfo guifg=#949699
    hi DapUIBreakpointsCurrentLine guifg=#949699 gui=bold
    hi link DapUIBreakpointsLine DapUILineNumber
]])
