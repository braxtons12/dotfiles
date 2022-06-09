----------------------------------------------
-- PLUGINS IN USE
----------------------------------------------

local packer = require('packer')
packer.use "vim-scripts/DoxygenToolkit.vim"
packer.use "kyazdani42/nvim-web-devicons"
packer.use "leafgarland/typescript-vim"
packer.use "vim-autoformat/vim-autoformat"
packer.use "easymotion/vim-easymotion"
packer.use "tpope/vim-fugitive"
packer.use "cespare/vim-toml"
packer.use "HerringtonDarkholme/yats.vim"
packer.use { "dstein64/nvim-scrollview",
	branch = "main"
}
packer.use "octol/vim-cpp-enhanced-highlight"
packer.use "bfrg/vim-cpp-modern"
packer.use "rakr/vim-one"
packer.use {"CosmicNvim/cosmic-ui",
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
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup {
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
		}
	end
}
packer.use { "lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup {
		}
	end
}
packer.use { "windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup {
			disable_filetype = { "TelescopePrompt" },
			disable_in_macro = true,
			disable_in_visualblock = true,
			enable_moveright = false,
			map_cr = false,
			map_bs = true,
			map_c_h = false,
			map_c_w = false,
		}
	end
}
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
						{ key = "<C-t>", action = "close", mode = "n" }
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
					webdev_colors = true,
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
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
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
		require("gitsigns").setup()
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
			log_level = vim.log.levels.WARN,
		}
	end
}
packer.use { "neovim/nvim-lspconfig",
	after = { "nvim-lsp-installer", "lua-dev.nvim" },
	config = function()
		local on_attach = function(client, buffer_num)
			vim.api.nvim_buf_set_option(buffer_num, "omnifunc", "v:lua.vim.lsp.omnifunc")

			local map = function(mode, lhs, rhs, opts)
				vim.keymap.set(mode, lhs, rhs, opts)
			end

			local nmap = function(lhs, rhs, options)
				map("n", lhs, rhs, options)
			end

			local opts = { noremap = true, silent = true, buffer = buffer_num }

			if client.resolved_capabilities.document_highlight then
				vim.cmd([[
					augroup lsp_document_highlight
					  autocmd! * <buffer>
					  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
					  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
					augroup END
					]]
				)

				vim.api.nvim_create_autocmd(

					{ "BufEnter", "BufRead", "BufWrite", "ColorScheme", "InsertChange", "InsertEnter", "WinClosed"},
					{
						pattern = { "*" },
						callback = function()
							vim.lsp.buf.document_highlight()
						end,
					}
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
			['workspace/semanticTokens/refresh'] = function(err, params, ctx, config)
				vim.lsp.buf_request(0, 'textDocument/semanticTokens/full',
					{
						textDocument = vim.lsp.util.make_text_document_params(),
						tick = vim.api.nvim_buf_get_changedtick(0)
					}, nil)
				return vim.NIL
			end,
			['textDocument/semanticTokens/full'] = function(err, result, ctx, config)
				if err or not result or ctx.params.tick ~= vim.api.nvim_buf_get_changedtick(ctx.bufnr) then
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

				-- use to print the tokens or modifiers to a new window
				--local print_tokens = function(token_types)
				--	local width = 200
				--	local height = 50
				--	local buf = vim.api.nvim_create_buf(false, true)
				--	local types = {}
				--	for i = 1, #token_types do
				--		table.insert(types, i, "LspSemantic_" .. token_types[i])
				--	end
				--	vim.api.nvim_buf_set_lines(buf, 0, #types, false, types)

				--	local ui = vim.api.nvim_list_uis()[1]
				--	local opts = {
				--		relative = "editor",
				--		width = width,
				--		height = height,
				--		col = (ui.width / 2) - (width / 2),
				--		row = (ui.height / 2) - (height / 2),
				--		anchor = "NW",
				--		style = "minimal",
				--	}

				--	local win = vim.api.nvim_open_win(buf, 1, opts)
				--end

				local bufnr = ctx.bufnr
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				local legend = client.server_capabilities.semanticTokensProvider.legend
				local token_types = legend.tokenTypes
				local token_modifiers = legend.tokenModifiers
				local data = result.data

				--print_tokens(token_types)
				--print_tokens(token_modifiers)

				local ns = vim.api.nvim_create_namespace('nvim-lsp-semantic')
				vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
				local prev_line, prev_start = nil, 0
				for i = 1, #data, 5 do
					local delta_line = data[i]
					prev_line = prev_line and prev_line + delta_line or delta_line
					local delta_start = data[i + 1]
					prev_start = delta_line == 0 and prev_start + delta_start or delta_start
					local token_type = token_types[data[i + 3] + 1]
					local modifiers = modifiers_from_number(data[i + 4], token_modifiers)
					local line = vim.api.nvim_buf_get_lines(bufnr, prev_line, prev_line + 1, false)[1]
					local byte_start = vim.str_byteindex(line, prev_start)
					local byte_end = vim.str_byteindex(line, prev_start + data[i + 2])
					vim.api.nvim_buf_add_highlight(bufnr, ns, 'LspSemantic_' .. token_type, prev_line, byte_start, byte_end)
					for i = 1, #modifiers do
						vim.api.nvim_buf_add_highlight(bufnr, ns, 'LspSemantic_' .. modifiers[i], prev_line, byte_start, byte_end)
					end
					-- require('vim.lsp.log').debug(bufnr, ns, 'LspSemantic_' .. token_type, prev_line, byte_start, byte_end)
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
				}
			elseif lsp == "sumneko_lua" then
				local lua_dev = require("lua-dev").setup({
					runtime_path = true,
					lspconfig = {
						on_attach = on_attach,
						flags = {
							debounce_text_changes = 150,
						},
					}
				})
				require("lspconfig")[lsp].setup(lua_dev)
			else
				require("lspconfig")[lsp].setup {
					on_attach = on_attach,
					flags = {
						debounce_text_changes = 150,
					},
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
		"tamago324/cmp-zsh",
		"Saecki/crates.nvim",
		{ "hrsh7th/cmp-vsnip",
			requires = { "hrsh7th/vim-vsnip" },
		}
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

					return vim_item
				end,
			},
			view = {
				entries = {
					name = "custom",
					selection_order = "near_cursor",
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
						cmp.complete()
					else
						fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#jumpable"](-1) == 1 then
						feedkey("<Plug>(vsnip-jump-prev)", "")
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "vsnip" },
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
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
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
