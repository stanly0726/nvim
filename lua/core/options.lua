local global = require("core.global")

local function load_options()
    local global_local = {
        autoindent = true,
        autoread = true,
        backspace = "indent,eol,start",
        backup = false,
        breakat = [[\ \	;:,!?]],
        breakindentopt = "shift:2,min:20",
        cmdheight = 1, -- 0, 1, 2
        complete = ".,w,b",
        concealcursor = "niv",
        cursorcolumn = true,
        cursorline = true,
        equalalways = false,
        errorbells = true,
        expandtab = true,
        fileformats = "unix,mac,dos",
        formatoptions = "1jcroql",
        helpheight = 12,
        hidden = true,
        history = 2000,
        hlsearch = false,
        ignorecase = true,
        inccommand = "nosplit",
        incsearch = true,
        infercase = true,
        jumpoptions = "stack",
        linebreak = true,
        list = true,
        listchars = "tab:» ,nbsp:+,trail:·,extends:→,precedes:←",
        number = true,
        pumheight = 15,
        redrawtime = 1500,
        relativenumber = true,
        scrolloff = 8,
        sessionoptions = "curdir,help,tabpages,winsize",
        shada = "!,'300,<50,@100,s10,h",
        shiftround = true,
        shiftwidth = 4,
        shortmess = "aoOTIcF",
        showbreak = "↳ ",
        showmode = false,
        showtabline = 2,
        sidescrolloff = 5,
        signcolumn = "number",
        smartcase = true,
        smartindent = true,
        smarttab = true,
        softtabstop = 4,
        splitbelow = true,
        splitright = true,
        swapfile = false,
        switchbuf = "usetab,uselast",
        synmaxcol = 2500,
        tabstop = 4,
        termguicolors = true,
        timeout = true,
        -- You will feel delay when you input <Space> at lazygit interface if you set it a positive value like 300(ms).
        -- timeoutlen = 0,
        ttimeout = true,
        -- ttimeoutlen = 0,
        undodir = global.home .. "/.vim/undodir",
        undofile = true,
        -- Please do NOT set `updatetime` to above 500, otherwise most plugins may not work correctly
        updatetime = 200,
        viewoptions = "folds,cursor,curdir,slash,unix",
        virtualedit = "block",
        whichwrap = "h,l,<,>,[,],~",
        wildignore =
        ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
        wildignorecase = true,
        winminwidth = 10,
        winwidth = 30,
        wrap = false,
    }

    local function isempty(s)
        return s == nil or s == ""
    end

    -- custom python provider
    local conda_prefix = os.getenv("CONDA_PREFIX")
    if not isempty(conda_prefix) then
        vim.g.python_host_prog = conda_prefix .. "/bin/python"
        vim.g.python3_host_prog = conda_prefix .. "/bin/python"
    elseif global.is_mac then
        vim.g.python_host_prog = "/usr/bin/python"
        vim.g.python3_host_prog = "/usr/local/bin/python3"
    else
        vim.g.python_host_prog = "/usr/bin/python"
        vim.g.python3_host_prog = "/usr/bin/python3"
    end

    for name, value in pairs(global_local) do
        vim.o[name] = value
    end
end

load_options()
