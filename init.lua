require('keybindings')
require('packages')
require('config')
require('plugin_luasnip')
require'colorizer'.setup()
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local configs = require'nvim-treesitter.configs'
    configs.setup {
        ensure_installed =  { "c", "cpp", "latex", "bash", "lua", "rust", "python" }, -- Only use parsers that are maintained
        sync_install = false,
        highlight = { -- enable highlighting
         enable = true,
        },
        indent = {
          enable = true, -- default is disabled anyways
       }
}
--
--
require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use', 'require' }
            }
        }
    }
}

---------------------------------------------------

---------------------------------------------------
local function install_server(server)
    local lsp_installer_servers = require 'nvim-lsp-installer.servers'
    local ok, server_analyzer = lsp_installer_servers.get_server(server)
    if ok then
        if not server_analyzer:is_installed() then
            server_analyzer:install(server)
        end
    end
end
---------------------------------------------------

---------------------------------------------------
local servers = {
 --   "jsonls", -- for jsonl
    "clang",
    "texlab", -- for latex
--    "pylsp", -- for python
    "pyright",
    "sumneko_lua" -- for lua
}

-- install the LS
for _, server in ipairs(servers) do install_server(server) end
--
--
local cmp = require'cmp'
  cmp.setup({
    snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
     -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
     -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
     -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<CR>'] = cmp.mapping.confirm ({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }),
    },
    sources = cmp.config.sources({
    { name = 'luasnip' }, -- For luasnip users.
      { name = 'nvim_lsp' },
    { omni = {filetypes = {'tex'}}}, -- for vimtex?
    }, {
      { name = 'buffer', keyword_length = 4 },
     { name = 'path' }
    })
  ,
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- tj lo borro
--  cmp.setup.cmdline('/', {
--    sources = {
--      { name = 'buffer' }
--    }
--  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- tj lo borro
--  cmp.setup.cmdline(':', {
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })
--
require('telescope').setup{}
--
require'lualine'.setup({
  options = {
    icons_enabled = true,
    theme = onedark,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_diagnostic'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}

})
--
-- npm i -g pyright -- fix
lspconfig.pyright.setup{
    capabilities = capabilities,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    --root_dir = pyright.root_pattern(".git", "setup.py",  "requirements.txt");
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        --on_attach(client)
    end,
 --   before_init = function(_, config)
 --       local p
 --       if vim.env.VIRTUAL_ENV then
 --           p = lsp_util.path.join(vim.env.VIRTUAL_ENV, "bin", "python3")
 --       else
 --           p = utils.find_cmd("python3", ".venv/bin", config.root_dir)
 --       end
 --       config.settings.python.pythonPath = p
 --   end,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        disableOrganizeImports = true,
        python = {
            analysis = {
                autoSearchPaths = true, -- true?
                diagnosticMode = "workspace", -- openFilesOnly ?
                useLibraryCodeForTypes = true, -- true?
                typeCheckingMode = "off"
            },
        },
    },
    single_file_support = true
}




lspconfig.texlab.setup{
    capabilities = capabilities,
	cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    settings = {
          bibtex = {
            formatting = {
              lineLength = 120
            }
          },
          latex = {
            build = {
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              executable = "latexmk",
              onSave = true,
              onChange = true
            },
            forwardSearch = {
              args = {},
              onSave = false
            },
            lint = {
              onChange = false,
              onSave = true
            }
      }
    },
    	single_file_support = true
}

vim.cmd( [[
augroup latex_au
    autocmd!
    autocmd BufNewFile,BufRead *.tex setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tr :-1read $HOME/.config/templates/resumen.tex<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tp :-1read $HOME/.config/templates/practicos.tex<CR>
    autocmd BufNewFile,BufRead *.tex nnoremap <leader>tc :-1read $HOME/.config/templates/chapter.tex<CR>
    autocmd BufWinLeave *.tex !texclear %
augroup END
]])

-- cada vez que hago resource re hace la funcion.
vim.cmd([[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]])

vim.cmd( [[
augroup mati
    " Borra el autocmd que pudo haberse corrido previamente. Si no se acumulan
    autocmd!
    " When a write in buffer (save) apply function trim
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
]])

vim.cmd( [[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]])
vim.cmd( [[
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
]])
vim.cmd( [[let g:vimtex_compiler_latexmk = {'build_dir' : 'build'}]])
vim.cmd( [[
autocmd TermOpen * setlocal nonu]])

vim.cmd( [[let g:python3_host_prog = '/usr/bin/python']])
vim.cmd( [[autocmd BufWritePost *bote-*.md silent !buildNote %:p ]])


