-------------------------------------------------
-- bareline setting
-------------------------------------------------
return function()
	require("bareline").setup({
		buffer = {
			active = {
				char = "▔",
			},
			inactive = {
				char = "▔",
			}
		}
	})
end
