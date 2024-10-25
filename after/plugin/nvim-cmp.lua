-- Set up nvim-cmp.
local cmp = require'cmp'
local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})

end)

cmp.setup({
    experimental = {
        ghost_text = true,
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        -- confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = true}),

        -- abort
        ['<C-e>'] = cmp.mapping.abort(),
        -- move up and down
        ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "pyright",
        "csharp_ls",
    },
    handlers = {
        lsp_zero.default_setup,
    },
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp_config.pyright.setup {
    capabilities = capabilities
}
lsp_config.csharp_ls.setup {
    capabilities = capabilities
}
lsp_config.dartls.setup {
    capabilities = capabilities
}
lsp_config.rust_analyzer.setup{
    capabilities = capabilities
}
