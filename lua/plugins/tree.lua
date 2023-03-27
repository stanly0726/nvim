return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { '<leader>e', "<cmd>NvimTreeToggle<cr>" }
    },
    cmd = {
        "NvimTreeToggle",
        "NvimTreeOpen"
    },
    config = function()
        local icons = {
            diagnostics = require("modules.icons").get("diagnostics"),
            documents = require("modules.icons").get("documents"),
            git = require("modules.icons").get("git"),
            ui = require("modules.icons").get("ui"),
        }
        require("nvim-tree").setup(
            {
                hijack_cursor = true,
                hijack_netrw = true,
                view = {
                    width = 30,
                    hide_root_folder = false,
                },
                renderer = {
                    group_empty = true,
                    indent_markers = {
                        enable = true,
                        icons = {
                            corner = "└ ",
                            edge = "│ ",
                            item = "│ ",
                            none = "  ",
                        },
                    },
                    root_folder_label = ":.:s?.*?/..?",
                    icons = {
                        show = {
                            folder_arrow = false,
                        },
                        symlink_arrow = "  ",
                        glyphs = {
                            default = icons.documents.Default, --
                            symlink = icons.documents.Symlink, --
                            bookmark = icons.ui.Bookmark,
                            git = {
                                unstaged = icons.git.Mod_alt,
                                staged = icons.git.Add,          --
                                unmerged = icons.git.Unmerged,
                                renamed = icons.git.Rename,      --
                                untracked = icons.git.Untracked, -- "ﲉ"
                                deleted = icons.git.Remove,      --
                                ignored = icons.git.Ignore,      --◌
                            },
                            folder = {
                                -- arrow_open = "",
                                -- arrow_closed = "",
                                arrow_open = "",
                                arrow_closed = "",
                                default = icons.ui.Folder,
                                open = icons.ui.FolderOpen,
                                empty = icons.ui.EmptyFolder,
                                empty_open = icons.ui.EmptyFolderOpen,
                                symlink = icons.ui.SymlinkFolder,
                                symlink_open = icons.ui.FolderOpen,
                            },
                        },
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_root = true,
                    ignore_list = {},
                },
                filters = {
                    custom = { ".DS_Store" },
                },
                actions = {
                    open_file = {
                        resize_window = false,
                        window_picker = {
                            enable = true,
                            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                            exclude = {
                                filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
                                buftype = { "terminal", "help" },
                            },
                        },
                    },
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = false,
                    debounce_delay = 50,
                    icons = {
                        hint = icons.diagnostics.Hint_alt,
                        info = icons.diagnostics.Information_alt,
                        warning = icons.diagnostics.Warning_alt,
                        error = icons.diagnostics.Error_alt,
                    },
                },
            }
        )
    end
}
