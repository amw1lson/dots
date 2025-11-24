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
          maxwidth = 22,
          ellipsis_char = '...',
          show_labelDetails = true,
          before = function(_, vim_item)
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
    }),
    sources = cmp.config.sources({
        -- Dont suggest Text from nvm_lsp
        { name = "nvim_lsp",
            entry_filter = function(entry, _)
                return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
            end, keyword_length = 1},
        { name = 'nvim_lua', keyword_length = 1 },
        { name = 'path', keyword_length = 1 },
        { name = 'luasnip', keyword_length = 1 },
    })
})
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer', keyword_length = 3 }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
            { name = 'path', keyword_length = 2 }
        }, {
            { name = 'cmdline', keyword_length = 3 }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
