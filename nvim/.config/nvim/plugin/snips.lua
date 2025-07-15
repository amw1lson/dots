local luasnip = require("luasnip")


luasnip.config.set_config({ -- Setting LuaSnip config
  history = true,
  -- Enable autotriggered snippets
  enable_autosnippets = true,
  link_roots = false,
  keep_roots = false,
  link_children = false,
  exit_roots = true,
})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})

-- Unlink all snippets when leaving insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
  group = vim.api.nvim_create_augroup("UnlinkLuaSnipSnippetOnModeChange", {
    clear = true,
  }),
  pattern = { "s:n", "i:*" },
  desc = "Forget the current snippet when leaving the insert mode",
  callback = function(evt)
    while true do
      if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
        luasnip.unlink_current()
      else
        break
      end
    end
  end,
})

