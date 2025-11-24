require("gruvbox").setup({
    overrides = {
        ["@lsp.type.parameter"] = { fg = "#8ec07c"}, -- bright_aqua
        ["markdownItalic"] = {fg = "#f2e5bc" },
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

vim.cmd("colo gruvbox")
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
update_hl("CursorLine",     { bg = "None" })
update_hl("CursorLineNr",   { bg = "None" })
update_hl("MatchParen",     { bold = false, italic = false, underline = false })
-- vim.api.nvim_set_hl("String", { link = "GruvboxYellow", priority=150})
