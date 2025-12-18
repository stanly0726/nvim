local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

local mappings = {
    ["n|<S-Tab>"] = map_cr("normal za"):with_noremap():with_silent():with_desc("editn: Toggle code fold"),
    ["n|<C-s>"] = map_cu("write"):with_noremap():with_silent():with_desc("editn: Save file"),
    ["n|J"] = map_cmd("mzJ`z"):with_noremap():with_desc("join line"),
    ["n|n"] = map_cmd("nzzzv"):with_noremap(),
    ["n|N"] = map_cmd("Nzzzv"):with_noremap(),
    ["n|<C-f>"] = map_cr("!tmux neww ~/.local/bin/tmux-sessionizer<CR>"):with_silent():with_desc("tmux-sessionizer"),
    ["n|<leader>Y"] = map_cmd([["+Y]]):with_desc("yank into system clipboard"),

    -- window movement
    ["n|<C-Left>"] = map_cmd("<C-w>h"):with_desc("editn: move to window left"),
    ["n|<C-Down>"] = map_cmd("<C-w>j"):with_desc("editn: move to window below"),
    ["n|<C-Up>"] = map_cmd("<C-w>k"):with_desc("editn: move to window above"),
    ["n|<C-Right>"] = map_cmd("<C-w>l"):with_desc("editn: move to window right"),

    -- homerow mapping for colemak
    ["n|<A-m>"] = map_cmd("h"),
    ["n|<A-n>"] = map_cmd("j"),
    ["n|<A-e>"] = map_cmd("k"),
    ["n|<A-i>"] = map_cmd("l"),
    -- for chipper keyboard
    ["n|<PageUp>"] = map_cmd("<C-u>"),
    ["n|<PageDown>"] = map_cmd("<C-d>"),


    ["n|<Home>"] = map_cmd("<cmd>cprev<CR>zz"),
    ["n|<End>"] = map_cmd("<cmd>cnext<CR>zz"),
    ["n|<leader>k"] = map_cmd("<cmd>lprev<CR>zz"):with_desc("Next Location List"),
    ["n|<leader>j"] = map_cmd("<cmd>lnext<CR>zz"):with_desc("Next Location List"),
    -- Visual mode
    ["v|N"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("Move selected lines down"),
    ["v|E"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("Move selected lines up"),
    ["v|<leader>y"] = map_cmd([["+y]]):with_desc("Yank to system clipboard"),
    ["v|<leader>d"] = map_cmd([["_d]]):with_desc("Delete without replacing register content"),
    ["x|<leader>p"] = map_cmd([["_dP"]]):with_desc("Paste without replacing register content"),
}

bind.nvim_load_mapping(mappings)
