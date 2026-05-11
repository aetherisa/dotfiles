-------------------------------------------------
-- lsp client setup
-------------------------------------------------
return function()
	local augroup = vim.api.nvim_create_augroup("core.native.lsp", { clear = true })

	-- enable installed language server
	local configs = {
		rust_analyzer = {
			inlay_hint = true,
			format_on_save = true,
		},
		clangd = {
			inlay_hint = true,
			format_on_save = false,
		},
		qmlls = {
			format_on_save = true,
		},
	}

	vim.lsp.config("qmlls", {
		cmd = { "qmlls6" }
	})

	for server, config in pairs(configs) do
		vim.lsp.enable(server)
	end

	-- global settings
	vim.api.nvim_create_autocmd("LspAttach", {
		group = augroup,
		callback = function(env)
			local keymap_opt = {
				silent = true,
				buffer = env.buf
			}
			
			local hover_opt = {
				max_width = math.floor(vim.o.columns * 0.6),
				max_height = math.floor(vim.o.lines * 0.6)
			}

			vim.keymap.set("n", "<Leader>ld", vim.lsp.buf.definition, keymap_opt)
			vim.keymap.set("n", "<Leader>lc", vim.lsp.buf.code_action, keymap_opt)
			vim.keymap.set("n", "<Leader>ln", vim.lsp.buf.rename, keymap_opt)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover(hover_opt)
			end, keymap_opt)

			local client = vim.lsp.get_client_by_id(env.data.client_id)

			-- inlay hint
			if configs[client.name].inlay_hint then
				vim.lsp.inlay_hint.enable(true, { bufnr = env.buf })
			end

			-- auto format
			if configs[client.name].format_on_save then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = env.buf,
					group = augroup,
					callback = function(env)
						vim.lsp.buf.format({
							bufnr = env.buf,
							timeout_ms = 1000,
						})
					end
				})
			end
		end
	})
end
