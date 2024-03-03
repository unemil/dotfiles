local lsp = require('lsp-zero')

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)

    local organize_imports = function(timeout_ms)
        local params = vim.lsp.util.make_range_params()

        params.context = {
            only = { 'source.organizeImports' }
        }

        local results = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, timeout_ms)

        for _, result in pairs(results or {}) do
            for _, r in pairs(result.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, 'utf-8')
                else
                    vim.lsp.buf.execute_command(r.command)
                end
            end
        end
    end

    local lsp_format = vim.api.nvim_create_augroup('lsp_format', { clear = true })

    vim.api.nvim_create_autocmd('BufWritePre', {
        group = lsp_format,
        pattern = '*',
        callback = function()
            vim.lsp.buf.format()
        end
    })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = lsp_format,
        pattern = '*.go',
        callback = function()
            organize_imports(1000)
        end
    })

    local lsp_document_highlight = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })

    vim.api.nvim_create_autocmd('CursorHold', {
        group = lsp_document_highlight,
        pattern = '*',
        callback = function()
            vim.lsp.buf.document_highlight()
        end
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
        group = lsp_document_highlight,
        pattern = '*',
        callback = function()
            vim.lsp.buf.clear_references()
        end
    })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'gopls', 'pylsp', 'bashls', 'lua_ls' },
    handlers = {
        lsp.default_setup
    }
})

local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

lspconfig.pylsp.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<A-Space>'] = cmp.mapping.complete()
    })
})
