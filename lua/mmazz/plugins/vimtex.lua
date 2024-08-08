return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.g['vimtex_view_method'] = 'zathura_simple' -- for variant without xdotool to avoid errors in wayland
    vim.g['vimtex_quickfix_mode'] = 0              -- suppress error reporting on save and build
    vim.g['vimtex_mappings_enabled'] = 0           -- Ignore mappings
    vim.g['vimtex_indent_enabled'] = 0             -- Auto Indent
    vim.g['tex_flavor'] = 'latex'                  -- how to read tex files
    vim.g['tex_indent_items'] = 0                  -- turn off enumerate indent
    vim.g['tex_indent_brace'] = 0                  -- turn off brace indent
    vim.g['vimtex_context_pdf_viewer'] = 'zathura'  -- external PDF viewer run from vimtex menu command
    vim.g['vimtex_log_ignore'] = ({                -- Error suppression:
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    })
  end,
  vim.keymap.set("n", "<leader>b", "<cmd>VimtexCompile<CR>"),
  vim.keymap.set("n", "<leader>i", "<cmd>VimtexTocOpen<CR>"),
  vim.keymap.set("n", "<leader>v", "<cmd>VimtexView<CR>")
}

--      b = { "<cmd>VimtexCompile<CR>", "build" },
--      c = { "<cmd>vert sb<CR>", "create split" },
--      i = { "<cmd>VimtexTocOpen<CR>", "index" },
--      v = { "<cmd>VimtexView<CR>", "view" },
--      z = { "<cmd>ZenMode<CR>", "zen" },
