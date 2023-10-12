-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
      'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
      cond = vim.fn.executable 'make' == 1
  }
  use({
	  'ellisonleao/gruvbox.nvim',
	  as = 'gruvbox',
	  config = function()
		  vim.cmd('colorscheme gruvbox')
	  end
  })

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("ThePrimeagen/vim-be-good")
  use("folke/zen-mode.nvim")
  use "folke/which-key.nvim"
  use {
      'nvim-lualine/lualine.nvim',
       requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'numToStr/Comment.nvim'
use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}
  -- debug
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
  use "jay-babu/mason-nvim-dap.nvim"
end)

 --   use {'lervag/vimtex', ft = 'tex'}
-- Keybinding
 --
-- Terminal
 -- use "akinsho/toggleterm.nvim"
    -- Comment
--  use "numToStr/Comment.nvim"
--  use "folke/todo-comments.nvim"
  -- Editing Support
--  use "windwp/nvim-autopairs"
--  if PACKER_BOOTSTRAP then
 --   require("packer").sync()
 -- end
