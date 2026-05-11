-------------------------------------------------
-- option settings
-------------------------------------------------
local tui = {
	-- stay in center (roughly)
	scrolloff = 8,
	-- highlight cursor line
	cursorline = true,
	-- report line number
	number = true,
	-- 4 space per tab
	tabstop = 4,
	shiftwidth = 4,
	-- wrap is fine
	wrap = true,
	-- more natural split
	splitbelow = true,
	splitright = true,
	-- update buffer on file modified
	autoread = true,
	-- no backup file
	backup = false,
	writebackup = false,
	swapfile = false,
	-- better colors
	termguicolors = true,
	-- smaller popup
	pumheight = 20,
	-- transparent popup/float
	pumblend = 20,
	winblend = 20,
	-- global border
	winborder = "bold",
	-- persistent undo
	undofile = true,
	undodir = vim.fn.stdpath("data") .. "/undo",
	-- disable mouse menu
	mousemodel = "extend",
	-- hide command line
	cmdheight = 0,
	-- only one status line
	laststatus = 3,
	-- simple yet useful status line
	statusline = "%{%&modified?'%#Underlined#':''%}%F%#StatusLine#%=%l/%L",
	-- better status column
	signcolumn = "yes",
	numberwidth = 4,
	statuscolumn = "%s%-3.6l",
	-- use system clipboard
	clipboard = "unnamedplus",
	-- better chars
	fillchars = "eob: ,horiz:═,horizup:╩,horizdown:╦,vert:║,vertleft:╣,vertright:╠,verthoriz:╬"
}

local gui = {}

-- apply tui
for opt, val in pairs(tui) do
	vim.o[opt] = val
end

-- apply gui
if vim.g.neovide then
	for opt, val in pairs(gui) do
		vim.o[opt] = val
	end
end
