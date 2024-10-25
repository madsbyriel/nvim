vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Package management
	use {
        'wbthomason/packer.nvim',
        requires = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function ()
            require"startup".setup()
        end
    }

    -- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- Dracula colorscheme
    use 'Mofiqul/dracula.nvim'

    -- Gruvbox colorscheme
    use 'ellisonleao/gruvbox.nvim'

    -- FUGITIVE! Git stuff.
    use 'tpope/vim-fugitive'

    -- Nice coloring!
    use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Startup screen
    use "startup-nvim/startup.nvim"

    -- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

    -- The line at the bottom of the screen
	use {'ojroques/nvim-hardline'}

    -- Glow for markdown files
	use {"ellisonleao/glow.nvim", config = function() require("glow").setup({
		style = "dark",
		width = 120,
	}) end}

    -- nvim-cmp
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
end)
