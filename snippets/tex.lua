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


cs("beg", fmt("\\begin{{{}}}\n \t{}\n\\end{{{}}}", {i(1), i(2), rep(1)}))
cs("spli", fmt("\\begin{{split}}\n \t{}&{} \\\\ \n\t&{}\n\\end{{split}}", {i(1), i(2),i(3)}))


cs("align", fmt("\\begin{{{}}}\n \t{}\n\\end{{{}}}", {c(1, {t("align"), t("align*")}),i(2), rep(1)}))
cs("equa", fmt("\\begin{{{}}}\n \t{}\n\\end{{{}}}", {c(1, {t("equation"), t("equation*")}),i(2), rep(1)}))

cs("enum", {	t({"\\begin{enumerate}",	"\t\\item "}), i(1), d(2, rec_ls, {}),	t({"", "\\end{enumerate}"}), i(0)})


-- TODO: Sacar el espacio vacio si es que quiero el choice sin caption?
cs("fig", fmt([[
\begin{{figure}}[h!]
    \centering
    \includegraphics[scale={}]{{{}}}
    {}
\end{{figure}}]],
    { i(1), i(2), c(3,{i(3), fmt("\n\\caption{{{}}}\n\t\\label{{fig:{}}}", {i(1), i(2)})})}))
local columnWidth = function(index)
    return f(function(arg)
        return tostring(100-tonumber(arg[1][1]))
    end, {index})
end
-- TODO, al poner el primer numero se deja de actualizar el siguiente y medio que se rompe
cs("colu", fmt([[
\begin{{columns}}
    \column{{0.{}\textwidth}}
        {}
    \column{{0.{}\textwidth}}
        {}
\end{{columns}}]],
    {i(1,"5"), i(2), columnWidth(1), i(3)}))

cs("md", fmt( "\\begin{{mdframed}}[backgroundcolor={}!20]\n\t{}\n\\end{{mdframed}}", { c(1, {t("frenchblue"),i(1)}), i(2)}))
cs("item", {	t({"\\begin{itemize}",	"\t\\item "}),
    i(1), d(2, rec_ls, {}),
    t({"", "\\end{itemize}"}), i(0)})


--math mode
cs("mm", fmt("${}$",{i(1)}))
cs("dm", fmt("\\[\n{}\n.\\]",{i(1)}))
-- todo
-- non enumerate equations option
--
--
-- TODO: poner los que tienen doble argumento en uno solo
cs({trig="(%w)_(%d)", regTrig=true, hidden=true},{
    c(1,{
        f(function(_, snip)
            return "$"..snip.captures[1].."_{".. snip.captures[2].."}$"
        end),
        f(function(_, snip)
            return snip.captures[1].."_{".. snip.captures[2].."}"
        end),} ),
})
cs({trig="(%w)_(%d%d)", regTrig=true, hidden=true},{
    c(1,{
        f(function(_, snip)
            return "$"..snip.captures[1].."_{".. snip.captures[2].."}$"
        end),
        f(function(_, snip)
            return snip.captures[1].."_{".. snip.captures[2].."}"
        end),} ),
})
cs({trig="(%w)_(%w)", regTrig=true, hidden=true},{
    c(1,{
        f(function(_, snip)
            return "$"..snip.captures[1].."_{".. snip.captures[2].."}$"
        end),
        f(function(_, snip)
            return snip.captures[1].."_{".. snip.captures[2].."}"
        end),} ),
})

cs({trig="(%w)_(%w%w)", regTrig=true, hidden=true},{
    c(1,{
        f(function(_, snip)
            return "$"..snip.captures[1].."_{".. snip.captures[2].."}$"
        end),
        f(function(_, snip)
            return snip.captures[1].."_{".. snip.captures[2].."}"
        end),} ),
})



cs({trig="sqrt(%w)", regTrig=true, hidden=true},{
    c(1,{
        f(function(_, snip)
            return "$"..snip.captures[1].."^{2}$"
        end),
        f(function(_, snip)
            return snip.captures[1].."^{2}"
        end),} ),
})
cs({trig="cube(%w)", regTrig=true, hidden=true},{
    c(1,{
        f(function(_, snip)
            return "$"..snip.captures[1].."^{3}$"
        end),
        f(function(_, snip)
            return snip.captures[1].."^{3}"
        end),} ),
})

cs({trig="pow(%w)(%d)", regTrig=true, hidden=true},{
    c(1,{
        f(function(_, snip)
            return "$"..snip.captures[1].."^{"..snip.captures[2].."}$"
        end),
        f(function(_, snip)
            return snip.captures[1].."^{"..snip.captures[2].."}"
        end),} ),
})

cs("frame", fmt("\\begin{{frame}}\n\\frametitle{{{}}}\n\t{}\n\\end{{frame}}", {i(1), i(2)}))
cs("frac", fmt("\\frac{{{}}}{{{}}}", {i(1), i(2)}))
cs("bf", fmt("\\textbf{{{}}}", {i(1)}))
cs("it", fmt("\\textit{{{}}}", {i(1)}))
cs("tt", fmt("\\texttt{{{}}}", {i(1)}))

cs("(", fmt("\\left({}\\right)", {i(1)}))
cs("[", fmt("\\left[{}\\right]", {i(1)}))

cs("date", f(function()
              return os.date "%D"
            end))



cs("inf", t("\\infty"))



cs("int", fmt("\\int{}^{}", {i(1,"0" ), i(2,"\\infty")}))
cs("sum", fmt("\\sum_{}^{}", {i(1,"0" ), i(2,"\\infty")}))
cs("lim", fmt("\\lim_{{{} \\to {}}}", {i(1,"0" ), i(2,"\\infty")}))


cs({trig="(%w)hat", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "\\hat{"..snip.captures[1].."}"
    end),
})
cs({trig="(%w)bar", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "\\bar{"..snip.captures[1].."}"
    end),
})
cs({trig="(%w)over", regTrig=true, hidden=true},{
    f(function(_, snip)
    return "\\overline{"..snip.captures[1].."}"
    end),
})


cs("bra", fmt("\\bra{}", {i(1)}))
cs("ket", fmt("\\ket{}", {i(1)}))
cs("braket", fmt("\\braket{}", {i(1)}))
return snippets, autosnippets

