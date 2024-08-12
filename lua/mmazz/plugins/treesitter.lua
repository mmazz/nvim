return {
    "nvim-treesitter/nvim-treesitter",
      event = { "BufReadPre", "BufNewFile" },
      build = ":TSUpdate",
      dependencies = {
        -- "nvim-treesitter/nvim-treesitter-textobjects",
       -- "JoosepAlviste/nvim-ts-context-commentstring",
        "windwp/nvim-ts-autotag",
      },
    config = function()
        require("nvim-treesitter.configs").setup({
          -- A list of parser names, or "all"
          ensure_installed = { "vimdoc", "c", "lua", "cpp", "python" },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          indent = {
              enable = true
          },

          highlight = {
            -- `false` will disable the whole extension
            enable = true,
            disable = { "css", "latex", "markdown", "cls" },
          },
                  -- enable autotagging (w/ nvim-ts-autotag plugin)
          autotag = {
            enable = false,
          },
                  -- ensure these language parsers are installed
          ensure_installed = {
            "json",
            "yaml",
            "html",
            "bash",
            "lua",
            "vim",
            "gitignore",
            "python",
            "vim",
            "c",
            "gitignore",
            "bibtex",
            "vimdoc",
          },
            -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = true,
          ignore_install = { "latex" }, -- List of parsers to ignore installing
      })

  --    local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  --    treesitter_parser_config.templ = {
  --        install_info {
  --            url = "https://github.com/vrischmann/tree-sitter-templ.git",
  --            files = {"src/parser.c", "src/scanner.c"},
  --            branch = "master",
  --        },
  --    }
  --    vim.treesitter.language.register('templ', 'templ')
      end
}
