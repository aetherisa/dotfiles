-------------------------------------------------
-- file manager setting
-------------------------------------------------
return function()
	require("oil").setup({
		watch_for_changes = true,
		view_options = {
			show_hidden = true,
		}
	})
end
