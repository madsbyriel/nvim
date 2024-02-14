local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})

end)

local cmp = require('cmp')
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- confirm completion
		['<CR>'] = cmp.mapping.confirm({select = true}),

		-- move up and down
		['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
	})
})

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
    },
	handlers = {
		lsp_zero.default_setup,
	},
})

require'lspconfig'.mojo.setup{
    cmd={'mojo-lsp-server'},
    filetypes={'mojo'},
}
