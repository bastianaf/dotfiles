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
					{
						section = "terminal",
						cmd = "echo ' ' && echo ' ' && echo ' ' && ascii-image-converter ~/.config/logo.png -c --complex",
						random = 10,
						pane = 2,
						indent = 4,
						height = 30,
					},
				},
			},
		},
	},
}
