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

notify = require("notify")
vim.notify = notify

notify.setup(
	{
        background_colour = "Normal",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        level = "warn",
        minimum_width = 30,
        max_width = 60,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 2500
      })

local coc_status_record = {}

function coc_status_notify(msg, level)
  local notify_opts = { title = "LSP Status", timeout = 500, hide_from_history = true, on_close = reset_coc_status_record }
  -- if coc_status_record is not {} then add it to notify_opts to key called "replace"
  if coc_status_record ~= {} then
    notify_opts["replace"] = coc_status_record.id
  end
  coc_status_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_status_record(window)
  coc_status_record = {}
end

local coc_diag_record = {}

function coc_diag_notify(msg, level)
  local notify_opts = { title = "LSP Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
  -- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
  if coc_diag_record ~= {} then
    notify_opts["replace"] = coc_diag_record.id
  end
  coc_diag_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_diag_record(window)
  coc_diag_record = {}
end
EOF

function! s:StatusNotify() abort
  let l:status = get(g:, 'coc_status', '')
  let l:level = 'info'
  if empty(l:status) | return '' | endif
  call v:lua.coc_status_notify(l:status, l:level)
endfunction

function! s:InitCoc() abort
  execute "lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })"
endfunction

" notifications
autocmd User CocNvimInit call s:InitCoc()
autocmd User CocStatusChange call s:StatusNotify()
endif
