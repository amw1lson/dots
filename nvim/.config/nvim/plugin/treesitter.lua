require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true
  },
}
-- vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
