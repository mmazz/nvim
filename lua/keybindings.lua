local opts = {noremap = true, silent = false}
vim.g.mapleader = " "

vim.keymap.set({ "n" }, "<c-s>", '<cmd>w<cr>', opts)
vim.keymap.set({ "i", "v", "s" }, "<c-s>", '<cmd>w<cr><Esc>', opts)
vim.keymap.set({ "n", "i", "v" }, "<c-q>", '<cmd>wq<cr>', opts)
vim.keymap.set({ "n", "i", "v" }, "<Esc><Esc>", '<cmd>nohlsearch<cr>', opts)
vim.keymap.set({ "n"}, "<c-f>", '<Esc>:/', opts)

vim.keymap.set({ "i", "v" }, "jk", '<Esc>', opts)
vim.keymap.set({ "i", "v" }, "kj", '<Esc>', opts)
vim.keymap.set({ "v" }, "<", '<gv', opts)
vim.keymap.set({ "v" }, ">", '>gv', opts)

vim.keymap.set({ "n", "i", "v"}, "<c-r>", '<Esc>:source $MYVIMRC<CR>', opts)
vim.keymap.set({ "v" }, "J", "<Esc>:m '>+1<CR>gv=gv'", opts)
vim.keymap.set({ "v" }, "K", "<Esc>:m '<-2<CR>gv=gv'", opts)
vim.keymap.set({ "n" }, "<c-k>", ":cnext<CR>", opts)
vim.keymap.set({ "n" }, "<c-j>", ":cprev<CR>", opts)

vim.keymap.set({ "n" }, "<leader>z", "<Esc>:Centerpad<CR>", opts)

vim.keymap.set({ "n" }, "<leader>O", "<Esc>:setlocal spell! spelllang=en_us<CR>", opts)
vim.keymap.set({ "n" }, "<leader>o", "<Esc>:setlocal spell! spelllang=es<CR>", opts)
vim.keymap.set({ "n" }, "<leader>s", "<Esc>:!clear && spellcheck -x %<CR>", opts)

vim.keymap.set({ "n" }, "<leader>p", "<Esc>:!opout <c-r>%<CR><CR>", opts)
vim.keymap.set({ "n" }, "<leader>c", "<Esc>:w! | !compiler '<c-r>%'<CR>", opts)
-- Telescope
vim.keymap.set({ "n" }, "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fl", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
vim.keymap.set({ "n" }, "<c-p>",      "<cmd>Telescope git_files<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fs", "<cmd>Telescope grep_string<cr>", opts)
vim.keymap.set({ "n" }, "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
--vim.keymap.set({ "n" }, "<leader>fd", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)


-- LSP
vim.keymap.set("n", '<leader>gd', vim.lsp.buf.definition, opts)
vim.keymap.set("n", '<leader>gt', vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", '<leader>gi', vim.lsp.buf.implementation, opts)
vim.keymap.set("n", '<leader>vh', vim.lsp.buf.hover, opts)
vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set("n", '<leader>dn', vim.diagnostic.goto_next, opts)
vim.keymap.set("n", '<leader>dp', vim.diagnostic.goto_prev, opts)

vim.keymap.set("n", '<leader>vs',  vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", '<leader>vca', vim.lsp.buf.code_action, opts)
vim.keymap.set("n", '<leader>vrf', vim.lsp.buf.references, opts)
--vim.keymap.set({"n"}, '<leader>vD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--vim.keymap.set({"n"}, '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--vim.keymap.set({"n"}, '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--vim.keymap.set({"n"}, '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.keymap.set({"n"}, '<space>f', vim.lsp.buf.formatting, opts)




--vim.cmd('nmap <buffer> <leader>r <Esc>:w<CR>:!clear;python %<CR>')
vim.cmd('inoremap <esc> <nop>')

vim.cmd('autocmd BufNewFile,BufRead *.tex  nnoremap <leader>tp :-1read $HOME/.config/templates/practicos.tex<CR>')
vim.cmd('autocmd BufNewFile,BufRead *.tex  nnoremap <leader>tc :-1read $HOME/.config/templates/chapter.tex<CR>')
--local latex = vim.api.nvim_create_augroup("LatexFile", { clear = true })
--vim.api.nvim_create_autocmd("FileType", {
--    pattern = {"*"},
--    --command =  "vim.keymap.set({ 'n' }, '<leader>tp', ':-1read $HOME/.config/templates/practicos.tex<CR>', opts)",
--    group = latex
--})

--augroup latex_au
--    autocmd!
--    autocmd BufNewFile,BufRead *.tex setlocal shiftwidth=2 tabstop=2
--    autocmd BufNewFile,BufRead *.tex  nnoremap <leader>tr :-1read $HOME/.config/templates/resumen.tex<CR>
--    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tr
--    autocmd BufWinLeave *.tex !texclear %
--augroup END
--



--nnoremap <leader>u :UndotreeShow<CR>
--cmap w!! w !sudo tee %
--nmap <buffer> <leader>b oimport ipdb;ipdb.set_trace(context=4)<ESC>
--
--
--"Better nav for omnicomplete
--""inoremap <expr> <c-j> ("\<C-n>")
--""inoremap <expr> <c-k> ("\<C-p>")
--
--" Use alt + hjkl to resize windows
--nnoremap <M-j>    :resize -2<CR>
--nnoremap <M-k>    :resize +2<CR>
--nnoremap <M-h>    :vertical resize -2<CR>
--nnoremap <M-l>    :vertical resize +2<CR>
--
--
--" TAB in general mode will move to text buffer
--"nnoremap <TAB> :bnext<CR> " breaks C-i
--" SHIFT-TAB will go back
--"nnoremap <S-TAB> :bprevious<CR>
--"
--" <TAB>: completion.
--" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
--
--" Better window navigation
--"nnoremap <C-h> <C-w>h
--"nnoremap <C-j> <C-w>j
--"nnoremap <C-k> <C-w>k
--"nnoremap <C-l> <C-w>l
--
--nnoremap <silent> <leader><leader> :source $MYVIMRC<cr>
--" The Primeagen
--
--nnoremap n nzzzv
--nnoremap N Nzzzv
--nnoremap J mzJ`z
--
--inoremap , ,<c-g>u
--inoremap . .<c-g>u
--inoremap ! !<c-g>u
--inoremap ? ?<c-g>u
--
--
--
--inoremap <C-j> <esc>:m .+1<CR>==
--nnoremap <leader>j :m .+1<CR>==
--inoremap <C-k> <esc>:m .-2<CR>==
--nnoremap <leader>k :m .-2<CR>==
--
--
--
--" project view
--nnoremap <leader>pv :Ex<CR>
--
--au! BufWritePost $MYVIMRC source %
