local vim = vim
local ls  = require("luasnip")

-- some shorthands...
local s            = ls.snippet
local sn           = ls.snippet_node
local t            = ls.text_node
local i            = ls.insert_node
local f            = ls.function_node
local c            = ls.choice_node
local d            = ls.dynamic_node
local r            = ls.restore_node
local l            = require("luasnip.extras").lambda
local rep          = require("luasnip.extras").rep
local p            = require("luasnip.extras").partial
local m            = require("luasnip.extras").match
local n            = require("luasnip.extras").nonempty
local dl           = require("luasnip.extras").dynamic_lambda
local fmt          = require("luasnip.extras.fmt").fmt
local fmta         = require("luasnip.extras.fmt").fmta
local types        = require("luasnip.util.types")
local conds        = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.setup({
  history              = true,
  update_events        = "TextChanged,TextChangedI",
  delete_check_events  = "TextChanged",
  ext_base_prio        = 300,
  ext_prio_increase    = 1,
  enable_autosnippets  = true,
  store_selection_keys = "<Tab>",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
  ft_func = function()
    return vim.split(vim.bo.filetype, ".", true)
  end,
})

-- ---------------------------
-- L3MON4D3/LuaSnip setup
-- ---------------------------
-- see DOC.md/LUA SNIPPETS LOADER for some details.
require("luasnip.loaders.from_lua").lazy_load({ include = { "all", "c", "cpp"} })
require("luasnip.loaders.from_vscode").load()

ls.filetype_extend(
    'ts',
    {
      'vue.vue',
      'vue.style',
      'vue.script',
      'vue.nuxt-script',
      'vue.nuxt-html',
      'vue.html',
    }
  )

vim.keymap.set({"i"},      "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
