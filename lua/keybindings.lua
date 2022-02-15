 local opts = {noremap = true, silent = false}

vim.keymap.set({ "n", "i", "v", "s" }, "<c-s>", '<cmd>w<cr>', opts)
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



vim.keymap.set({ "n" }, "<leader>c", "<Esc>:w! | !compiler '<c-r>%'<CR>", opts)

--vim.keymap.set({ "n" }, "<leader>ff", "require('telescope.builtin').find_files()<CR>", opts)


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
vim.keymap.set({"n"}, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set({"n"}, '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.keymap.set({"n"}, '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.keymap.set({"n"}, '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.keymap.set({"n"}, '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.keymap.set({"n"}, '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set({"n"}, '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.keymap.set({"n"}, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.keymap.set({"n"}, '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
