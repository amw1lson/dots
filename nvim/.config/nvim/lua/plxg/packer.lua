vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = require('plxg.startup').config
    }
    use 'folke/tokyonight.nvim'
    use 'marko-cerovac/material.nvim'
    use {'nyoom-engineering/oxocarbon.nvim'}
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'Everblush/nvim', as = 'everblush' }
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
    use {'nvim-telescope/telescope-ui-select.nvim' }
    use 'ThePrimeagen/harpoon'
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
      }
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
    use 'HiPhish/rainbow-delimiters.nvim'
    -- obsidian
    use({
      "epwalsh/obsidian.nvim",
      tag = "*",  -- recommended, use latest release instead of latest commit
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("obsidian").setup({
          workspaces = {
              {
                  name = "obsidian",
                  path = "~/dev/obsidian"
              },
          },
        })
      end,
    })
end)
