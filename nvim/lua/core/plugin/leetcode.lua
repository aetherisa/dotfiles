-------------------------------------------------
-- leetcode setting
-------------------------------------------------
return function()
	require("leetcode").setup({
		lang = "rust",
		picker = {
			provider = "telescope",
		}
	})
end
