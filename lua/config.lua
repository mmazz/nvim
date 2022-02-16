
vim.g.snippets = "luasnip"
local opt = vim.opt
opt.termguicolors = true

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.clipboard = {"unnamed", "unnamedplus"}


opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.cursorline = false -- Highlight the current line
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster, tenia 50
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- Tabs
opt.autoindent = true -- tenia smartindent
opt.cindent = true
opt.wrap = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamedplus"

opt.inccommand = "split"
opt.swapfile = true -- Living on the edge
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.mouse = "a" -- a tenia antes? tj n
-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }


--------mines

--set nocompatible
--filetype on
--filetype plugin indent on
--syntax on
--vim.o.completeopt = add { 'menuone', 'noinsert', 'noselect' }
--set directory^=$HOME/.config/nvim/swap//
--set spelllang=en_us,es
--set autoindent
--set colorcolumn=80,120
opt.signcolumn = 'yes:2'
opt.colorcolumn = '+1' -- Set the colour column to highlight one column after the 'textwidth'
--set encoding=UTF-8
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.guicursor = table.concat(
                      {
      [[n-i-v-c:block,r-cr:hor20,o:hor50]],
      [[a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor]],
      [[sm:block-blinkwait175-blinkoff150-blinkon175]]
    }, ','
                  )
--set nobackup
--set noerrorbell
vim.o.backup = false
vim.o.writebackup = false
vim.o.visualbell = true
vim.o.errorbells = true
vim.o.sidescrolloff = 10
vim.o.sidescroll = 1
--set sidescrolloff=8
--set signcolumn=yes
--set smartindent
--set title
vim.o.titlestring = ' ❐ %t %r %m'
vim.o.titleold = '%{fnamemodify(getcwd(), ":t")}'
vim.o.title = true
vim.o.titlelen = 70
--
vim.o.shortmess = table.concat(
                      {
      't', -- truncate file messages at start
      'A', -- ignore annoying swap file messages
      'o', -- file-read message overwrites previous
      'O', -- file-read message overwrites previous
      'T', -- truncate non-file messages in middle
      'f', -- (file x of x) instead of just (x of x
      'F', -- Don't give file info when editing a file
      's',
      'c',
      'W' -- Dont show [w] or written when writing
    }
                  )
--set shortmess+=c
--let g:netrw_browse_split = 0
--let g:netrw_banner = 0
--let g:netrw_winsize = 25
--au! BufWritePost $MYVIMRC source %

-- Treesitter
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldtext = 'v:lua.folds()'
--vim.o.foldopen = add(vim.o.foldopen, 'search')
vim.o.foldlevel = 99
vim.o.foldlevelstart = 10
opt.foldmethod = 'syntax'
