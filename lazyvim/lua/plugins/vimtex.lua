return {
  {
    "lervag/vimtex",
    -- default settings
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "tex", "sty", "bib" },
        callback = function()
          vim.wo.conceallevel = 2
        end,
      })
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

      -- added settings
      vim.vimtex_view_general_viewer = "qpdfview"
      vim.vimtex_compiler_method = "latexmk"
    end,
  },
}
