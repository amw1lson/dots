vim.opt.mouse = "a"
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.history = 1000

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'no'
vim.cmd("filetype plugin indent on")

vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }
vim.opt.clipboard:append('unnamedplus')

vim.keymap.set("n", "<Space>", "<Nop>")
vim.g.mapleader = ' '

vim.api.nvim_set_hl(0, "PopupNormal", { fg = "#ebdbb2", bg = "#202020", })

return require('lazy').setup({
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config['lua_ls'] = {
                settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("", true) } } },
            }
            vim.lsp.enable({ "lua_ls", "pyright", "clangd"})
            vim.diagnostic.config({
                signs = {
                    text  = {   [vim.diagnostic.severity.ERROR] = '', [vim.diagnostic.severity.WARN]  = '',
                        [vim.diagnostic.severity.INFO]  = '', [vim.diagnostic.severity.HINT]  = '', },
                    numhl = {
                        [vim.diagnostic.severity.ERROR] = 'DiagnosticVirtualLinesError',
                        [vim.diagnostic.severity.WARN]  = 'DiagnosticVirtualLinesWarn',
                        [vim.diagnostic.severity.INFO]  = 'DiagnosticVirtualLinesInfo',
                        [vim.diagnostic.severity.HINT]  = 'DiagnosticVirtualLinesHint',
                    },
                },
                underline = false,
                virtual_text = true,
            })
        end,
        keys = {
            { "K", function() vim.lsp.buf.hover() end },
            { "gi", function() vim.lsp.buf.implementation() end },
            { "gd", function() vim.lsp.buf.definition() end },
            { "<leader>r", function() vim.lsp.buf.rename() end },
        },
        lazy = false
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-context', opts = { max_lines = 5 }, },
        },
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                rainbow = {
                    enable = true,
                },
                indent = { enable = true },
                ensure_installed = { "cpp", "lua", "python" },
                highlight = {
                    enable = true,
                    disable = false,
                    additional_vim_regex_highlighting = true
                },
            }
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'onsails/lspkind.nvim',
            'hrsh7th/cmp-cmdline'
        }
    },
    --aesthetics
    { 'ellisonleao/gruvbox.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'HiPhish/rainbow-delimiters.nvim', lazy = false },
    {
        'echasnovski/mini.surround',
        version = false,
        opts = {
            custom_surroundings = {
                -- Make `)` insert parts with spaces. `input` pattern stays the same.
                ['{'] = { output = { left = '{', right = '}' } },
                ['B'] = { output = { left = '{', right = '}' } },
                ['a'] = { output = { left = '<', right = '>' } },
                ['<'] = { output = { left = '<', right = '>' } },
            },
        }
    },
    {
        'stevearc/oil.nvim',
        lazy = false,
        config = function()
            require'oil'.setup({
                skip_confirm_for_simple_edits = true,
                float = {
                    padding = 2,
                    max_width = math.floor(vim.o.columns * 0.65),
                    max_height = math.floor(vim.o.lines * 0.55),
                    border = "rounded",
                    win_options = { winhighlight = "Normal:PopupNormal,FloatBorder:Normal" }
                },
            })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "oil",
                callback = function()
                    vim.keymap.set("n", "<Esc>", function() require'oil'.close() end, { buffer = true })
                end,
            })
        end,
        keys = {
            {
                "<leader>o",
                function() require'oil'.toggle_float() end
            }
        },
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
    },
    {
        "kawre/neotab.nvim",
        event = "InsertEnter",
        opts = {
            pairs = { { open = "(", close = ")" }, { open = "[", close = "]" },
                { open = "{", close = "}" }, { open = "'", close = "'" },
                { open = '"', close = '"' }, { open = "`", close = "`" },
                { open = "<", close = ">" }, },
        }
    },
    {
        'leath-dub/snipe.nvim',
        keys = {
            {"<leader>s", function () require("snipe").open_buffer_menu() end}
        },
        config = function()
            require'snipe'.setup()
        end
    },
    {
        'ibhagwan/fzf-lua',
        opts = {
            keymap = { fzf = { ['ctrl-h'] = 'backward-kill-word', } },
            winopts = { preview = { default = 'bat' }, },
        },
        keys = {
            { "<leader>E", function() require'fzf-lua'.files() end },
            { "<leader>e", function() require'fzf-lua'.files({cwd = vim.fn.expand("%:p:h:h")}) end },
            { "<leader>fj", function() require'fzf-lua'.live_grep({cwd = vim.fn.expand("%:p:h:h")}) end },
            { "<leader>fb", function() require'fzf-lua'.buffers() end},
            { "<leader>fk", function() require'fzf-lua'.git_files() end},
            {
                "<leader>d",
                function()
                    require('fzf-lua').fzf_exec(
                        "fd . ~ --type d --exclude .git",
                        {
                            prompt = 'dirs> ',
                            actions = {
                                ['default'] = function(selected)
                                    local path = selected[1]
                                    require'fzf-lua'.files({cwd = path})
                                end,
                            }
                        }
                    )
                end
            },
        }
    },
})
