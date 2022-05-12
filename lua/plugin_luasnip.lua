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

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local m = ls.match_insert

local rec_ls
local t = ls.text_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local c = ls.choice_node
rec_ls = function()
	return sn(nil, {
		c(1, {
			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
			t({""}),
			-- The same dynamicNode as in the snippet (also note: self reference).
			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
		}),
	});
end

local f = ls.function_node

local prob = function(index)
    return f(function(arg)
        local res = 1-tonumber(arg[1][1])
        print(vim.inspect(res))
        return arg[1][1]
    end, { index })
end

ls.add_snippets("all", {
     s("test", fmt([[{} testing LuaSnip {}]],{i(1), prob(1)})),
    },{
    key = "all",
})

ls.add_snippets("tex", {
        ls.parser.parse_snippet("color", "\\definecolor{frenchblue}{rgb}{0.0, 0.45, 0.73}"),
        s("begin", fmt("\\begin{{{}}}\n \t{}\n\\end{{{}}}", {i(1), i(2), rep(1)})),
        s("align", fmt("\\begin{{align}}\n \t{}\n\\end{{align}}", {i(1)})),
        s("equation", fmt("\\begin{{equation}}\n \t{}\n\\end{{equation}}", {i(1)})),
        --s("item", fmt( "\\begin{{itemize}} \n\t\\item {}\n \\end{{itemize}}", { i(1)})),
        s("fig", fmt( "\\begin{{figure}}[h!] \n\t\\centering \n\t\\includegraphics[scale={}]{{{}.{}}}\n\t\\caption{{{}}}\n\t\\label{{fig:{}}}\n\\end{{figure}}", { i(1), i(2), i(3), i(4), rep(2)})),
        s("fig*", fmt( "\\begin{{figure}}[h!] \n\t\\centering \n\t\\includegraphics[scale={}]{{{}}}\n\\end{{figure}}", { i(1), i(2)})),
        s("md", fmt( "\\begin{{mdframed}}[backgroundcolor=frenchblue!20]\n\t{}\n\\end{{mdframed}}", { i(1)})),
        s("item", {	t({"\\begin{itemize}",	"\t\\item "}), i(1), d(2, rec_ls, {}),	t({"", "\\end{itemize}"}), i(0)}),
        s("enumerate", {	t({"\\begin{enumerate}",	"\t\\item "}), i(1), d(2, rec_ls, {}),	t({"", "\\end{enumerate}"}), i(0)}),
        s("columns", fmt("\\begin{{columns}}\n\t\\column{{0.{}\\textwidth}}\n\t\t{}\n\t\\column{{0.{}\\textwidth}}\n\t\t{}\n\\end{{columns}}", {i(1), i(2),i(3),i(4)})),
        s("bf", fmt("\\textbf{{{}}}", {i(1)})),
        s("it", fmt("\\textit{{{}}}", {i(1)})),
        s("tt", fmt("\\texttt{{{}}}", {i(1)})),
        --s("columns2", fmt("\\begin{{columns}}\n\t\\column{{0.{}\\textwidth}}\n\t\t{}\n\t\\column{{0.{}\\textwidth}}\n\t\t{}\n\\end{{columns}}", {i(1), i(2), prob(1), i(4)})),
        s("columns2", fmt("\\begin{{columns}}\\column{{0.{}\\textwidth}}\\column{{0.{}\\textwidth}}", {i(1), prob(1)})),
},{
    key = "tex",
})

ls.add_snippets("python", {
        s("class", fmt("class {}({}):\n\t\"\"\" {}\n\t\"\"\"\n\tdef __init__(self, {}):\n\t\t{} ", {i(1),i(2,"arg1"),i(3),i(4),i(5)})),
        s("def", fmt("def {}({}):\n \t\"\"\" {}\n\t\"\"\"\n\t{}\n\treturn ", {i(1),i(2),i(3),i(4)})),
        s("for", fmt("for {} in range({}):\n\t{}", {i(1),i(2),i(3)})),
        s("while", fmt("while ({}):\n\t{}", {i(1),i(2)})),
        s("if", fmt("if ({}):\n\t{}", {i(1),i(2)})),
        s("elif", fmt("elif ({}):\n\t{}", {i(1),i(2)})),
        s("else", fmt("else:\n\t{}", {i(1)})),
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
    }, {
        key = "python",
    })


 -- \begin{columns}
--\column{.5\textwidth}

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


vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
-- shorcut to source luasnip file again, which reload my snipptes
vim.keymap.set("n", "<space><space>s", "<cmd>source ~/.config/nvim/lua/plugin_luasnip.lua<CR>")
