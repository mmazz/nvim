vim.g.mapleader = " "
-- Insert mode mappings in Neovim Lua

vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Nop>', { noremap = true, silent = true })

vim.keymap.set('i', '<C-k>', '<C-O>gk', { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<C-O>gj', { noremap = true, silent = true })
vim.keymap.set('i', '<C-h>', '<C-O>h', { noremap = true, silent = true })
vim.keymap.set('i', '<C-l>', '<C-O>l', { noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- Appends to actual line the line below without moving the cursor.
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Highlight something and delete it without yank it, and is replaces with the previous yank
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-p>", "<Esc>:!opout <c-r>%<CR><CR>")
--vim.keymap.set("n", "<leader>c", "<Esc>:w! | !compiler '<c-r>%'<CR>")

vim.keymap.set("n", "<c-f>", '<Esc>/')

vim.keymap.set("i", "<c-d>", '<Esc>la')

-- Latex
vim.keymap.set("i", "<c-O>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

vim.keymap.set( "v" , ">", '>gv')
vim.keymap.set( "v" , "<", '<gv')

vim.keymap.set("i","<S-BS>", "<BS>")
