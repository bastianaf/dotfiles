return {
	{
		"stevearc/oil.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			columns = { "icon", "mtime" },
			view_options = {
				show_hidden = true,
				sort = {
					{ "type", "asc" },
					{ "mtime", "desc" },
				},
			},
		},
	},
}
