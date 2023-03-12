local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local core_map = {
        ["n|<leader>pv"] = map_cr("Ex"),
        ["n|J"] = map_cmd("mzJ`z"):with_noremap(),
        ["n|n"] = map_cmd("nzzzv"):with_noremap(),
        ["n|N"] = map_cmd("Nzzzv"):with_noremap(),
        ["n|Q"] = map_cmd("<nop>"),
        ["n|<C-f>"] = map_cmd("<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>"),
        ["n|<leader>Y"] = map_cmd([["+Y]]),
        ["n|<leader>f"] = map_callback(function()
        if (vim.bo.filetype == "blade") then
            vim.lsp.buf.format({ timeout_ms = 10000 })
        else
            vim.lsp.buf.format()
        end
    end),
        ["n|<C-k>"] = map_cmd("<cmd>cprev<CR>zz"),
        ["n|<C-j>"] = map_cmd("<cmd>cnext<CR>zz"),
        ["n|<leader>k"] = map_cmd("<cmd>lprev<CR>zz"),
        ["n|<leader>j"] = map_cmd("<cmd>lnext<CR>zz"),
        ["x|<leader>p"] = map_cmd([["_dP"]]):with_desc("Paste without replacing register content"),
    -- Visual mode
        ["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("Move selected lines down"),
        ["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("Move selected lines up"),
        ["v|<leader>y"] = map_cmd([["+y]]):with_desc("Yank to system clipboard"),
        ["v|<leader>d"] = map_cmd([["_d]]):with_desc("Delete without replacing register content"),
}

bind.nvim_load_mapping(core_map)
