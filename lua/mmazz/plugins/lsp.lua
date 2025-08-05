return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        require("fidget").setup({})
        require("mason").setup({
            ensure_installed = {
                "clang-format",
            }
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
              --  "pyright",
              --  "texlab",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,

                ["clangd"] = function()
                    require("lspconfig").clangd.setup {
                        cmd = { "clangd", "--header-insertion=never" },
                        filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
                        on_attach = function(_, bufnr)
                            vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr })
                        end
                    }
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,

                ["pyright"] = function()
                    require("lspconfig").pyright.setup {}
                end,
                ["texlab"] = function()
                  local lspconfig = require("lspconfig")
                  local util = lspconfig.util
                  lspconfig.texlab.setup({
                    root_dir = util.root_pattern("main.tex", ".git", "latexmkrc"),
                    settings = {
                      texlab = {
                        build = {
                          executable = "latexmk",
                          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                          onSave = true,
                          forwardSearchAfter = true,
                        },
                        forwardSearch = {
                          executable = "zathura",
                          args = { "--synctex-forward", "%l:1:%f", "%p" },
                        },
                        chktex = {
                          onEdit = false,
                          onOpenAndSave = true,
                        },
                        diagnosticsDelay = 300,
                        rootDirectory = nil,
                      },
                    },
                  })
                end,

            }

        })
        local cmp = require'cmp'
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.config.disable,
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
            },
                    {
                        { name = 'buffer' },
                    }
            )
        })
        vim.diagnostic.config({
            update_in_insert = true, float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

    end
}

