vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = require('plxg.startup').config
    }
    use 'AlexvZyl/nordic.nvim'
    use 'folke/tokyonight.nvim'
    use 'voidekh/kyotonight.vim'
    use 'nyoom-engineering/oxocarbon.nvim'

    use({
      "neanias/everforest-nvim",
      -- Optional; default configuration will be used if setup isn't called.
      config = function()
        require("everforest").setup()
      end,
    })
    use { 'nvim-lualine/lualine.nvim' }
    use 'norcalli/nvim-colorizer.lua'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    --misc plugs
    use 'lervag/vimtex'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    --navigation
    use 'ggandor/leap.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use 'ThePrimeagen/harpoon'
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    --lsp
    use "williamboman/mason.nvim"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use({
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!:).
            run = "make install_jsregexp"
    })
    use { 'saadparwaiz1/cmp_luasnip' }
    use 'KeitaNakamura/tex-conceal.vim'
end)
