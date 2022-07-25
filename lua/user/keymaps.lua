local opts = {noremap = true, silent = false}
local keymap = vim.keymap.set

vim.g.mapleader = " "

vim.cmd([[ inoremap <C-i> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]])
vim.cmd([[ nnoremap <C-i> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]])
--inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
keymap("i", "<c-o>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)

keymap("n", "<leader>t", "NvimTreeToggle<cr>", opts)
keymap( "n" , "<c-s>", '<cmd>w<cr>', opts)
keymap({ "i", "v", "s" }, "<c-s>", '<cmd>w<cr><Esc>', opts)
keymap({ "n", "i", "v" }, "<c-q>", '<cmd>wq<cr>', opts)
keymap({ "n", "i", "v" }, "<Esc><Esc>", '<cmd>nohlsearch<cr>', opts)
keymap( "n", "<c-f>", '<Esc>/', opts)

keymap({ "i", "v" }, "jk", '<Esc>', opts)
keymap({ "i", "v" }, "kj", '<Esc>', opts)
keymap( "v" , "<", '<gv', opts)
keymap( "v" , ">", '>gv', opts)

keymap( "n", "<leader>r", '<Esc>:source $MYVIMRC<CR>', opts)
keymap( "v" , "J", "<Esc>:m '>+1<CR>gv=gv'", opts)
keymap( "v" , "K", "<Esc>:m '<-2<CR>gv=gv'", opts)
keymap( "n" , "<c-k>", ":cnext<CR>", opts)
keymap( "n" , "<c-j>", ":cprev<CR>", opts)

keymap( "n" , "<leader>z", "<Esc>:Centerpad<CR>", opts)

keymap( "n" , "<leader>O", "<Esc>:setlocal spell! spelllang=en_us<CR>", opts)
keymap( "n" , "<leader>o", "<Esc>:setlocal spell! spelllang=es,en_us<CR>", opts)
--keymap( "n" , "<leader>s", "<Esc>:!clear && spellcheck -x %<CR>", opts)

keymap( "n" , "<leader>p", "<Esc>:!opout <c-r>%<CR><CR>", opts)
keymap( "n" , "<leader>c", "<Esc>:w! | !compiler '<c-r>%'<CR>", opts)
-- Telecope
keymap( "n" , "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap( "n" , "<leader>fl", "<cmd>Telescope live_grep<cr>", opts)
keymap( "n" , "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
keymap( "n" , "<c-p>",      "<cmd>Telescope git_files<cr>", opts)
keymap( "n" , "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap( "n" , "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap( "n" , "<leader>fs", "<cmd>Telescope grep_string<cr>", opts)
keymap( "n" , "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts)
--keymap({ "n" }, "<leader>fd", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)


-- LSP
keymap("n", '<leader>gd', vim.lsp.buf.definition, opts)
keymap("n", '<leader>gt', vim.lsp.buf.type_definition, opts)
keymap("n", '<leader>gi', vim.lsp.buf.implementation, opts)
keymap("n", '<leader>ho', vim.lsp.buf.hover, opts)
keymap("n", '<leader>rn', vim.lsp.buf.rename, opts)
keymap("n", '<leader>dn', vim.diagnostic.goto_next, opts)
keymap("n", '<leader>dp', vim.diagnostic.goto_prev, opts)

keymap("n", '<leader>vs',  vim.lsp.buf.signature_help, opts)
keymap("n", '<leader>ca', vim.lsp.buf.code_action, opts)
keymap("n", '<leader>rf', vim.lsp.buf.references, opts)
--keymap({"n"}, '<leader>vD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--keymap({"n"}, '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--keymap({"n"}, '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--keymap({"n"}, '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
keymap({"n"}, '<leader>f', vim.lsp.buf.formatting, opts)

keymap({"n"}, 'gf', "<cmd>e <cfile><cr>", opts)


keymap("n",  "<F10>" , function()
	if vim.o.conceallevel > 0 then
		vim.o.conceallevel = 0
	else
		vim.o.conceallevel = 2
	end
end, opts)

keymap("n",  "<F11>" , function()
	if vim.o.concealcursor == "n" then
		vim.o.concealcursor = ""
	else
		vim.o.concealcursor = "n"
	end
end, opts)
--vim.cmd('nmap <buffer> <leader>r <Esc>:w<CR>:!clear;python %<CR>')
vim.cmd('inoremap <esc> <nop>')

-- Latex

vim.cmd( [[
augroup latex_au
    autocmd!
    autocmd BufNewFile,BufRead *.tex setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tr :-1read $HOME/.config/templates/resumen.tex<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tn :-1read $HOME/.config/templates/notas.tex<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tp :-1read $HOME/.config/templates/presentacion.tex<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tcp :-1read $HOME/.config/templates/practicos.tex<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tcd :-1read $HOME/.config/templates/cole.tex<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tt :-1read $HOME/.config/templates/tesis.tex<CR>
    setlocal conceallevel=1
    highlight Conceal ctermbg=none ctermfg=none guibg=none guifg=none
    autocmd BufWinLeave *.tex !texclear %
augroup END
]])

--au! BufWritePost $MYVIMRC source %
vim.cmd([[
function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
        highlight Conceal ctermbg=none ctermfg=none guibg=none guifg=none
    else
        setlocal conceallevel=0
    endif
endfunction
nnoremap <silent> <C-c><C-c> :call ToggleConcealLevel()<CR>
]])

