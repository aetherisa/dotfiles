-------------------------------------------------
-- treesitter setup
-------------------------------------------------
return function()
	local augroup = vim.api.nvim_create_augroup("core.native.treesitter", { clear = true })
	
	-- auto enable highlighting
	vim.api.nvim_create_autocmd("FileType", {
		group = augroup,
		callback = function(env)
			local filetype = vim.bo[env.buf].filetype
			if vim.treesitter.language.add(filetype) then
				vim.treesitter.start(env.buf, filetype)
			end
		end
	})
	
	-- parser specific settings
	vim.treesitter.language.register("qmljs", { "qml" })
end
