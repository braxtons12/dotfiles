set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

if !exists('g:vscode')

lua << EOF
require("bufferline").setup {
	options = {
		numbers = function(opts)
			return string.format('%s ', opts.ordinal)
		end,
		right_mouse_command = "",
		offsets = {{filetype = "coc-explorer", text = "", text_align = "left"}},
		diagnostics = "coc",
		diagnostics_update_in_insert = true,
		show_buffer_icons = true,
		persist_buffer_sort = true,
		separator_style = "thick",
		always_show_bufferline = true,
		}
	}

local lualine_theme = {
	normal = {
		a = {fg = "#23272e", bg = "#98c379"},
		b = {fg = "#98c379", bg = "#23272e"},
		c = {fg = "#9daaaa", bg = "#303742"},
		x = {fg = "#9daaaa", bg = "#303742"},
		y = {fg = "#98c379", bg = "#23272e"},
		z = {fg = "#23272e", bg = "#98c379"},
	},		
	insert = {
		a = {fg = "#23272e", bg = "#61afef"},
		b = {fg = "#61afef", bg = "#23272e"},
		y = {fg = "#61afef", bg = "#23272e"},
		z = {fg = "#23272e", bg = "#61afef"},
	},
	visual = {
		a = {fg = "#23272e", bg = "#c678dd"},
		b = {fg = "#c678dd", bg = "#23272e"},
		y = {fg = "#c678dd", bg = "#23272e"},
		z = {fg = "#23272e", bg = "#c678dd"},
	},
	replace = {
		a = {fg = "#23272e", bg = "#e06c75"},
		b = {fg = "#e06c75", bg = "#23272e"},
		y = {fg = "#e06c75", bg = "#23272e"},
		z = {fg = "#23272e", bg = "#e06c75"},
	},
	command = {
		a = {fg = "#23272e", bg = "#e06c75"},
		b = {fg = "#e06c75", bg = "#23272e"},
		y = {fg = "#e06c75", bg = "#23272e"},
		z = {fg = "#23272e", bg = "#e06c75"},
	},
}

require("lualine").setup {
	options = {
		theme = lualine_theme,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		always_divide_middle = true,
	},
	extensions = {
		'quickfix',
		'fugitive',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			'branch',
			'diff',
			{ 
				'filename', 
				file_status = true,
				path = 1
			},
			{
				'%w',
				cond = function()
					return vim.wo.previewwindow
				end,
			},
			{
				'%r',
				cond = function()
					return vim.bo.readonly
				end,
			},
			{
				'%q',
				cond = function()
					return vim.bo.buftype == 'quickfix'
				end,
			},
		},
		lualine_c = { 'g:coc_status' },
		lualine_x = {
			{
				'diagnostics',
				sources = { 'coc' },
				sections = { 'error', 'warn' },
				update_in_insert = true,
				always_visible = true,
			},
		},
		lualine_y = {
			{
				'filetype'
			},
			{
				'encoding'
			},
			{
				'fileformat'		
			},
		},
		lualine_z = { 
			{
				'location'
			},
			{
				'progress'
			}
		},
	},
	inactive_sections = {
		lualine_c = { '%f %y %m' },
		lualine_x = {},
	},
}

EOF

endif
