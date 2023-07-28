local cmp     = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 1},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      preset = 'codicons',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'    ] = cmp.mapping.select_next_item(),
    ['<S-Tab>'  ] = cmp.mapping.select_prev_item(),
    ['<C-b>'    ] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'    ] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'    ] = cmp.mapping.abort(),
    ['<CR>'     ] = cmp.mapping.confirm({ select = true }),
  })
})

 cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
     { name = 'path' }
   }, {
     { name = 'cmdline', keyword_length = 2 }
   })
 })

 -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
     { name = 'buffer' }
   }
 })

 cmp.setup.filetype('gitcommit', {
   sources = cmp.config.sources({
     { name = 'git' }, 
   }, {
     { name = 'buffer' },
   })
 })
