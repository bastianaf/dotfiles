-- Custom keymaps (on top of LazyVim defaults)
local map = vim.keymap.set

-- Copy paths to clipboard
map("n", "<leader>cp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path)
end, { desc = "Copy absolute path" })

map("n", "<leader>cr", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path)
end, { desc = "Copy relative path" })

-- Show diagnostics float
map("n", "<leader>D", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- Open dashboard
map("n", "<leader>da", function()
	require("snacks").dashboard()
end, { desc = "Open dashboard" })

-- Oil file browser
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Codediff (VS Code-style diffs)
map("n", "<leader>ru", "<cmd>CodeDiff<cr>", { desc = "Code diff not staged" })
map("n", "<leader>rm", "<cmd>CodeDiff main<cr>", { desc = "Code diff main" })
map("n", "<leader>rh", "<cmd>CodeDiff HEAD~1<cr>", { desc = "Code diff previous commit" })

-- Lazygit remote
map("n", "<leader>gb", function()
	local url = vim.fn.systemlist("git remote get-url origin")[1]
	if url then
		vim.ui.open(url)
	end
end, { desc = "Open git remote" })

-- Git line history
local function git_line_history(start_line, end_line)
	start_line, end_line = math.min(start_line, end_line), math.max(start_line, end_line)
	local range = start_line .. "," .. end_line .. ":" .. vim.fn.expand("%:t")
	local command = { "git", "-C", vim.fn.expand("%:p:h"), "--no-pager", "log", "-L", range }
	local output = vim.fn.systemlist(command)
	local command_text = vim.fn.join(vim.tbl_map(vim.fn.shellescape, command), " ")

	vim.cmd("vnew")
	vim.bo.buftype = "nofile"
	vim.bo.filetype = "diff"
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.list_extend({ command_text, "" }, output))
	vim.bo.modified = false
end

map("n", "<leader>gl", function()
	git_line_history(vim.fn.line("."), vim.fn.line("."))
end, { desc = "Git line history" })

map("v", "<leader>gl", function()
	git_line_history(vim.fn.line("v"), vim.fn.line("."))
end, { desc = "Git line history" })
