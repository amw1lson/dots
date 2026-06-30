vim.opt.mouse = "a"
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.ambiwidth = "single"

vim.opt.swapfile = false
vim.opt.history = 1000

vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

vim.opt.shiftwidth = 8
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.cmd("filetype plugin indent on")

vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }
vim.opt.clipboard:append('unnamedplus')

vim.keymap.set("n", "<Space>", "<Nop>")
vim.g.mapleader = ' '

return require('lazy').setup({
    {
        'lewis6991/gitsigns.nvim',
        lazy=false,
        opts={
            signcolumn=true,
            signs_staged_enable=true,
            attach_to_untracked=true,
        },
        keys={
            { "<leader>dj", function() require('gitsigns').diffthis() end, },
            { "<leader>p",  function() require('gitsigns').preview_hunk_inline() end, },
            { "<leader>dl", function() require('gitsigns').reset_hunk() end, },
            { "<leader>dl", function() require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, mode='v',},
            { "<leader>ds", function() require('gitsigns').stage_hunk() end, },
            { "<leader>ds", function() require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, mode='v',},
            { "<leader>ds", function() require('gitsigns').undo_stage_hunk() end, },
            { "<leader>ds", function() require('gitsigns').undo_stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, mode='v',},
            { "<leader>dp", function() require('gitsigns').nav_hunk('prev') end, },
            { "<leader>dn", function() require('gitsigns').nav_hunk('next') end, },
        }
    },
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
            { "gi", function() vim.lsp.buf.implementation() end },
            { "gd", function() vim.lsp.buf.definition() end },
            { "<leader>r", function() vim.lsp.buf.rename() end },
            { "<leader>c", function() vim.lsp.buf.code_action() end },
            { "<leader>F", function() vim.lsp.buf.format() end },
            { "<leader>K", function() vim.diagnostic.open_float() end },
            { "<leader>J", function() vim.lsp.buf.hover() end },
        },
        lazy = false
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter").setup({ 
                rainbow={
                    enable = true,
                },
                indent = {enable=true},
                ensure_installed={ "cpp", "lua", "python" },
                highlight={
                    enable=true,
                    disable=false,
                    additional_vim_regex_highlighting=true,
                },
            })
        end,
    },
    --aesthetics
    { 'ellisonleao/gruvbox.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'HiPhish/rainbow-delimiters.nvim', lazy=false},
    {
        'echasnovski/mini.surround',
        version = false,
        opts = {
            custom_surroundings = {
                -- Make `)` insert parts with spaces. `input` pattern stays the same.
                ['{'] = { 
                    input = {'%b{}','^.().*().$'},
                    output = { left = '{', right = '}' } 
                },
                ['B'] = { 
                    input = {'%b{}','^.().*().$'},
                    output = { left = '{', right = '}' } 
                },
                ['a'] = { 
                    input = {'%b<>','^.().*().$'},
                    output = { left = '<', right = '>' } 
                },
                ['<'] = { 
                    input = {'%b<>','^.().*().$'},
                    output = { left = '<', right = '>' } 
                },
            },
        }
    },
    {
        'windwp/nvim-autopairs',
        config = true,
        event = 'InsertEnter',
    },
    {
        "kawre/neotab.nvim",
        lazy=false,
        opts = {
            pairs = { 
                { open = "(", close = ")" }, { open = "[", close = "]" },
                { open = "{", close = "}" }, { open = "'", close = "'" },
                { open = '"', close = '"' }, { open = "`", close = "`" },
                { open = "<", close = ">" }, 
            },
        }
    },
    {
        'folke/snacks.nvim',
        dependencies={
            'nvim-tree/nvim-web-devicons',
        },
        priority = 1000,
        lazy = false,
        opts = {
            picker = {
                enabled = true,
                matcher = {
                    frecency = true,
                }
            },
            indent = {
                enabled = true,
                animate = { enabled = false, },
            },
            input = {
                enabled = true,
            },
            words = {
                enabled = true,
                modes = {'n'},
            }
        },
        keys = {
            { "<leader>e", function() Snacks.picker.files() end },
            { "<leader>E", function() Snacks.picker.files({hidden=true,ignored=true}) end },
            { "<leader>fj", function() Snacks.picker.grep() end },
            { "<leader>fj", function() Snacks.picker.grep({hidden=true,ignored=true}) end },
            { "<leader>fb", function() Snacks.picker.buffers() end },
            { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end },
            { "<leader>fl", function() Snacks.picker.lines() end },
            { "<leader>fr", function() Snacks.picker.lsp_references() end },
            { "<leader>fs", function() Snacks.picker.lsp_symbols() end },
            { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end },
            { "<leader>gb", function() Snacks.git.blameline() end },
            { "<leader>gl", function() Snacks.picker.git_log_file() end },
        }
    },
    {
        'stevearc/oil.nvim',
        lazy = false,
        config = function()
            require'oil'.setup({
                skip_confirm_for_simple_edits=true,
                float = {
                    padding = 2,
                    max_width = math.floor(vim.o.columns * 0.8),
                    max_height = math.floor(vim.o.lines * 0.8),
                    border = 'rounded',
                    preview_split = 'right',
                    win_options = { winhighlight = 'Normal:PopupNormal,FloatBorder:Normal'},
                },
                preview_win = {
                    preview_method = 'fast_scratch',
                },
            })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "oil", 
                callback = function()
                    vim.keymap.set("n", "<Esc>", function() require'oil'.close() end, { buffer = true })
                end,
            })
            vim.api.nvim_create_autocmd("User",{
                pattern = "OilEnter",
                callback = vim.schedule_wrap(function(args)
                    local oil = require'oil'
                    if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
                        oil.open_preview({ vertical = true, split = 'botright'})
                    end
                end),
            })
        end,
        keys = {
            {
                '<leader>o', function() require'oil'.toggle_float() end
            },
        },
    },
    {
        'saghen/blink.cmp',
        version = '*',
        opts = {
            appearance = {
                nerd_font_variant = 'mono',
            },
            keymap = {
                ['<CR>'] = {'accept','fallback'},
            },
            cmdline = {
                keymap = {
                    preset = 'inherit',
                    ['<Tab>'] = {'show','select_next','fallback'},
                },
                sources = function()
                    local type = vim.fn.getcmdtype()
                    if type == ':' then
                        return {'cmdline'}
                    else
                        return {}
                    end
                end,
            },
            completion = {
                trigger = {
                    prefetch_on_insert = true,
                },
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                documentation = {
                    auto_show = true,
                },
                list = {
                    selection = {
                        preselect = false,
                    },
                    cycle = {
                        from_bottom = true,
                        from_top = true,
                    },
                },
                ghost_text = {
                    enabled = true,
                },
                menu = {
                    draw = {
                        columns = {
                            {'kind_icon','label','label_description',gap = 1},
                            {'source_name'}
                        },
                    },
                },
            },
            sources = {
                default = { 'lsp', 'buffer', 'path' },
                providers = {
                    lsp = {
                        async = true,
                        timeout_ms = 200,
                    },
                },
            },
        },
    }
})
