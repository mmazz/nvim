local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  --clipboard = {"unnamed", "unnamedplus"}

  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
--completeopt =  { 'menu', 'menuone', 'noinsert', 'noselect' }
  conceallevel = 0,                        -- so that `` is visible in markdown files
  colorcolumn = '80,120',
  cursorline = true,                      -- highlight the current line
  errorbells = false,
  expandtab = true,                        -- convert tabs to spaces
  fileencoding = "utf-8",                  -- the encoding written to a file
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  hlsearch = false,                         -- highlight all matches on previous search pattern
  incsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  laststatus = 3,
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  pumheight = 10,                          -- pop up menu height
  relativenumber = true,                   -- set relative numbered lines
  ruler = false,
  scrolloff = 10,                           -- is one of my fav
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  sidescrolloff = 8,
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- always show tabs
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  showcmd = false,
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  softtabstop = 4,
  swapfile = false,                        -- creates a swapfile
  tabstop = 4,                             -- insert 2 spaces for a tab
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 50,                       -- faster completion (4000ms default)
  wrap = false,                            -- display lines as one long line
  writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.snippets = "luasnip"
vim.g['tex_flavor'] = 'latex'
vim.opt.fillchars = vim.opt.fillchars + 'eob: '
vim.opt.fillchars:append {
  stl = ' ',
}
vim.opt.shortmess:append "c"
vim.opt.isfname:append("@-@") --?
--vim.g['vimtex_compiler_latexmk'] = {'build_dir' : 'build'}
vim.g['vimtex_view_method'] = 'zathura'
vim.g['vimtex_quickfix_mode']= '-1'
vim.g['tex_conceal'] = 'abdmg'

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO this doesn't seem to work

