vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.cmd([[
au BufWinLeave *.tex VimtexStop
au BufWinLeave *.tex VimtexClean
]])

local function set_markdown_wrap()
  vim.wo.wrap = true
  vim.wo.linebreak = true
  vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
  vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
  vim.api.nvim_set_keymap('n', '0', 'g0', { noremap = true })
  vim.api.nvim_set_keymap('n', '^', 'g^', { noremap = true })
  vim.api.nvim_set_keymap('n', '$', 'g$', { noremap = true })
  vim.api.nvim_set_keymap('n', 'A', 'g$a', { noremap = true })
  vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true })
  vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true })
  vim.api.nvim_set_keymap('v', '0', 'g0', { noremap = true })
  vim.api.nvim_set_keymap('v', '^', 'g^', { noremap = true })
  vim.api.nvim_set_keymap('v', '$', 'g$', { noremap = true })
end

local function reset_normal_keys()
  vim.wo.wrap = false
  vim.wo.linebreak = false
  vim.api.nvim_del_keymap('n', 'j')
  vim.api.nvim_del_keymap('n', 'k')
  vim.api.nvim_del_keymap('n', '0')
  vim.api.nvim_del_keymap('n', '^')
  vim.api.nvim_del_keymap('n', '$')
  vim.api.nvim_del_keymap('v', 'j')
  vim.api.nvim_del_keymap('v', 'k')
  vim.api.nvim_del_keymap('v', '0')
  vim.api.nvim_del_keymap('v', '^')
  vim.api.nvim_del_keymap('v', '$')
end

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = {'*.md', '*.tex'},
  callback = set_markdown_wrap,
})

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = {'*.md', '*.tex'},
  callback = reset_normal_keys,
})
