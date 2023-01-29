vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { 'nyoom-engineering/oxocarbon.nvim' }
    --dap
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'leoluz/nvim-dap-go'
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
    --snippets
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    --aesthetics
    use {
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "startup".setup()
        end
    }
    use 'norcalli/nvim-colorizer.lua'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'yamatsum/nvim-nonicons',
        requires = { 'kyazdani42/nvim-web-devicons' }
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
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use 'ThePrimeagen/harpoon'
end)
