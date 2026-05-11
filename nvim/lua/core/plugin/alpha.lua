-------------------------------------------------
-- dashboard setting
-------------------------------------------------
return function()
	local augroup = vim.api.nvim_create_augroup("core.plugin.alpha", { clear = true })

	require("alpha").setup({
		layout = {
			{
				type = "padding",
				val = math.floor(vim.o.lines / 4)
			},
			{
				type = "text",
				val = {
					" _. __|_|_  _ ._o _",
					"(_|(/_|_| |(/_| |_>"
				},
				opts = {
					position = "center"
				}
			}
		}
	})

	vim.api.nvim_create_autocmd("User", {
		pattern = "AlphaReady",
		group = augroup,
		callback = function(env)
			local laststatus = vim.o.laststatus
			vim.o.laststatus = 0
			vim.api.nvim_create_autocmd("BufUnload", {
				group = augroup,
				buffer = env.buf,
				callback = function()
					vim.o.laststatus = laststatus
				end
			})
		end
	})
end
