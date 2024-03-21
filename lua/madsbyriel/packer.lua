vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- Dracula colorscheme
    use 'Mofiqul/dracula.nvim'

    -- Gruvbox colorscheme
    use 'ellisonleao/gruvbox.nvim'

    use 'tpope/vim-fugitive'

	use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
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
	use {'ojroques/nvim-hardline'}
	use {"ellisonleao/glow.nvim", config = function() require("glow").setup({
		style = "dark",
		width = 120,
	}) end}
end)
