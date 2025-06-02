local settings = require("core.settings")

local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        -- Prepend an underscore to avoid name clashes
        vim.api.nvim_command("augroup _" .. group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.iter({ "autocmd", def }):flatten(math.huge):totable(), " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

-- auto close some filetype with <q>
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "nofile",
        "lspinfo",
        "terminal",
        "prompt",
        "toggleterm",
        "copilot",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.api.nvim_buf_set_keymap(event.buf, "n", "q", "<Cmd>close<CR>", { silent = true })
    end,
})

-- format on save
if settings["format_on_save"] then
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            if not client then
                return
            end

            if client:supports_method('textDocument/formatting') then
                vim.api.nvim_create_autocmd('BufWritePre', {
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    end,
                })
            end
        end,
    })
end

-- -- auto cd into pwd argument
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         vim.print(vim.v.argv)
--     end,
-- })

function autocmd.load_autocmds()
    local definitions = {
        lazy = {},
        bufs = {
            { "BufWritePre", "/tmp/*",         "setlocal noundofile" },
            { "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
            { "BufWritePre", "MERGE_MSG",      "setlocal noundofile" },
            { "BufWritePre", "*.tmp",          "setlocal noundofile" },
            { "BufWritePre", "*.bak",          "setlocal noundofile" },
            -- auto place to last edit
            {
                "BufReadPost",
                "*",
                [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]],
            },
        },
        wins = {
            -- Highlight current line only on focused window
            {
                "WinEnter,BufEnter,InsertLeave",
                "*",
                [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]],
            },
            {
                "WinLeave,BufLeave,InsertEnter",
                "*",
                [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]],
            },
            -- Attempt to write shada when leaving nvim
            {
                "VimLeave",
                "*",
                [[if has('nvim') | wshada | else | wviminfo! | endif]],
            },
            -- Check if file changed when its window is focus, more eager than 'autoread'
            { "FocusGained", "*", "checktime" },
            -- Equalize window dimensions when resizing vim window
            { "VimResized",  "*", [[tabdo wincmd =]] },
            -- Change directory when passing argument into nvim
        },
        ft = {
            { "FileType", "*",        "setlocal formatoptions-=cro" },
            { "FileType", "alpha",    "setlocal showtabline=0" },
            { "FileType", "markdown", "setlocal wrap" },
            { "FileType", "dap-repl", "lua require('dap.ext.autocompl').attach()" },
            {
                "FileType",
                "c,cpp",
                "nnoremap <leader>h :ClangdSwitchSourceHeaderVSplit<CR>",
            },
        },
        yank = {
            {
                "TextYankPost",
                "*",
                [[silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})]],
            },
        },
    }
    autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
