function filetype_go_settings()
  local opts = {
    expandtab = false,
    tabstop = 4,
    shiftwidth = 4,
  }
  for k, v in pairs(opts) do
    vim.bo[k] = v
  end
end

vim.cmd [[
  augroup _filetype_go
    autocmd!
    autocmd FileType go lua filetype_go_settings()
  augroup end
]]

vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  "Autoformat
  " augroup _lsp
  "   autocmd!
  "   "autocmd! FileType go
  "   autocmd BufWritePre * lua vim.lsp.buf.formatting()
  " augroup end
]]

-- autocmd BufEnter * :syntax sync fromstart
