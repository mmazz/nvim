local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'navarasu/onedark.nvim'
    use { "kyazdani42/nvim-tree.lua"}
    use 'norcalli/nvim-colorizer.lua'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
     }
    use 'nvim-treesitter/playground'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'},
       { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },}
      }
    use {'lervag/vimtex', ft = 'tex'}
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'smithbm2316/centerpad.nvim'
    use 'goolord/alpha-nvim'
    use "mfussenegger/nvim-dap"
    -- use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"
    use "ravenxrz/DAPInstall.nvim"
    --  use {'lewis6991/spellsitter.nvim',
   --     config = function()
   --         require('spellsitter').setup()
   --     end
   -- }
   -- use 'mfussenegger/nvim-dap'
   -- use 'rcarriga/nvim-dap-ui'
   -- use 'theHamsta/nvim-dap-virtual-text'
   -- use 'nvim-telescope/telescope-dap.nvim'
  -- Git
  use "lewis6991/gitsigns.nvim"
-- Keybinding
  use "folke/which-key.nvim"
-- Terminal
  use "akinsho/toggleterm.nvim"
    -- Comment
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"
  -- Editing Support
  use "windwp/nvim-autopairs"
  use "ThePrimeagen/vim-be-good"
  use("romgrk/nvim-treesitter-context")
  use "ellisonleao/gruvbox.nvim"
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
