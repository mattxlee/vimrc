local on_attach = function(client, bufnr)
    -- diagnostic
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- language options
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Set up nvim-cmp.
pcall(function()
    require('nvim-lsp-installer').setup()
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    require('lspconfig').clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body)
            end
        },
        window = {},
        mapping = cmp.mapping.preset.insert({
            ['<c-l>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if vim.fn['vsnip#available'](1) == 1 then
                    feedkey('<Plug>(vsnip-expand-or-jump)', '')
                else
                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end, {'i', 's'}),
            ['<S-Tab>'] = cmp.mapping(function()
                if vim.fn['vsnip#jumpable'](-1) == 1 then
                    feedkey('<Plug>(vsnip-jump-prev)', '')
                end
            end, {'i', 's'})
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' }
        }, {{ name = 'buffer' }}, {{ name = 'path' }})
    })
end)
