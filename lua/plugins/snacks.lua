---@module "lazy"
---@type LazySpec
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        picker = {
            sources = {
                git_log = {
                    confirm = function(picker, item)
                        picker:close()
                        require("gitsigns").show_commit(item.commit)
                    end
                }
            }
        },
        indent = {
            animate = {
                enabled = false
            }
        },
        scroll = {
            animate = {
                easing = "inOutSine",
            }
        },
        statuscolumn = {
            folds = {
                git_hl = true,
                open = true,
            },
        },
    },
    keys = {
        { "<leader>ff", function() Snacks.picker.files() end,                      desc = "Find: file" },
        { "<leader>fb", function() Snacks.picker.buffers() end,                    desc = "Find: Buffers" },

        { "<leader>sh", function() Snacks.picker.help() end,                       desc = "Search: Help Pages" },
        { "<leader>sk", function() Snacks.picker.keymaps() end,                    desc = "Search: Keymaps" },
        { "<leader>sw", function() Snacks.picker.grep({ hidden = true }) end,      desc = "Search: Word(workspace)" },
        { "<leader>sW", function() Snacks.picker.grep_word({ hidden = true }) end, desc = "Search: Word Under Cursor(workspace)" },

        { "<leader>ss", function() Snacks.picker() end,                            desc = "Snacks picker" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end,                desc = "Snacks diagnostics" },
        { "<leader>e",  function() Snacks.explorer() end,                          desc = "Explorer" },
    },
}
