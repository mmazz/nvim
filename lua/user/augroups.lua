
-- cada vez que hago resource re hace la funcion.
vim.cmd([[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]])

vim.cmd( [[
augroup mati
    " Borra el autocmd que pudo haberse corrido previamente. Si no se acumulan
    autocmd!
    " When a write in buffer (save) apply function trim
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
]])

vim.cmd( [[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]])
vim.cmd( [[ autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb % ]])



--vim.cmd( [[autocmd TermOpen * setlocal nonu]])

vim.cmd( [[let g:python3_host_prog = '/usr/bin/python']])
vim.cmd( [[autocmd BufWritePost *bote-*.md silent !buildNote %:p ]])

