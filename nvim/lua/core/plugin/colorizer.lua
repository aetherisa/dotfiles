-------------------------------------------------
-- colorizer setting
-------------------------------------------------
return function()
	require("colorizer").setup({
		filetypes = { "*" },
		options = {
			parsers = {
				hex = {
					no_hash = true,
				}
			},
		},
	})
end

