vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    --lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --snippets
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    --aesthetics
    use 'norcalli/nvim-colorizer.lua'
    use 'kdheepak/monochrome.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }
    --misc plugs
    use 'lervag/vimtex'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    --navigation
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'ThePrimeagen/harpoon'
end)
