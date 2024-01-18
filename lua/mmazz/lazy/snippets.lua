return {
    {
        "L3MON4D3/LuaSnip",
        "evesdropper/luasnip-latex-snippets.nvim",

        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            --require("luasnip.loaders.from_vscode").lazy_load()
            local ls = require("luasnip")
            ls.filetype_extend("c", {"cdoc"})
            ls.filetype_extend("cpp", {"cppdoc"})
            ls.filetype_extend("python", {"pydoc"})
            ls.filetype_extend("lua", {"luadoc"})
        end,
    }
}
