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

vim.keymap.set({ "n" }, "Y", 'y$', opts)

vim.keymap.set({ "n", "i", "v"}, "<c-r>", '<Esc>:source $MYVIMRC<CR>', opts)
vim.keymap.set({ "v" }, "J", "<Esc>:m '>+1<CR>gv=gv'", opts)
vim.keymap.set({ "v" }, "K", "<Esc>:m '<-2<CR>gv=gv'", opts)
vim.keymap.set({ "n" }, "<c-k>", ":cnext<CR>", opts)
vim.keymap.set({ "n" }, "<c-j>", ":cprev<CR>", opts)




vim.keymap.set({ "n" }, "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fl", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fg", "<cmd>Telescope git_files<cr>", opts)
vim.keymap.set({ "n" }, "<c-p>", "<cmd>Telescope git_files<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fs", "<cmd>Telescope grep_string<cr>", opts)
vim.keymap.set({ "n" }, "<leader>fd", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)

--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
--nnoremap <leader>fb <cmd>Telescope buffers<cr>
--nnoremap <leader>fh <cmd>Telescope help_tags<cr>
vim.keymap.set({ "n" }, "<leader>z", "<Esc>:Centerpad<CR>", opts)

--nnoremap ff :lua require('telescope.builtin').find_files()<CR>
--nnoremap fg :lua require('telescope.builtin').git_files()<CR>
--nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
--nnoremap fs :lua require('telescope.builtin').grep_string<CR>
--nnoremap fb :lua require('telescope.builtin').buffers()<CR>
--nnoremap fh :lua require('telescope.builtin').hel_tags()<CR>
--
vim.keymap.set({"n"}, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.keymap.set({"n"}, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set({"n"}, 'gK', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.keymap.set({"n"}, 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set({"n"}, '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set({"n"}, '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.keymap.set({"n"}, '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.keymap.set({"n"}, '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.keymap.set({"n"}, '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.keymap.set({"n"}, '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set({"n"}, '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.keymap.set({"n"}, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.keymap.set({"n"}, '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


vim.keymap.set({ "n" }, "<leader>O", "<Esc>:setlocal spell! spelllang=en_us<CR>", opts)
vim.keymap.set({ "n" }, "<leader>o", "<Esc>:setlocal spell! spelllang=es<CR>", opts)
vim.keymap.set({ "n" }, "<leader>s", "<Esc>:!clear && spellcheck -x %<CR>", opts)

vim.keymap.set({ "n" }, "<leader>p", "<Esc>:!opout <c-r>%<CR><CR>", opts)
vim.keymap.set({ "n" }, "<leader>c", "<Esc>:w! | !compiler '<c-r>%'<CR>", opts)

vim.cmd('nmap <buffer> <leader>r <Esc>:w<CR>:!clear;python %<CR>')
vim.cmd('inoremap <esc> <nop>')

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
