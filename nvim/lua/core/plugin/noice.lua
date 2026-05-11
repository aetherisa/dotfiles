-------------------------------------------------
-- ui setting
-------------------------------------------------
return function()
	require("noice").setup({
		-- replace command line
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {
				position = {
					row = "20%",
					col = "50%"
				},
				border = {
					style = "double",
				},
				win_options = {
					winhighlight = {
						Normal = "NormalFloat",
						FloatBorder = "FloatBorder",
						FloatTitle = "FloatTitle"
					}
				},
			}
		},

		-- replace message/vim.notify
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		notify = {
			enabled = true,
			view = "notify",
		},

		-- disable noice's popup menu
		popupmenu = {
			enabled = false
		},

		-- consistent view
		commands = {
			history = { view = "split" },
			last = { view = "split" },
			errors = { view = "split" },
			all = { view = "split" }
		},

		-- disable LSP except messages
		-- replace hover/signature makes no sense, why not blink.nvim?
		lsp = {
			progress = { enabled = true },
			message = { enabled = true },
			hover = { enabled = false },
			signature = { enabled = false },
		},

		views = {
			confirm = {
				border = {
					style = "double"
				},
				position = {
					row = "80%",
					col = "50%",
				},
				win_options = {
					winhighlight = {
						Normal = "NormalFloat",
						FloatBorder = "FloatBorder",
					}
				},
			}
		},

		format = {
			confirm = {
				hl_group = {
					choice = "",
					default_choice = ""
				}
			}
		}
	})
end
