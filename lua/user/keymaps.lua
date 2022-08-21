local opts = {noremap = true, silent = false}
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)

keymap({ "i", "v", "s" }, "<c-s>", '<cmd>w<cr><Esc>', opts)
keymap({ "n", "i", "v" }, "<c-q>", '<cmd>wq<cr>', opts)
keymap({ "n", "i", "v" }, "<Esc><Esc>", '<cmd>nohlsearch<cr>', opts)
keymap( "n", "<c-f>", '<Esc>/', opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
--keymap( "n" , "<c-k>", ":cnext<CR>", opts)
--keymap( "n" , "<c-j>", ":cprev<CR>", opts)

-- Tabs --
keymap("n", "<m-t>", ":tabnew %<cr>", opts)
keymap("n", "<m-y>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)



keymap( "n" , 'gf', "<cmd>e <cfile><cr>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Inert --
keymap({ "i", "v" }, "jk", '<Esc>', opts)
keymap({ "i", "v" }, "kj", '<Esc>', opts)

-- Inkscape latex
--vim.cmd([[ inoremap <C-i> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]])
--vim.cmd([[ nnoremap <C-i> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]])
vim.api.nvim_create_autocmd("FileType", { pattern = "tex",
    command = [[nnoremap <C-i> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]]})

vim.api.nvim_create_autocmd("FileType", { pattern = "tex",
    command = [[inoremap <C-i> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]]})

keymap("i", "<c-o>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)


-- Visual --
-- Stay in indent mode
keymap( "v" , "<", '<gv', opts)
keymap( "v" , ">", '>gv', opts)
--keymap( "v" , "<c-j>", "<Esc>:m .+1<CR>==", opts)
--keymap( "v" , "<c-k>", "<Esc>:m .-2<CR>==", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

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
-- keymap( "n" , "<leader>z", "<Esc>:Centerpad<CR>", opts)

