return {
  -- Snippets + friendly-snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Treesitter para latex con highlight e indentación
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "latex", "bibtex" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Outline con aerial.nvim
  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    config = function()
      require("aerial").setup({
        backends = { "lsp", "treesitter" },
        layout = { max_width = 40, min_width = 20, default_direction = "right" },
      })
    end,
  },

  -- LSP texlab (opcional, pero recomendado)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "texlab" },
      })
      require("lspconfig").texlab.setup({})
    end,
  },

  -- nvim-autopairs con regla para \begin{}...\end{}
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        check_ts = true,
        enable_check_bracket_line = false,
        ignored_next_char = "[%w%.]",
      })
    local Rule = require("nvim-autopairs.rule")
    local npairs = require("nvim-autopairs")

    npairs.add_rules({
      Rule("\\begin{", "}", "tex")
        :use_regex(true)
        :set_end_pair_length(1)
        :with_pair(function(opts)
          local next_char = opts.line:sub(opts.col, opts.col)
          return next_char ~= "}"
        end)
        :replace_endpair(function(opts)
          return "}" .. "\n\t\n\\end{" .. opts.prev_char:match("\\begin{(.*)}") .. "}"
        end)
    })
    end,
  },
}

