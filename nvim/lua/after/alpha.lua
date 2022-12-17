------------------ Dashboard -------------------------------
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("<Leader> c n", "  > New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("<Leader> f f", "  > Find Files", ":cd $HOME/Documents | Telescope find_files<CR>"),
	dashboard.button("<Leader> p p", "  > Find Projects", "<Cmd> Telescope project<CR>"),
	dashboard.button("<Leader> u p", "  > Update Plugins", ":PackerSync<CR>"),
	dashboard.button("<Leader> f h", "  > Recently Opened Files", ":Telescope oldfiles<CR>"),
	dashboard.button("<Leader> q q", "  > Quit Neovim", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)
