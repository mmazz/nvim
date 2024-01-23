return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")

            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
            vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

            local types = require("luasnip.util.types")

            ls.config.set_config({
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,
                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { "<-", "Error" } },
                        },
                    },
                },
            })

            -- <c-k> is my expansion key
            -- this will expand the current item or jump to the next item within the snippet.
            vim.keymap.set({ "i", "s" }, "<c-k>", function()
              if ls.expand_or_jumpable() then
                ls.expand_or_jump()
              end
            end, { silent = true })

            -- <c-j> is my jump backwards key.
            -- this always moves to the previous item within the snippet
            vim.keymap.set({ "i", "s" }, "<c-j>", function()
              if ls.jumpable(-1) then
                ls.jump(-1)
              end
            end, { silent = true })

            -- <c-l> is selecting within a list of options.
            -- This is useful for choice nodes (introduced in the forthcoming episode 2)
            vim.keymap.set("i", "<c-l>", function()
              if ls.choice_active() then
                ls.change_choice(1)
              end
            end)

            vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")
        end
    }

}
