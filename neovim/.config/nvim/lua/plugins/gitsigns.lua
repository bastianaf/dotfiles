return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
		keys = {
			{ "]c", desc = "Next hunk" },
			{ "[c", desc = "Previous hunk" },
			{ "<leader>hs", desc = "Stage hunk" },
			{ "<leader>hr", desc = "Reset hunk" },
			{ "<leader>hS", desc = "Stage buffer" },
			{ "<leader>hp", desc = "Preview hunk" },
			{ "<leader>hb", desc = "Blame line" },
			{ "<leader>hd", desc = "Diff this" },
		},
	},
}
