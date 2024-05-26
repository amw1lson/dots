local cmp = require('cmp')


local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 22
local MIN_LABEL_WIDTH = 22

local lspkind = require("lspkind")
lspkind.init({})
cmp.setup({
    formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 22, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                     -- can also be a function to dynamically calculate max width such as 
                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        local label = vim_item.abbr
        local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
        if truncated_label ~= label then
          vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
        elseif string.len(label) < MIN_LABEL_WIDTH then
          local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
          vim_item.abbr = label .. padding
        end
        return vim_item
      end,
    })
      -- format = function(entry, vim_item)
      --   local label = vim_item.abbr
      --   local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
      --   if truncated_label ~= label then
      --     vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
      --   elseif string.len(label) < MIN_LABEL_WIDTH then
      --     local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
      --     vim_item.abbr = label .. padding
      --   end
      --   return vim_item
      -- end,
    },
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-c>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        -- Dont suggest Text from nvm_lsp
        { name = "nvim_lsp",
            entry_filter = function(entry, _)
                return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
            end, keyword_length = 2},
        { name = 'nvim_lua', keyword_length = 2 },
        { name = 'path', keyword_length = 2 },
        { name = 'luasnip', keyword_length = 2 },
    })
})
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
