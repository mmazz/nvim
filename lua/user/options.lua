local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  --clipboard = {"unnamed", "unnamedplus"}

  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
--completeopt =  { 'menu', 'menuone', 'noinsert', 'noselect' }

  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 0,                       -- faster completion (4000ms default)
 --updatetime = 1000 -- Make updates happen faster, tenia 50

  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 10,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  -- colorcolumn = "80",
  -- colorcolumn = "120",
colorcolumn = '80,120'
--    opt.signcolumn = 'yes:2'

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
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

--local opt = vim.opt
--opt.wildignore = "__pycache__"
--opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }
--opt.pumblend = 17
--opt.wildmode = "longest:full"
--opt.wildoptions = "pum"
--opt.softtabstop = 2
--opt.incsearch = true -- Makes search act like search in modern browsers
--opt.showmatch = true -- show matching brackets when text indicator is over them
--opt.hidden = true -- I like having buffers stay around
--opt.equalalways = false -- I don't like my windows changing all the time
--opt.autoindent = true -- tenia smartindent
--opt.cindent = true
--opt.softtabstop = 4
--opt.breakindent = true
--opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
--opt.linebreak = true
--opt.foldmethod = "marker"
--opt.foldlevel = 0
--opt.modelines = 1
--opt.belloff = "all" -- Just turn the dang bell off
--opt.inccommand = "split"
--opt.swapfile = true -- Living on the edge
--opt.shada = { "!", "'1000", "<50", "s10", "h" }
--opt.formatoptions = opt.formatoptions
--  - "a" -- Auto formatting is BAD.
--  - "t" -- Don't auto format my code. I got linters for that.
--  + "c" -- In general, I like it when comments respect textwidth
--  + "q" -- Allow formatting comments w/ gq
--  - "o" -- O and o, don't continue comments
--  + "r" -- But do continue when pressing enter.
--  + "n" -- Indent past the formatlistpat, not underneath it.
--  + "j" -- Auto-remove comments if possible.
--  - "2" -- I'm not in gradeschool anymore
--opt.joinspaces = false -- Two spaces and grade school, we're done
--opt.fillchars = { eob = "~" }
--opt.signcolumn = 'yes:2'
--vim.o.guicursor = table.concat(
--                      {
--      [[n-i-v-c:block,r-cr:hor20,o:hor50]],
--      [[a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor]],
--      [[sm:block-blinkwait175-blinkoff150-blinkon175]]
--    }, ','
--                  )
--vim.o.visualbell = true
--vim.o.errorbells = true
--vim.o.sidescroll = 1
--vim.o.titlestring = ' ❐ %t %r %m'
--vim.o.titleold = '%{fnamemodify(getcwd(), ":t")}'
--vim.o.title = true
--vim.o.titlelen = 70
--vim.o.shortmess = table.concat(
--                      {
--      't', -- truncate file messages at start
--      'A', -- ignore annoying swap file messages
--      'o', -- file-read message overwrites previous
--      'O', -- file-read message overwrites previous
--      'T', -- truncate non-file messages in middle
--      'f', -- (file x of x) instead of just (x of x
--      'F', -- Don't give file info when editing a file
--      's',
--      'c',
--      'W' -- Dont show [w] or written when writing
--    }
--                  )
--
--vim.o.foldtext = 'v:lua.folds()'
--
--vim.o.foldlevel = 99
--vim.o.foldlevelstart = 10
--opt.foldmethod = 'syntax'
