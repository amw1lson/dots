local nnoremap = require("plxg.keymap").nnoremap
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup()
require("mason-lspconfig").setup()

vim.diagnostic.config {
    underline = false
}

local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
    end,
    root_dir = function() return vim.fn.getcwd() end
}


lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

-- Setup lspconfig.


lspconfig.clangd.setup {
    cmd = { "/opt/clangd_18.1.3/bin/clangd" },
    on_attach = function(client, bufnr)
        -- client.server_capabilities.semanticTokensProvider = vim.NIL
        nnoremap("<C-h>", ":ClangdSwitchSourceHeader<CR>")
    end,
    capabilities = capabilities
}

lspconfig.texlab.setup{
    on_attach = lsp_defaults.on_attach,
    capabilities = lsp_defaults.capabilities,
    settings = {
          texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              executable = "latexmk",
              forwardSearchAfter = false,
              onSave = true
            },
            chktex = {
              onEdit = false,
              onOpenAndSave = false
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
              args = {}
            },
            latexFormatter = "latexindent",
            latexindent = {
              modifyLineBreaks = false
            }
          }
    }
}

lspconfig.pyright.setup {
    on_attach = lsp_defaults.on_attach,
    capabilities = lsp_defaults.capabilities
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    -- local path = client.workspace_folders[1].name
    -- if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
    --   client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
    --     Lua = {
    --       runtime = {
    --         -- Tell the language server which version of Lua you're using
    --         -- (most likely LuaJIT in the case of Neovim)
    --         version = 'LuaJIT'
    --       },
    --       -- Make the server aware of Neovim runtime files
    --       workspace = {
    --         checkThirdParty = false,
    --         library = {
    --           vim.env.VIMRUNTIME
    --         }
    --         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
    --         -- library = vim.api.nvim_get_runtime_file("", true)
    --       }
    --     }
    --   })
    -- end
    return true
  end
}
