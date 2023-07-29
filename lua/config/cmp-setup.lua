local cmp     = require('cmp')
local lspkind = require('lspkind')
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    {name = 'luasnip',  keyword_length = 1},
    {name = 'nvim_lsp', keyword_length = 2},
    {name = 'buffer',   keyword_length = 3},
    {name = 'path'},
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      preset = 'codicons',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  },
  -- ... Your other configuration ...
  mapping = {
    -- ... Your other mappings ...
    ["<Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ['<C-b>'    ] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'    ] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'    ] = cmp.mapping.abort(),
    ['<CR>'     ] = cmp.mapping.confirm({ select = true }),
    -- ... Your other mappings ...
  },
  -- ... Your other configuration ...
})

if cmp.visible() then
  cmp.select_next_item()
end

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
