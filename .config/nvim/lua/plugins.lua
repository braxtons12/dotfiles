----------------------------------------------
-- PLUGINS IN USE
----------------------------------------------
local packer = require('packer')
packer.use "vim-scripts/DoxygenToolkit.vim"
packer.use "kyazdani42/nvim-web-devicons"
packer.use "leafgarland/typescript-vim"
packer.use "vim-autoformat/vim-autoformat"
--packer.use "easymotion/vim-easymotion"
packer.use { "phaazon/hop.nvim",
	config = function()
		require("hop").setup {
			teasing = false,
			jump_on_sole_occurrence = false,
			case_insensitive = false,
		}
	end
}
packer.use "tpope/vim-fugitive"
--packer.use { "braxtons12/blame_line.nvim",
--	config = function()
--		require("blame_line").setup {
--		}
--	end
--}
packer.use "cespare/vim-toml"
packer.use "HerringtonDarkholme/yats.vim"
packer.use { "gfeiyou/command-center.nvim",
	requires = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("telescope").load_extension("command_center")
	end
}
-- for mouse draggable scrollbar
packer.use { "dstein64/nvim-scrollview",
	branch = "main",
	config = function()
		require("scrollview").setup {
			scrollview_column = 1,
		}

	end
}
-- for lsp signs in scrollbar
packer.use { "petertriho/nvim-scrollbar",
	config = function()
		require("scrollbar").setup {
			marks = {
				Handler = { color = "#262b33" },
				Search = { color = "#dbba75" },
				Error = { color = "#c65156" },
				Warn = { color = "#d29767" },
				Hint = { color = "#9daaaa" },
				Info = { color = "#61afef" },
				Misc = { color = "#c67ada" },
			},
			autocmd = {
				render = {
					"BufWinEnter",
					"TabEnter",
					"TermEnter",
					"WinEnter",
					"CmdwinLeave",
					"TextChanged",
					"InsertChange",
					"VimResized",
					"WinScrolled",
					"BufLeave",
				},
			},
		}

		vim.cmd("highlight ScrollbarHandle guibg=#262b33")
		vim.cmd("highlight ScrollbarSearch guibg=#262b33 guifg=#dbba75")
		vim.cmd("highlight ScrollbarError guibg=#262b33 guifg=#c65156")
		vim.cmd("highlight ScrollbarWarn guibg=#262b33 guifg=#d29767")
		vim.cmd("highlight ScrollbarHint guibg=#262b33 guifg=#9daaaa")
		vim.cmd("highlight ScrollbarInfo guibg=#262b33 guifg=#61afef")
		vim.cmd("highlight ScrollbarMisc guibg=#262b33 guifg=#c67ada")
		vim.cmd("highlight ScrollbarSearchHandle guibg=#262b33 guifg=#dbba75")
		vim.cmd("highlight ScrollbarErrorHandle guibg=#262b33 guifg=#c65156")
		vim.cmd("highlight ScrollbarWarnHandle guibg=#262b33 guifg=#d29767")
		vim.cmd("highlight ScrollbarHintHandle guibg=#262b33 guifg=#9daaaa")
		vim.cmd("highlight ScrollbarInfoHandle guibg=#262b33 guifg=#61afef")
		vim.cmd("highlight ScrollbarMiscHandle guibg=#262b33 guifg=#c67ada")
	end
}
packer.use "famiu/bufdelete.nvim"
packer.use { "yamatsum/nvim-cursorline",
	config = function()
		require("nvim-cursorline").setup {
			cursorline = {
				enable = true,
				timeout = 0,
				number = true,
			},
			cursorword = {
				enable = false,
			},
		}
	end
}
packer.use "octol/vim-cpp-enhanced-highlight"
packer.use "bfrg/vim-cpp-modern"
packer.use "rakr/vim-one"
packer.use { "j-hui/fidget.nvim",
	config = function()
		require("fidget").setup {
			done = ""
		}
	end
}
packer.use { "stevearc/aerial.nvim",
	requires = "nvim-treesitter",
	config = function()
		require("aerial").setup {
			backends = {
				"treesitter",
				"lsp",
				"markdown",
			},
			close_behavior = "global",
			default_bindings = true,
			default_direction = "right",
			filter_kind = {
				"Module",
				"Class",
				"Struct",
				"Interface",
				"Constructor",
				"Method",
				"Enum",
				"Function",
			},
			highlight_mode = "split_width",
			highlight_closest = true,
			highlight_on_hover = true,
			icons = require("lspkind_icons"),
			open_automatic = true,
			max_width = { 30, 0.2 },
			min_width = 20,
			show_guides = true,
		}
	end
}
packer.use { "declancm/cinnamon.nvim",
	config = function()
		require("cinnamon").setup {
			default_keymaps = true,
			extra_keymaps = false,
			extended_keymaps = true,
			always_scroll = false,
			centered = false,
			default_delay = 0.1,
			horizontal_scroll = true,
			scroll_limit = 50,
		}
	end
}
packer.use { "nvim-treesitter/nvim-treesitter-context",
	requires = "nvim-treesitter",
	config = function()
		require("treesitter-context").setup {
			enable = true,
			max_lines = 4,
			patterns = {
				default = {
					"class",
					"function",
					"method",
					"for",
					"while",
					"if",
					"switch",
				},
			},
		}
	end
}
packer.use { "lukas-reineke/virt-column.nvim",
	config = function()
		require("virt-column").setup {
		}
	end
}
--packer.use {"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
-- 	as = "lsp_lines.nvim",
-- 	requires = "nvim-lspconfig",
-- 	config = function()
-- 		require("lsp_lines").register_lsp_virtual_lines()
-- 		vim.diagnostic.config({
-- 			virtual_text = true,
-- 			virtual_lines = {
-- 				prefix = "🔥",
-- 			},
-- 		})
-- 	end
-- }
packer.use { "CosmicNvim/cosmic-ui",
	requires = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim"
	},
	config = function()
		require("cosmic-ui").setup()
	end
}
packer.use { "folke/which-key.nvim",
	config = function()
		require("which-key").setup {
			window = {
				border = "single",
				margin = { 2, 2, 2, 2 },
				winblend = 1
			},
		}
	end
}
packer.use { "goolord/alpha-nvim",
	requires = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("alpha").setup(require("alpha.themes.dashboard").config)
	end
}
packer.use { "numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			padding = true,
			sticky = true,
			toggler = {
				line = "<leader>lc",
				block = "<leader>bc",
			},
			opleader = {
				line = "<leader>Lc",
				block = "<leader>Bc",
			},
			extra = {
				above = "<leader>lcO",
				below = "<leader>lco",
				eol = "<leader>lce"
			}
		})
	end
}
packer.use { "folke/lua-dev.nvim",
	config = function()
		require("lua-dev").setup({
			runtime_path = true,
		})
	end
}
packer.use { "nvim-telescope/telescope.nvim",
	requires = { "nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup {
			defaults = {
				mappings = {
					i = {
						["<S-A-j>"] = actions.move_selection_next,
						["<S-A-k>"] = actions.move_selection_previous,
						["<S-j>"] = actions.preview_scrolling_down,
						["<S-k>"] = actions.preview_scrolling_up,
					},
					n = {
						["<S-A-j>"] = actions.move_selection_next,
						["<S-A-k>"] = actions.move_selection_previous,
						["<S-j>"] = actions.preview_scrolling_down,
						["<S-k>"] = actions.preview_scrolling_up,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim" -- add this value
				}
			},
			extensions = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		}
		telescope.load_extension("fzf")
	end
}
packer.use { "tzachar/fuzzy.nvim",
	requires = { "nvim-telescope/telescope-fzf-native.nvim" }
}
packer.use { "lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup {
		}
	end
}
packer.use "Raimondi/delimitMate"
--packer.use { "windwp/nvim-autopairs",
-- 	config = function()
-- 		require("nvim-autopairs").setup {
-- 			disable_filetype = { "TelescopePrompt" },
-- 			disable_in_macro = true,
-- 			disable_in_visualblock = true,
-- 			enable_moveright = false,
-- 			map_cr = false,
-- 			map_bs = true,
-- 			map_c_h = false,
-- 			map_c_w = false,
-- 		}
-- 	end
--}
packer.use { "NvChad/nvterm",
	config = function()
		require("nvterm").setup({
			terminals = {
				list = {},
				type_opts = {
					float = {
						relative = "editor",
						row = 0.3,
						col = 0.25,
						width = 0.6,
						height = 0.3,
						border = "single",
					},
					horizontal = {
						location = "below",
						split_ratio = 0.3,
					},
					vertical = {
						location = "right",
						split_ratio = 0.5,
					},
				},
			},
			behavior = {
				close_on_exit = true,
				auto_insert = true,
			},
			toggle = {
				horizontal = "<T>",
				float = "<C-S-t>"
			},
		})
	end
}
packer.use { "nvim-treesitter/nvim-treesitter",
	run = "<cmd>TSUpdate<CR>",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"comment",
				"cpp",
				"c_sharp",
				"css",
				"cuda",
				"d",
				"gdscript",
				"glsl",
				"go",
				"hjson",
				"html",
				"java",
				"javascript",
				"json",
				"json5",
				"jsonc",
				"kotlin",
				"lua",
				"python",
				"rust",
				"toml",
				"typescript",
				"vim",
				"yaml",
				"zig",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		}
	end
}
packer.use { "kyazdani42/nvim-tree.lua",
	requires = "kyazdani42/nvim-web-devicons",
	tag = "nightly",
	config = function()
		require("nvim-tree").setup {
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			respect_buf_cwd = true,
			view = {
				mappings = {
					list = {
						{ key = "<C-t>", action = "close", mode = "n" },
						{ key = "e", action = "edit", mode = "n" }
					}
				}
			},
			renderer = {
				highlight_git = true,
				highlight_opened_files = "all",
				indent_markers = {
					enable = true,
					icons = {
						corner = "└ ",
						edge = "│ ",
						--item = "│ ",
						none = "  ",
					},
				},
				icons = {
					webdev_colors = false,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "M",
							staged = "",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			actions = {
				change_dir = {
					enable = false,
				},
			},
		}
	end
}
packer.use { "lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup {
			current_line_blame = true,
			current_line_blame_formatter = " <author> • <author_time:%R> • <summary>",
			current_line_blame_opts = {
				delay = 0
			}
		}
	end
}
packer.use { "folke/trouble.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	after = "nvim-lspconfig",
	config = function()
		require("trouble").setup {
			mode = "document_diagnostics",
			action_keys = {
				close = "<C-l><C-k>",
				cancel = "<esc>",
				refresh = "<C-r>",
				jump = "<CR>",
				open_split = "<C-A-S-h>",
				open_vsplit = "<C-A-S-s>",
				open_tab = "<C-A-S-t>",
				jump_close = "<C-CR>",
				hover = "<C-A-S-k>"
			},
			auto_preview = "false",
			signs = {
				error = " ",
				warning = " ",
				hint = " ",
				information = " "
			},
			use_diagnostic_signs = false,
		}
	end
}
packer.use { "akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup {
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
					{
						filetype = "Outline",
						text = "",
						highlight = "Directory",
						text_align = "left",
					},
				},
				right_mouse_command = "",
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = true,
				show_buffer_icons = true,
				separator_style = "thick",
				always_show_bufferline = true,
			}
		}
	end
}
packer.use { "rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		vim.notify = notify
		notify.setup(
			{
				background_colour = "Normal",
				fps = 30,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "",
					WARN = ""
				},
				level = "warn",
				minimum_width = 30,
				max_width = 60,
				render = "default",
				stages = "fade_in_slide_out",
				timeout = 2500
			})
	end
}
packer.use { "nvim-lualine/lualine.nvim",
	config = function()
		local lualine_theme = {
			normal = {
				a = { fg = "#23272e", bg = "#98c379" },
				b = { fg = "#98c379", bg = "#23272e" },
				c = { fg = "#9daaaa", bg = "#303742" },
				x = { fg = "#9daaaa", bg = "#303742" },
				y = { fg = "#98c379", bg = "#23272e" },
				z = { fg = "#23272e", bg = "#98c379" },
			},
			insert = {
				a = { fg = "#23272e", bg = "#61afef" },
				b = { fg = "#61afef", bg = "#23272e" },
				y = { fg = "#61afef", bg = "#23272e" },
				z = { fg = "#23272e", bg = "#61afef" },
			},
			visual = {
				a = { fg = "#23272e", bg = "#c678dd" },
				b = { fg = "#c678dd", bg = "#23272e" },
				y = { fg = "#c678dd", bg = "#23272e" },
				z = { fg = "#23272e", bg = "#c678dd" },
			},
			replace = {
				a = { fg = "#23272e", bg = "#e06c75" },
				b = { fg = "#e06c75", bg = "#23272e" },
				y = { fg = "#e06c75", bg = "#23272e" },
				z = { fg = "#23272e", bg = "#e06c75" },
			},
			command = {
				a = { fg = "#23272e", bg = "#e06c75" },
				b = { fg = "#e06c75", bg = "#23272e" },
				y = { fg = "#e06c75", bg = "#23272e" },
				z = { fg = "#23272e", bg = "#e06c75" },
			},
		}
		require("lualine").setup {
			options = {
				theme = lualine_theme,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				always_divide_middle = true,
				globalstatus = true,
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
				lualine_c = {},
				lualine_x = {
					{
						'diagnostics',
						sources = { 'nvim_lsp' },
						sections = { 'error', 'warn', 'info' },
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
	end
}
packer.use { "williamboman/nvim-lsp-installer",
	config = function()
		require("nvim-lsp-installer").setup {
			ensure_installed = {
				"asm_lsp",
				"bashls",
				--"ccls",
				"clangd",
				"omnisharp",
				"cmake",
				"cssls",
				"gopls",
				"html",
				"rust_analyzer",
				"ltex",
				"marksman",
				"pyright",
				"sumneko_lua",
				"taplo",
				"tsserver",
			},
			automatic_installation = true,
			ui = {
				icons = {
					server_installed = "",
					server_pending = "➜",
					server_uninstalled = "",
				},
			},
			log_level = vim.log.levels.WARN,
		}
	end
}
packer.use { "neovim/nvim-lspconfig",
	after = { "nvim-lsp-installer", "lua-dev.nvim", "aerial.nvim" },
	config = function()
		local on_attach = function(client, buffer_num)
			require("aerial").on_attach(client, buffer_num)
			vim.api.nvim_buf_set_option(buffer_num, "omnifunc", "v:lua.vim.lsp.omnifunc")

			if client.server_capabilities.documentHighlightProvider
				or client.server_capabilities.semanticTokensProvider then
				-- when support gets merged into mainline
				--vim.lsp.with(
				--	"textDocument/semanticTokens/full",
				--	{
				--		on_token = function(ctx, token)
				--			local ns = vim.api.nvim_create_namespace('nvim-lsp-semantic')
				--			local byte_start = vim.str_byteindex(token.line, token.start_char)
				--			local byte_end = vim.str_byteindex(token.line, token.start_char + token.length)
				--			vim.api.nvim_buf_add_highlight(ctx.bufnr, ns, 'LspSemantic_' .. token.type, token.line, byte_start, byte_end)
				--			for idx = 1, #token.modifiers do
				--				vim.api.nvim_buf_add_highlight(ctx.bufnr, ns, 'LspSemantic_' .. token.modifiers[idx], token.line, byte_start, byte_end)
				--			end
				--		end,
				--		on_invalidate_range = function(ctx, line_start, line_end)
				--			local ns = vim.api.nvim_create_namespace('nvim-lsp-semantic')
				--			vim.api.nvim_buf_clear_namespace(ctx.bufnr, ns, line_start, line_end)
				--		end
				--	})

			 	--when support gets merged into mainline, add this into augroup below
			 	--autocmd BufEnter,BufRead,BufWrite,ColorScheme,InsertChange,WinClosed,CursorHold <buffer> lua require("vim.lsp.semantic_tokens").refresh(vim.api.nvim_get_current_buf())
				vim.cmd([[
					augroup lsp_document_highlight
					  autocmd BufEnter,BufRead,BufWrite,ColorScheme,InsertChange,WinClosed,CursorHold <buffer> lua vim.lsp.buf.document_highlight()
					  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
					augroup END
					]]
				)
			end
		end

		local servers = {
			"asm_lsp",
			"bashls",
			"clangd",
			--"ccls",
			"omnisharp",
			"cmake",
			"cssls",
			"gopls",
			"html",
			"rust_analyzer",
			"ltex",
			"marksman",
			"pyright",
			"taplo",
			"tsserver",
			"sumneko_lua",
		}

		local semantic_token_handlers = {
			['workspace/semanticTokens/refresh'] = function(_, _, _, _)
				vim.lsp.buf_request(0, 'textDocument/semanticTokens/full',
					{
						textDocument = vim.lsp.util.make_text_document_params(nil),
						tick = vim.api.nvim_buf_get_changedtick(0)
					}, nil)
				return vim.NIL
			end,
			['textDocument/semanticTokens/full'] = function(err, response, ctx, _)
				local client = vim.lsp.get_client_by_id(ctx.client_id)

				if not client then
					return
				end

				if err or not response or ctx.params.tick ~= vim.api.nvim_buf_get_changedtick(ctx.bufnr) then
					return
				end

				-- temporary handler until native support lands
				local function get_bit(n, k)
					--todo(theHamsta): remove once `bit` module is available for non-LuaJIT
					if _G.bit then
						return _G.bit.band(_G.bit.rshift(n, k), 1)
					else
						return math.floor((n / math.pow(2, k)) % 2)
					end
				end

				local modifiers_from_number = function(x, modifiers_table)
					local modifiers = {}
					for i = 0, #modifiers_table - 1 do
						local bit = get_bit(x, i)
						if bit == 1 then
							table.insert(modifiers, 1, modifiers_table[i + 1])
						end
					end

					return modifiers
				end

				local bufnr = ctx.bufnr
				local legend = client.server_capabilities.semanticTokensProvider.legend
				local token_types = legend.tokenTypes
				local token_modifiers = legend.tokenModifiers
				local data = response.data

				local ns = vim.api.nvim_create_namespace('nvim-lsp-semantic')
				vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
				local line
				local start_char = 0
				for i = 1, #data, 5 do
					local delta_line = data[i]
					line = line and line + delta_line or delta_line
					local delta_start = data[i + 1]
					start_char = delta_line == 0 and start_char + delta_start or delta_start
					local token_type = token_types[data[i + 3] + 1]
					local modifiers = modifiers_from_number(data[i + 4], token_modifiers)
					local token_line = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, false)[1]
					local tok_len = string.len(token_line)
					local str_start_pos = start_char
					if not (str_start_pos < tok_len) then
						str_start_pos = tok_len
					end
					local str_end_pos = start_char + data[i + 2]
					if not (str_end_pos <= tok_len) then
						str_end_pos = tok_len
					end
					local byte_start = vim.str_byteindex(token_line, str_start_pos)
					local byte_end = vim.str_byteindex(token_line, str_end_pos)
					vim.api.nvim_buf_add_highlight(bufnr, ns, 'LspSemantic_' .. token_type, line, byte_start, byte_end)
					for idx = 1, #modifiers do
						vim.api.nvim_buf_add_highlight(bufnr, ns, 'LspSemantic_' .. modifiers[idx], line, byte_start, byte_end)
					end
				end
			end
		}

		local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
		capabilities['workspace']['semanticTokens'] = { refreshSupport = true }

		for _, lsp in pairs(servers) do
			if lsp == "clangd" then
				require("lspconfig")[lsp].setup {
					capabilities = capabilities,
					on_attach = on_attach,
					flags = {
						debounce_text_changes = 150,
					},
					cmd = {
						"clangd",
						"--background-index",
						"--suggest-missing-includes",
						"--enable-config"
					},
					handlers = semantic_token_handlers,
				}
			elseif lsp == "rust_analyzer" then
				require("lspconfig")[lsp].setup {
					capabilities = capabilities,
					on_attach = on_attach,
					flags = {
						debounce_text_changes = 150,
					},
					settings = {
						["rust_analyzer"] = {
							checkOnSave = {
								comamnd = "clippy"
							},
						},
					},
					handlers = semantic_token_handlers
				}
			elseif lsp == "sumneko_lua" then
				local lua_dev = require("lua-dev").setup({
					runtime_path = true,
					lspconfig = {
						on_attach = on_attach,
						flags = {
							debounce_text_changes = 150,
						},
					},
					handlers = semantic_token_handlers
				})
				require("lspconfig")[lsp].setup(lua_dev)
			else
				require("lspconfig")[lsp].setup {
					on_attach = on_attach,
					flags = {
						debounce_text_changes = 150,
					},
					handlers = semantic_token_handlers
				}
			end
		end
	end
}
packer.use { "hrsh7th/nvim-cmp",
	after = {
		"nvim-lspconfig"
	},
	requires = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-git",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lua",
		{
			"tamago324/cmp-zsh",
			event = {
				"BufRead .zshrc",
				"BufRead *.sh",
				"BufRead .bashrc"
			},
			config = function()
				require("cmp_zsh").setup {
					zshrc = true,
				}
			end
		},
		{ "Saecki/crates.nvim",
			event = { "BufRead Cargo.toml" },
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("crates").setup {
				}
			end
		},
		{ "hrsh7th/cmp-vsnip",
			requires = { "hrsh7th/vim-vsnip" },
		},
		{
			"tzachar/cmp-fuzzy-path",
			requires = { "tzachar/fuzzy.nvim" }
		},
	},
	config = function()
		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local feedkey = function(key, mode)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
		end

		local border = {
			--{ "┌", "FloatBorder" },
			--{ "─", "FloatBorder" },
			--{ "┐", "FloatBorder" },
			--{ "│", "FloatBorder" },
			--{ "┘", "FloatBorder" },
			--{ "─", "FloatBorder" },
			--{ "└", "FloatBorder" },
			--{ "│", "FloatBorder" },
			{ "╭", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╮", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "╯", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╰", "FloatBorder" },
			{ "│", "FloatBorder" },
		}

		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			window = {
				--completion = cmp.config.window.bordered("square"),
				--documentation = cmp.config.window.bordered("square"),
				completion = {
					border = border,
				},
				documentation = {
					border = border,
				},
			},
			formatting = {
				format = function(_, vim_item)
					local icons = require("lspkind_icons")
					vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
					vim_item.abbr = string.sub(vim_item.abbr, 1, 75)

					return vim_item
				end,
			},
			view = {
				entries = {
					name = "custom",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-space>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						feedkey("<Plug>(vsnip-expand-or-jump)", "")
					elseif has_words_before() then
						cmp.complete(nil)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#jumpable"](-1) == 1 then
						feedkey("<Plug>(vsnip-jump-prev)", "")
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping.confirm({ select = false })
			}),
			--cmp.mapping(function()
			--	if cmp.visible() then
			--		if vim.fn["vsnip#available"](1) == 1 then
			--			feedkey("<Plug>(vsnip-expand-or-jump)", "")
			--			return true
			--		else
			--			cmp.mapping.confirm({ select = false })()
			--			return true
			--		end
			--	else
			--		if vim.loop.os_uname().sysname == "Windows" then
			--			vim.api.nvim_feedkeys("\r\n", "t", false)
			--		else
			--			vim.api.nvim_feedkeys("\n", "t", false)
			--		end
			--		return true

			--		--fallback()
			--	end
			--end, { "i", "s" })
			sources = cmp.config.sources({
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "vsnip" },
				{ name = "crates" },
				{ name = "cmp_zsh" },
			},
				{
					{ name = "buffer" },
				}),
		})

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" },
			},
				{
					{ name = "buffer" },
				}),
		})

		cmp.setup.filetype("lua", {
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "cmp_nvim_lua" },
			},
				{
					{ name = "buffer" },
				}),
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "nvim_lsp_document_symbol" },
			},
				{
					{ name = "buffer" },
				}),
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "fuzzy_path" },
			}, {
				{ name = "cmdline" },
			})
		})

		--local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

		--local servers = {
		--	"asm_lsp",
		--	"bashls",
		--	"clangd",
		--	--"ccls",
		--	"omnisharp",
		--	"cmake",
		--	"cssls",
		--	"gopls",
		--	"html",
		--	"rust_analyzer",
		--	"ltex",
		--	"marksman",
		--	"pyright",
		--	"taplo",
		--	"tsserver",
		--	"sumneko_lua",
		--}
		--for _, lsp in pairs(servers) do
		--	require("lspconfig")[lsp].setup {
		--		capabilities = capabilities
		--	}
		--end
	end
}

vim.cmd [[packadd nvim-lspconfig]]
