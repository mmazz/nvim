
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local configs = require'nvim-treesitter.configs'
    configs.setup {
        ensure_installed =  { "c", "cpp",  "bash", "lua", "rust", "python" }, -- Only use parsers that are maintained
        sync_install = false,
        highlight = { -- enable highlighting
         enable = true,
        },
        indent = {
          enable = true, -- default is disabled anyways
       }
}
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
    "ltex", -- for latex and markdown
--    "pylsp", -- for python
    "pyright",
    "sumneko_lua" -- for lua
}

-- install the LS
for _, server in ipairs(servers) do install_server(server) end
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


--lspconfig.ltex.setup{}

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


