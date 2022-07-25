require('user.keymaps')
require('user.null-ls')
require('user.plugins')
require('user.options')
require('user.luasnip')
require('user.lualine')
require('user.lspconfig')
require('user.cmp')
require('user.augroups')
require('user.treesitter')
require('user.nvim-tree')
require('user.alpha')
require('user.dap')
require'colorizer'.setup()
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

require('telescope').setup{}
--
--

--require("nvim-dap-virtual-text").setup()

--require("dapui").setup()

