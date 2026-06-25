require("gruvbox").setup({
    overrides = {
        ["@lsp.type.parameter"] = { fg = "#8ec07c"}, -- bright_aqua
        ["@lsp.type.namespace"] = { fg = "#fe8019" },
    }
})

local function update_hl(name, overrides)
  local ok, existing = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if not ok then
    existing = {}
  end
  for k, v in pairs(overrides) do
    existing[k] = v
  end
  vim.api.nvim_set_hl(0, name, existing)
end

vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "cFormat", {link="@string.special"})
update_hl("Special",        { bold = false, italic = false, underline = false })
update_hl("StatusLine",     { bold = true })
update_hl("StatusLineNC",   { bold = true })
update_hl("EndOfBuffer",    { bg = "None", ctermbg = "None" })
update_hl("Normal",         { bg = "None", ctermbg = "None" })
update_hl("MsgArea",        { bg = "None", ctermbg = "None" })
update_hl("ModeMsg",        { bg = "None", ctermbg = "None" })
update_hl("NormalNC",       { bg = "None", ctermbg = "None" })
update_hl("Comment",        { bold = false, italic = false, underline = false })
update_hl("@comment",       { bold = false, italic = false, underline = false })
update_hl("MatchParen",     { bold = false, italic = false, underline = false })
update_hl("String",         { italic = false})
update_hl("SignColumn",     { bg = "None", ctermbg="None"})

vim.api.nvim_set_hl(0, "SignColumn",     {fg= '#ebdbb2', bg='#202020'})

vim.api.nvim_set_hl(0, "CodeDiffStatusAdded",       { fg = '#b8bb26' })
vim.api.nvim_set_hl(0, "CodeDiffStatusUnTracked",   { fg = '#b8bb26' })
vim.api.nvim_set_hl(0, "CodeDiffStatusDeleted",     { fg = '#fb4934' })

vim.api.nvim_set_hl(0, "GitSignsAddPreview",        { fg = '#002800' })
vim.api.nvim_set_hl(0, "GitSignsDeletePreview",     { fg = '#3f0001' })
vim.api.nvim_set_hl(0, "GitSignsDeleteVirtLn",      { fg = '#3f0001' })
vim.api.nvim_set_hl(0, "GitSignsAddInline",         { fg = '#006000' })
vim.api.nvim_set_hl(0, "GitSignsDeleteInline",      { fg = '#901011' })
vim.api.nvim_set_hl(0, "GitSignsChangeInline",      { fg = '#006000' })
