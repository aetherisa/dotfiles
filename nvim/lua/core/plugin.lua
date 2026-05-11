-------------------------------------------------
-- plugins settings (lazy.nvim)
-------------------------------------------------
-- ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- double check installation
local ok, lazy = pcall(require, "lazy")
if not ok then
	vim.api.nvim_err_writeln("missing plugin: lazy.nvim not found")
	return
end

lazy.setup({
	-- plugin lists
	spec = {
		-- LSP config collections
		{
			"neovim/nvim-lspconfig",
			lazy = false,
		},

		-- completion
		{
			"saghen/blink.cmp",
			version = "1.*",
			config = require("core.plugin.blink")
		},

		-- ui
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
			config = require("core.plugin.noice")
		},

		-- telescope
		{
			"nvim-telescope/telescope.nvim", version = "*",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			},
			keys = {
				{ "<Leader>tt", "<CMD>Telescope<CR>", silent = true },
				{ "<Leader>tf", "<CMD>Telescope find_files<CR>", silent = true },
				{ "<Leader>to", "<CMD>Telescope oldfiles<CR>", silent = true },
				{ "<Leader>tg", "<CMD>Telescope live_grep<CR>", silent = true },
			},
			config = require("core.plugin.telescope")
		},

		-- auto pairs
		{
			'windwp/nvim-autopairs',
			event = "InsertEnter",
			config = true
		},

		-- git sign
		{
			"lewis6991/gitsigns.nvim",
			config = true
		},

		-- motion
		{
			"folke/flash.nvim",
			event = "VeryLazy",
			keys = {
				{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end },
				{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
			},
			config = require("core.plugin.flash")
		},

		-- indent line
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			config = require("core.plugin.indent")
		},

		-- color viewer
		{
			"catgoose/nvim-colorizer.lua",
			event = "BufReadPre",
			config = require("core.plugin.colorizer")
		},

		-- dashboard
		{
			"goolord/alpha-nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = require("core.plugin.alpha")
		},

		-- file manager
		{
			"stevearc/oil.nvim",
			keys = {
				{ "-", mode = "n", "<CMD>Oil<CR>" },
			},
			config = require("core.plugin.oil")
		}
	},

	-- lazy.nvim specific
	rocks = {
		enabled = false,
	},
	ui = {
		size = { width = 0.8, height = 0.8 },
		border = "double",
		title = " Plugins ",
		backdrop = 100,
		pills = false
	},
})
