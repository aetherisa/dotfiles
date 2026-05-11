-------------------------------------------------
-- signal handlers
-------------------------------------------------
return function()
	local uv = vim.uv

	-- SIGUSR1 -> reload colorscheme
	uv.signal_start(uv.new_signal(), 'sigusr1', function(signum)
		vim.defer_fn(function()
			vim.cmd("mksession! tmp.vim | restart source tmp.vim | lua vim.fs.rm('./tmp.vim')")
		end, 0)
	end)
end
