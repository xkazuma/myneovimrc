local cmp     = require('cmp')
local compare = cmp.config.compare
local lspkind = require('lspkind')
local luasnip = require("luasnip")
local neogen  = require("neogen")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  window = {
    completion    = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'nvim_lsp', keyword_length = 2, priority = 40},
    { name = 'luasnip',  keyword_length = 2, priority = 30},
    { name = 'buffer',   keyword_length = 3, priority = 20},
    { name = 'path',     keyword_length = 1, priority = 10},
    { name = 'calc',     keyword_length = 5, priority = 10},
    { name = 'git',      keyword_length = 2, priority = 10},
  },
  sorting = {
    priority_weight = 1.0,
    comparators = {
      compare.score,
      compare.recently_used,
      compare.locality
    }
  },
  formatting = {
    format = lspkind.cmp_format({
      mode              = 'text_symbol',
      maxwidth          = 50,
      ellipsis_char     = '…',
      show_labelDetails = true,
    }),
  },
  -- ... Your other configuration ...
  mapping = {
    -- ... Your other mappings ...
    ["<Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      elseif neogen.jumpable() then
        neogen.jump_next()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif neogen.jumpable(-1) then
        neogen.jump_prev()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ['<C-b>']     = cmp.mapping.scroll_docs(-4),
    ['<C-f>']     = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>']     = cmp.mapping.abort(),
    ['<CR>']      = cmp.mapping.confirm({ select = true }),
    -- ... Your other mappings ...
  },
  -- ... Your other configuration ...
})

if cmp.visible() then
  cmp.select_next_item()
end

-- --------------------
-- hrsh7th/cmp-cmdline setup
-- --------------------
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {
      { name = 'path' }
    }, 
    {
      {
        name           = 'cmdline',
        keyword_length = 2,
        option = {
          ignore_cmds = {
            'Man', '!',
          },
        },
      }
    })
  })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- --------------------
-- petertriho/cmp-git setup
-- --------------------
local cmp_git = require('cmp_git')
local format  = require('cmp_git.format')
local sort    = require('cmp_git.sort')
cmp_git.setup({
  -- defaults
  filetypes = { "gitcommit", "octo" },
  remotes = { "upstream", "origin" },
  enableRemoteUrlRewrites = false,
  git = {
    commits = {
      limit = 100,
      sort_by = sort.git.commits,
      format = format.git.commits,
    },
  },
  github = {
    hosts = {},
    issues = {
      fields = { "title", "number", "body", "updatedAt", "state" },
      filter = "all",
      limit = 100,
      state = "open",
      sort_by = sort.github.issues,
      format = format.github.issues,
    },
    mentions = {
      limit = 100,
      sort_by = sort.github.mentions,
      format = format.github.mentions,
    },
    pull_requests = {
      fields = { "title", "number", "body", "updatedAt", "state" },
      limit = 100,
      state = "open",
      sort_by = sort.github.pull_requests,
      format = format.github.pull_requests,
    },
  },
  gitlab = {
    hosts = {},
    issues = {
      limit = 100,
      state = "opened",
      sort_by = sort.gitlab.issues,
      format = format.gitlab.issues,
    },
    mentions = {
      limit = 100,
      sort_by = sort.gitlab.mentions,
      format = format.gitlab.mentions,
    },
    merge_requests = {
      limit = 100,
      state = "opened",
      sort_by = sort.gitlab.merge_requests,
      format = format.gitlab.merge_requests,
    },
  },
  trigger_actions = {
    {
      debug_name = "git_commits",
      trigger_character = ":",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.git:get_commits(callback, params, trigger_char)
      end,
    },
    {
      debug_name = "gitlab_issues",
      trigger_character = "#",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.gitlab:get_issues(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "gitlab_mentions",
      trigger_character = "@",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.gitlab:get_mentions(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "gitlab_mrs",
      trigger_character = "!",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.gitlab:get_merge_requests(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "github_issues_and_pr",
      trigger_character = "#",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.github:get_issues_and_prs(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "github_mentions",
      trigger_character = "@",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.github:get_mentions(callback, git_info, trigger_char)
      end,
    },
  },
})
