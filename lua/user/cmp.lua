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


