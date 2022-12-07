local nnoremap = require("plxg.keymap").nnoremap
-- Setup nvim-cmp.
local cmp = require 'cmp'

vim.diagnostic.config {
    underline = false
}

require("mason").setup()
require("mason-lspconfig").setup()
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
        --{ name = 'buffer' },
        { name = 'ultisnips' }, -- For ultisnips users.
    })
})

local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
        --vim.api.nvim_command('set updatetime=100')
        --vim.api.nvim_command('autocmd CursorHold * :lua vim.lsp.buf.hover({focusable = false})')
        vim.api.nvim_command('autocmd BufWritePre * :lua vim.lsp.buf.format()')
    end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.sumneko_lua.setup({
    on_attach = lsp_defaults.on_attach,
    capabilities = capabilities
})

lspconfig.clangd.setup {
    on_attach = function()
        nnoremap("<C-h>", ":ClangdSwitchSourceHeader<CR>")
    end,
    capabilities = capabilities
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
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities
}

lspconfig.pyright.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities
}

lspconfig.tsserver.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}

lspconfig.ocamllsp.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}

lspconfig.hls.setup {
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}
lspconfig.asm_lsp.setup {
    cmd = { "asm-lsp" },
    filetypes = { "asm", "vmasm" },
    on_attach = lsp_defaults.attach,
    capabilities = lsp_defaults.capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end
}

require 'colorizer'.setup()

-- DAP
require("nvim-dap-virtual-text").setup()
require("dapui").setup()
nnoremap("<leader>dc", function() require 'dap'.continue() end)
nnoremap("<leader>dn", function() require 'dap'.step_over() end)
nnoremap("<leader>ds", function() require 'dap'.step_into() end)
nnoremap("<F12>", function() require 'dap'.step_out() end)
nnoremap("<Leader>b", function() require 'dap'.toggle_breakpoint() end)
nnoremap("<Leader>B", function() require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
nnoremap("<Leader>dp", function() require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
nnoremap("<Leader>dr", function() require 'dap'.repl.open() end)
nnoremap("<Leader>dl", function() require 'dap'._last() end)
nnoremap("<Leader>do", function() require 'dapui'.open() end)
nnoremap("<Leader>dbc", function() require 'dapui'.close() end)
require("dap-go").setup()

local dap = require("dap")
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/austin/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
