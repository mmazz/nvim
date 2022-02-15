require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'navarasu/onedark.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
      }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
      }
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kassio/neoterm'
    use 'smithbm2316/centerpad.nvim'
end)


