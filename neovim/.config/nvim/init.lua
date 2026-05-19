-- Set <space> as leader (must happen before other plugins loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Relative line numbers
vim.o.relativenumber = true
vim.o.number = true

-- Case-insensitive searching unless we use capital letters
vim.o.ignorecase = true
vim.o.smartcase = true

-- Sync vim and system clipboards
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Copy to clipboard shortcuts
vim.keymap.set('n', '<leader>cp', function()
	local path = vim.fn.expand('%:p')
	vim.fn.setreg('+', path)
	vim.notify('Copied: ' .. path)
end, { desc = 'Copy absolute path' })

vim.keymap.set('n', '<leader>cr', function()
	local path = vim.fn.expand('%')
	vim.fn.setreg('+', path)
	vim.notify('Copied: ' .. path)
end, { desc = 'Copy relative path' })

-- Raise dialog if you close unsaved buffer (prevent mistakes)
vim.o.confirm = true

-- Disable swap files to prevent annoying errors
vim.opt.swapfile = false

-- Snappy escape
vim.o.ttimeoutlen = 1

-- Vim diagnostics
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = { source = 'if_many' },
	jump = { float = true },
})

-- Show diagnostics
vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float, { desc = 'Show diagnostics' })

-- Easily move between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end,
})

-- Plugins
vim.pack.add({
	'https://github.com/ibhagwan/fzf-lua',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/karb94/neoscroll.nvim',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/kdheepak/lazygit.nvim',
	'https://github.com/esmuellert/codediff.nvim',
	'https://github.com/goolord/alpha-nvim',
	'https://github.com/rebelot/kanagawa.nvim',
	'https://github.com/MeanderingProgrammer/render-markdown.nvim',
	'https://github.com/echasnovski/mini.icons',
	{ src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
})

-- Kanagawa
require('kanagawa').setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none"
				}
			}
		}
	}
})
vim.cmd('colorscheme kanagawa-wave')

-- Markdown
require('render-markdown').setup({})

-- FzfLua Setup
local fzf = require('fzf-lua')
fzf.setup({
	ui_select = true,
	keymap = {
		builtin = {
			["<C-d>"] = 'preview-page-down',
			["<C-u>"] = 'preview-page-up',
		},
	},
	winopts = {
		height  = 0.95,
		width   = 0.90,
		preview = {
			layout   = 'vertical',
			vertical = "down:30%",
		}
	},
	files = {
		formatter = 'path.filename_first',
	},
})

vim.keymap.set('n', '<leader><leader>', '<cmd>FzfLua files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<cr>', { desc = 'Find live grep' })
vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua resume<cr>', { desc = 'Resume last picker' })
vim.keymap.set('n', '<leader>,', '<cmd>FzfLua buffers<cr>', { desc = 'Buffers' })

vim.keymap.set('n', 'grr', fzf.lsp_references, { desc = 'References' })
vim.keymap.set('n', 'gri', fzf.lsp_implementations, { desc = 'Implementations' })
vim.keymap.set('n', 'gra', fzf.lsp_code_actions, { desc = 'Code actions' })
vim.keymap.set('n', 'gd', fzf.lsp_definitions, { desc = 'Go to definition' })

-- Treesitter
vim.cmd('syntax off')
vim.api.nvim_create_autocmd('FileType', {
	callback = function() pcall(vim.treesitter.start) end,
})

-- LSP
vim.lsp.enable({
	'ruff',
	'lua_ls',
})
vim.o.signcolumn = 'yes'

-- Auto-format on save
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if not client:supports_method('textDocument/willSaveWaitUntil')
		    and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp.fmt', { clear = false }),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})

-- Blink.cmp
require('blink.cmp').setup({
	signature = {
		enabled = true,
		window = { show_documentation = false },
	},
})

-- Neoscroll
require('neoscroll').setup({
	hide_cursor = false,
	stop_eof = true,
	easing = 'quadratic',
	duration_multiplier = 0.30,
})

-- Oil.nvim
require("oil").setup({
	columns = { "mtime" },
	view_options = {
		show_hidden = true,
		sort = {
			{ "type",  "asc" },
			{ "mtime", "desc" },
		}
	},
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Lazygit.nvim
local function git_line_history(start_line, end_line)
	start_line, end_line = math.min(start_line, end_line), math.max(start_line, end_line)
	local range = start_line .. ',' .. end_line .. ':' .. vim.fn.expand('%:t')
	local command = { 'git', '-C', vim.fn.expand('%:p:h'), '--no-pager', 'log', '-L', range }
	local output = vim.fn.systemlist(command)
	local command_text = vim.fn.join(vim.tbl_map(vim.fn.shellescape, command), ' ')

	vim.cmd('vnew')
	vim.bo.buftype = 'nofile'
	vim.bo.filetype = 'diff'
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.list_extend({ command_text, '' }, output))
	vim.bo.modified = false
end

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Lazygit' })
vim.keymap.set('n', '<leader>gb', function() vim.ui.open(vim.fn.systemlist('git remote get-url origin')[1]) end,
	{ desc = 'Open git remote' })
vim.keymap.set('n', '<leader>gl', function()
	git_line_history(vim.fn.line('.'), vim.fn.line('.'))
end, { desc = 'Git line history' })
vim.keymap.set('v', '<leader>gl', function()
	git_line_history(vim.fn.line('v'), vim.fn.line('.'))
end, { desc = 'Git line history' })

-- Codediff (VS Code-like diffs)
require("codediff").setup({})
vim.keymap.set('n', '<leader>ru', '<cmd>CodeDiff<cr>', { desc = 'Code diff not staged' })
vim.keymap.set('n', '<leader>rm', '<cmd>CodeDiff main<cr>', { desc = 'Code diff main' })
vim.keymap.set('n', '<leader>rh', '<cmd>CodeDiff HEAD~1<cr>', { desc = 'Code diff previous commit' })

-- Start screen
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = vim.split(
	[[
          ___           ___           ___           ___
         /  /\         /  /\         /  /\         /  /\
        /  /:/        /  /::\       /  /::\       /  /::\
       /  /:/        /  /:/\:\     /  /:/\:\     /  /:/\:\
      /  /:/  ___   /  /:/~/::\   /  /:/~/:/    /  /:/~/::\
     /  /:/  /  /\ /__/:/ /:/\:\ /__/:/ /:/___ /__/:/ /:/\:\
    /  /:/  /  /:/ \  \:\/:/__\/ \  \:\/:::::/ \  \:\/:/~/:/
   /__/:/  /__/:/   \  \::/       \  \::/~~~~   \  \::/ /:/
   \  \:\  \  \/     \  \:\        \  \:\        \__\/ /:/
    \  \:\  \         \  \:\        \  \:\         /__/:/
     \  \:\  \         \  \:\        \  \:\        \__\/
      \__\/\__\         \__\/         \__\/
    ]], '\n', { trimempty = true })
dashboard.section.header.opts.hl = 'Comment'
dashboard.section.buttons.val = {}
dashboard.section.footer.val = 'PookieVim'
dashboard.section.footer.opts.hl = 'Comment'
alpha.setup(dashboard.opts)