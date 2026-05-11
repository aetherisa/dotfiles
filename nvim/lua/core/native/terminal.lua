-------------------------------------------------
-- terminal setup
-------------------------------------------------
return function()
	local augroup = vim.api.nvim_create_augroup("core.native.terminal", { clear = true })
	local buf = nil
	local win = nil
	local winopt = {
		split = "below",
		win = -1,
		style = "minimal",
		height = math.floor(vim.o.lines * 0.4)
	}

	-- helper functions
	local _close = function()
		vim.api.nvim_win_hide(win)
		win = nil
	end

	local _init = function()
		buf = vim.api.nvim_create_buf(false, true)
		win = vim.api.nvim_open_win(buf, true, winopt)
		vim.api.nvim_set_option_value("filetype", "terminal", { buf = buf })

		-- spawn terminal
		vim.fn.jobstart("fish", {
			term = true,
			on_exit = function()
				buf = nil
				_close()
			end
		})

		-- auto enter insert mode
		vim.api.nvim_create_autocmd("BufEnter", {
			group = augroup,
			buffer = buf,
			callback = function()
				vim.cmd.startinsert()
			end
		})

		vim.api.nvim_win_hide(win)
		win = nil
	end

	local _open = function()
		if buf == nil then
			_init()
		end
		win = vim.api.nvim_open_win(buf, true, winopt)
	end 

	local _toggle = function()
		if win and vim.api.nvim_win_is_valid(win) then
			_close()
		else
			_open()
		end
	end

	-- keymaps
	vim.keymap.set({ "n", "t" }, "<C-\\>", _toggle)
	vim.keymap.set("t", "<C-Up>", "<C-\\><C-n><C-w>k")
	vim.keymap.set("t", "<C-Down>", "<C-\\><C-n><C-w>j")
	vim.keymap.set("t", "<C-Left>", "<C-\\><C-n><C-w>h")
	vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><C-w>l")
end
