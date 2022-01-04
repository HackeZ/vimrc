local M = {}

-- helper functions
local opts = {noremap = true, silent = true}
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

-- for common keymaps
local on_attach = function(client, bufnr)
    -- enable Neovim built-in lsp omnifunc which is recommended
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- jump
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

    -- action
    buf_set_keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)

    -- tips
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '<C-g>', '<cmd>lua vim.lsp.buf.document_symbol()<CR>',
                   opts)

    -- workspace
    buf_set_keymap('n', '<leader>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>fm",
                       "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

        -- format before save automatically
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
        vim.api.nvim_command [[augroup END]]
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>fm",
                       "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
		augroup lsp_document_highlight
		autocmd! * <buffer>
		autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
		autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		augroup END
		]], false)
    end
end

-- returns all language server default config
local function make_default_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {'documentation', 'detail', 'additionalTextEdits'}
    }
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
        -- indentation based on treesitter for the `=` operator
        indent = {enabled = true}
    }
end

-- the nvim-lsp setup servers entrypoint
M.setup_servers = function()
    local lsp_installer = require("nvim-lsp-installer")

    -- Register a handler that will be called for all installed servers.
    -- Alternatively, you may also register handlers on specific server instances instead (see example below).
    lsp_installer.on_server_ready(function(server)
        local opts = make_default_config()

        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        if server.name == "gopls" then
            opts.settings = require("lsp.go.settings")
        end
        if server.name == "sumneko_lua" then
            opts.settings = require("lsp.lua.settings")
        end
        -- if server.name == "rust_analyzer" then
        --     require("rust-tools").setup {
        --         -- The "server" property provided in rust-tools setup function are the
        --         -- settings rust-tools will provide to lspconfig during init.            -- 
        --         -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
        --         -- with the user's own settings (opts).
        --         server = vim.tbl_deep_extend("force",
        --                                      server:get_default_options(), opts)
        --     }
        --     server:attached_buffers()
        --     return -- WARN: donot call server:setup
        -- end

        -- This setup() function is exactly the same as lspconfig's setup function.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end)
end

return M
