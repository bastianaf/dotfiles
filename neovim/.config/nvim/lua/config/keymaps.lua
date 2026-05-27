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
