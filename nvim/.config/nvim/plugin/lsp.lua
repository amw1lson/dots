-- Setup nvim-cmp.
local cmp = require 'cmp'

vim.diagnostic.config {
    underline = false
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
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
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'nvim_lua', keyword_length = 3 },
        { name = 'buffer' },
        { name = 'ultisnips' }, -- For ultisnips users.
    })
})

local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
        --vim.api.nvim_command('set updatetime=100')
        --vim.api.nvim_command('autocmd CursorHold * :lua vim.lsp.buf.hover({focusable = false})')
        vim.api.nvim_command('autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync()')
    end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.sumneko_lua.setup({
    on_attach = lsp_defaults.on_attach,
    capabilities = capabilities
})

lspconfig.clangd.setup {
    on_attach = lsp_defaults.on_attach,
    capabilities = capabilities
}

lspconfig.asm_lsp.setup {
}

lspconfig.arduino_language_server.setup {
    cmd = {
        "arduino-language-server",
        "-cli-config", "/home/austin/.arduino15/arduino-cli.yaml",
        "-fqbn", "esp32:esp32:heltec_wifi_kit_32",
        "-cli", "/usr/bin/arduino-cli",
        "-clangd", "/usr/bin/clangd"
    }
}

lspconfig.texlab.setup {
}

lspconfig.pyright.setup {
}

lspconfig.tsserver.setup {
}

lspconfig.ocamllsp.setup {
}

lspconfig.hls.setup {
}

require 'colorizer'.setup()
