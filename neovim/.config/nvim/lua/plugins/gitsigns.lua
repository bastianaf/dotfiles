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
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end
				map("]c", gs.next_hunk, "Next hunk")
				map("[c", gs.prev_hunk, "Previous hunk")
				map("<leader>hs", gs.stage_hunk, "Stage hunk")
				map("<leader>hr", gs.reset_hunk, "Reset hunk")
				map("<leader>hS", gs.stage_buffer, "Stage buffer")
				map("<leader>hp", gs.preview_hunk, "Preview hunk")
				map("<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("<leader>hd", gs.diffthis, "Diff this")
			end,
		},
	},
}
