----vim.api.nvim_set_var('conceallevel', '2')
--vim.g['tex_conceal'] = 'abdgm'
--vim.g['tex_superscripts']= '[0-9a-zA-W.,:;+-<>/()=]'
--vim.g['tex_subscripts']= '[0-9aehijklmnoprstuvx,+-/().]'
--
--vim.cmd([[
--set conceallevel=2
--syntax match texMathSymbol /\\bra{\%([^}]*}\)\@=/ conceal cchar=<
--syntax match texMathSymbol /\%(\\bra{[^}]*\)\@<=}/ conceal cchar=|
--syntax match texMathSymbol /\\ket{\%([^}]*}\)\@=/ conceal cchar=|
--syntax match texMathSymbol /\%(\\ket{[^}]*\)\@<=}/ conceal cchar=>
--syntax match texMathSymbol /\\braket{\%([^}]*}\)\@=/ conceal cchar=<
--syntax match texMathSymbol /\%(\\braket{[^}]*\)\@<=}/ conceal cchar=>
--]])
local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = true }

local group = augroup("Tex Snippets", { clear = true })

local file_pattern = "*.tex"

local rec_ls
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

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- todo
-- non enumerate equations option
cs({trig="(%w)_(%d)", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "$"..snip.captures[1].."_{".. snip.captures[2].."}$"
    end),
})

cs({trig="(%w)_(%d%d)", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "$"..snip.captures[1].."_{".. snip.captures[2].."}$"
    end),
})
cs({trig="(%w)_(%w)", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "$"..snip.captures[1].."_{".. snip.captures[2].."}$"
    end),
})
cs({trig="(%w)_(%w%w)", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "$"..snip.captures[1].."_{".. snip.captures[2].."}$"
    end),
})

cs({trig="sqrt(%w)", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "$"..snip.captures[1].."^{2}$"
    end),
})
cs({trig="cube(%w)", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "$"..snip.captures[1].."^{3}$"
    end),
})
cs({trig="pow(%w)", regTrig=true, hidden=true},{
    f(function(arg, snip)
    return "$"..snip.captures[1].."^{"..arg[1][1].."}$"
    end),
})
cs("im", fmt("${}$",{i(1)}))
cs("dm", fmt("\\[\n{}\n.\\]",{i(1)}))
cs("begin", fmt("\\begin{{{}}}\n \t{}\n\\end{{{}}}", {i(1), i(2), rep(1)}))
cs("align", fmt("\\begin{{align}}\n \t{}\n\\end{{align}}", {i(1)}))
cs("align*", fmt("\\begin{{align*}}\n \t{}\n\\end{{align*}}", {i(1)}))
cs("equation", fmt("\\begin{{equation}}\n \t{}\n\\end{{equation}}", {i(1)}))
cs("equation*", fmt("\\begin{{equation*}}\n \t{}\n\\end{{equation*}}", {i(1)}))
cs("enumerate", {	t({"\\begin{enumerate}",	"\t\\item "}), i(1), d(2, rec_ls, {}),	t({"", "\\end{enumerate}"}), i(0)})
cs("fig", fmt([[
\begin{{figure}}[h!]
    \centering
    \includegraphics[scale={}]{{{}}}
    \caption{{{}}}
    \label{{fig:{}}}
\end{{figure}}]],
    { i(1), i(2), i(3), rep(2)}))
cs("fig*", fmt([[
\begin{{figure}}[h!]
    \centering
    \includegraphics[scale={}]{{{}}}
\end{{figure}}]],
    { i(1), i(2)}))

--cs("2fig*", fmt([[
--\begin{{figure}}[h!]
--    \centering
--    \includegraphics[scale={}]{{{}}}{}
--\end{{figure}}]],
--    { i(1), i(2), c(3,{sn(1, {t("\\caption{{"),i(1),t("}}")}),t("")}  )}))
--
cs("columns", fmt([[
\begin{{columns}}
    \column{{0.{}\textwidth}}
        {}
    \column{{0.{}\textwidth}}
        {}
\end{{columns}}]],
    {i(1,"5"), i(2),i(3,"5"),i(4)}))

cs("md", fmt( "\\begin{{mdframed}}[backgroundcolor=frenchblue!20]\n\t{}\n\\end{{mdframed}}", { i(1)}))
cs("item", {	t({"\\begin{itemize}",	"\t\\item "}),
    i(1), d(2, rec_ls, {}),
    t({"", "\\end{itemize}"}), i(0)})

--s("\caption{{{}}}\n\label{{fig:{}}}",i(3), rep(2))
cs("//", fmt("\\frac{{{}}}{{{}}}", {i(1), i(2)}))
cs("bf", fmt("\\textbf{{{}}}", {i(1)}))
cs("it", fmt("\\textit{{{}}}", {i(1)}))
cs("tt", fmt("\\texttt{{{}}}", {i(1)}))
cs("frame", fmt("\\begin{{frame}}\n\\frametitle{{{}}}\n\t{}\n\\end{{frame}}", {i(1), i(2)}))

cs("date", f(function()
              return os.date "%D"
            end))

--cs({trig="(%w)hat", regTrig=true, hidden=true},{
--    f(function(_, snip)
--    return "\hat{"..snip.captures[1].."}"
--    end),
--})
--cs({trig="(%w)bar", regTrig=true, hidden=true},{
--    f(function(_, snip)
--    return "\overline{"..snip.captures[1].."}"
--    end),
--})
cs("000", t("\\infty"))
--cs("sum", fmt("\\sum_{}^{}", {i(1,"n=0" ), i(2,"\infty")})
return snippets, autosnippets

