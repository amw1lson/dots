vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    -- aesthetics
    use 'ellisonleao/gruvbox.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use { 'nvim-lualine/lualine.nvim' }
    use 'KeitaNakamura/tex-conceal.vim'
    use 'HiPhish/rainbow-delimiters.nvim'

    -- reqs
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- lsp
    use "williamboman/mason.nvim"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "onsails/lspkind.nvim"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'lervag/vimtex'

    -- convenience
    use { 'windwp/nvim-autopairs' }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'ggandor/leap.nvim'
    use 'ThePrimeagen/harpoon'
    use({
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            run = "make install_jsregexp"
    })
    use { 'saadparwaiz1/cmp_luasnip' }

    -- telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {'nvim-telescope/telescope-ui-select.nvim' }

    -- packer can manage itself
    use 'wbthomason/packer.nvim'
end)
