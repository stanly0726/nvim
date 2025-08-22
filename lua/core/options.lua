local global = require("core.global")

local function load_options()
    local global_local = {
        breakat = [[\ \	;:,!?]],
        breakindentopt = "shift:2,min:20",
        cmdwinheight = 5,
        cmdheight = 1,
        complete = ".,w,b,k,kspell",
        completeopt = "fuzzy,menuone,noselect,popup",
        cursorline = true,
        diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience",
        equalalways = false,
        errorbells = true,
        expandtab = true,
        fileformats = "unix,mac,dos",
        foldlevelstart = 99,
        foldmethod = "expr",
        foldexpr = "v:lua.vim.treesitter.foldexpr()",
        formatoptions = "1jcroql",
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --hidden --vimgrep --smart-case --",
        hlsearch = false,
        helpheight = 12,
        history = 2000,
        ignorecase = true,
        jumpoptions = "stack",
        laststatus = 3,
        linebreak = true,
        list = true,
        listchars = "tab:» ,nbsp:+,trail:·,extends:→,precedes:←",
        number = true,
        pumheight = 15,
        relativenumber = true,
        scrolloff = 8,
        sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize",
        shada = "!,'500,<50,@100,s10,h",
        shiftround = true,
        shiftwidth = 4,
        shortmess = "aoOTIcF",
        showbreak = "↳  ",
        showmode = false,
        sidescrolloff = 10,
        signcolumn = "yes",
        smartcase = true,
        smoothscroll = true,
        splitbelow = true,
        splitright = true,
        switchbuf = "usetab,uselast",
        softtabstop = 4,
        tabstop = 4,
        termguicolors = true,
        timeoutlen = 500,
        undodir = global.cache_dir .. "/undo/",
        undofile = true,
        -- Please do NOT set `updatetime` to above 500, otherwise most plugins may not function correctly
        updatetime = 200,
        virtualedit = "block",
        visualbell = true,
        winminwidth = 10,
        wrap = false,
    }

    local function isempty(s)
        return s == nil or s == ""
    end
    local function use_if_defined(val, fallback)
        return val ~= nil and val or fallback
    end

    -- custom python provider
    local conda_prefix = os.getenv("CONDA_PREFIX")
    if not isempty(conda_prefix) then
        vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
        vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python")
    else
        vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
        vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
    end

    for name, value in pairs(global_local) do
        vim.api.nvim_set_option_value(name, value, {})
    end
end

-- Newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 3

load_options()
