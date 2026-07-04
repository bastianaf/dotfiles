return {
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					keys = {
						{ icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')" },
						{ icon = " ", key = "r", desc = "Recent files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
						{ icon = " ", key = "g", desc = "Live grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
						{ icon = " ", key = "n", desc = "New file", action = ":ene | startinsert" },
						{ icon = " ", key = "l", desc = "Lazygit", action = function() Snacks.lazygit() end },
						{ icon = " ", key = "d", desc = "Dotfiles", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.env.HOME .. '/dotfiles'})" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ icon = " ", title = "Recent files", section = "recent_files", indent = 2, padding = 1 },
				},
			},
		},
	},
	{
		-- Only add the logo terminal pane when the unsynced logo image is
		-- present, so fresh machines don't error on dashboard.
		"folke/snacks.nvim",
		opts = function(_, opts)
			local logo = vim.env.HOME .. "/.config/logo.png"
			if vim.uv.fs_stat(logo) then
				table.insert(opts.dashboard.sections, {
					section = "terminal",
					cmd = "echo ' ' && echo ' ' && echo ' ' && ascii-image-converter " .. logo .. " -c --complex",
					random = 10,
					pane = 2,
					indent = 4,
					height = 30,
				})
			end
		end,
	},
}