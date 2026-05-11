-------------------------------------------------
-- flash setting
-------------------------------------------------
return function()
	require("flash").setup({
		search = {
			mode = "search",
			incremental = false,
		},
		label = {
			style = "eol",
		},
		highlight = {
			backdrop = true,
			matches = true,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
		modes = {
			search = { enabled = false },
			char = { enabled = false }
		}
	})
end
