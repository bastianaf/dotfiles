return {
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					keys = {
						{ icon = " ", key = "f", desc = "Find file", action = "<cmd>FzfLua files<CR>" },
						{ icon = " ", key = "r", desc = "Recent files", action = "<cmd>FzfLua oldfiles<CR>" },
						{ icon = " ", key = "g", desc = "Live grep", action = "<cmd>FzfLua live_grep<CR>" },
						{ icon = " ", key = "n", desc = "New file", action = "<cmd>ene<CR>" },
						{ icon = " ", key = "l", desc = "Lazygit", action = "<cmd>LazyGit<CR>" },
						{ icon = " ", key = "d", desc = "Dotfiles", action = "<cmd>Oil $HOME/dotfiles<CR>" },
						{ icon = " ", key = "q", desc = "Quit", action = "<cmd>qa<CR>" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ icon = " ", title = "Recent files", section = "recent_files", indent = 2, padding = 1 },
					{
						section = "terminal",
						cmd = "ascii-image-converter ~/.config/logo.png",
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
