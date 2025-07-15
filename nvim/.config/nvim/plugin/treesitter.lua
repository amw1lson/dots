require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "lua", "vim", "python" },
  rainbow = {
      enable = true,
  },
  sync_install = false,
  auto_install = true,
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
    disable = false,
    additional_vim_regex_highlighting = true
  },
}
