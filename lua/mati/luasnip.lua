if vim.g.snippets ~= "luasnip" then
    return
end

local ls = require("luasnip")
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

-- Snippet creator, s(<trigger>, <nodes>)
local s = ls.s

-- Format node, takes a format string, and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

-- Insert node, takes a position (like $1) and optionally some default text
-- i(<position>, [default_text])
local i = ls.insert_node

-- Repeats a node, rep(<position>)
local rep = require("luasnip.extras").rep

----local m = ls.match_insert
----
----local rec_ls
----local t = ls.text_node
----local d = ls.dynamic_node
----local sn = ls.snippet_node
----local c = ls.choice_node
----rec_ls = function()
----	return sn(nil, {
----		c(1, {
----			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
----			t({""}),
----			-- The same dynamicNode as in the snippet (also note: self reference).
----			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),--		}),
----});
----end
--
--
ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "asd"),
        -- Lua specific snippets go here.
        --s("begin", fmt("\\begin{}\n \t{}\n \\end{}", {i(1), i(2)}, rep(1))),
        s("align", fmt("\\begin{{align}}\n \t{}\n \\end{{align}}", {i(1)})),
        s("equation", fmt("\\begin{{equation}}\n \t{}\n \\end{{equation}}", {i(1)})),
        s("item", fmt( "\\begin{{itemize}} \n\t\\item {}\n \\end{{itemize}}", { i(1)})),
        --s("fig", fmt( "\\begin{{figure}}[h!] \n\t \\centering \n\\includegraphics[scale{}]{}\n\\caption{}\n\\label{}\n \\end{{figure}}", { i(1), i(2), i(3), i(4)})),
        --s("fig", fmt( "\\begin{{figure}}\n{} \\end{{figure}}", { i(1)})),
        --s("md", fmt( "\\begin{{mdframed}}[backgroundcolor=frenchblue!20] \n\t {}\n \\end{{mdframed}}", { i(1)})),
        --s("ls", {	t({"\\begin{itemize}",	"\t\\item "}), i(1), d(2, rec_ls, {}),	t({"", "\\end{itemize}"}), i(0)}),
    },
    python = {
        ls.parser.parse_snippet("header", [[import matplotlib.pyplot as plt
import time
import pandas as pd
import git
from pathlib import Path
import os
import sys
plt.style.use('dark_background')
font_size = 21
ticks_size= 17
plt.rc('font', size=font_size) #controls default text size
plt.rc('axes', titlesize=font_size) #fontsize of the title
plt.rc('axes', labelsize=font_size) #fontsize of the x and y labels
plt.rc('xtick', labelsize=ticks_size) #fontsize of the x tick labels
plt.rc('ytick', labelsize=ticks_size) #fontsize of the y tick labels
plt.rc('legend', fontsize=font_size) #fontsize of the legend

root = Path(git.Repo('.', search_parent_directories=True).working_tree_dir)
fpath = os.path.join(root, 'src')
sys.path.append(fpath)
import utils.functions as fun

                     ]]),
    },

}



-- <c-k> is the expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })


vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.expand_or_jumpable(-1) then
        ls.expand_or_jump(-1)
    end
end, { silent = true })


-- selecting within a list of options
vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump(1)
    end
end)
-- shorcut to source luasnip file again, which reload my snipptes
vim.keymap.set("n", "<space><space>s", "<cmd>source ~/.config/nvim/lua/mati/luasnip.lua<CR>")

