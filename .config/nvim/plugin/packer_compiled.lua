-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/braxton/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/braxton/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/braxton/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/braxton/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/braxton/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\nextra\1\0\3\nbelow\16<leader>lco\beol\16<leader>lce\nabove\16<leader>lcO\ropleader\1\0\2\nblock\15<leader>Bc\tline\15<leader>Lc\ftoggler\1\0\2\nblock\15<leader>bc\tline\15<leader>lc\1\0\2\vsticky\2\fpadding\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["DoxygenToolkit.vim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/DoxygenToolkit.vim",
    url = "https://github.com/vim-scripts/DoxygenToolkit.vim"
  },
  ["aerial.nvim"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n�\4\0\0\6\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0026\3\0\0'\5\b\0B\3\2\2=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\14\0006\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\nfloat\15min_height\1\3\0\0\3\1\3\1\vborder\vBORDER\1\0\2\15max_height\3\1\rrelative\bwin\vlayout\14max_width\1\0\3\22default_direction\nright\14min_width\3\20\14placement\tedge\1\3\0\0\3\30\4����\t����\3\nicons\18lspkind_icons\16filter_kind\1\t\0\0\vModule\nClass\vStruct\14Interface\16Constructor\vMethod\tEnum\rFunction\rbackends\1\0\a\16show_guides\2\19open_automatic\1\23highlight_on_hover\2\22highlight_closest\2\19highlight_mode\16split_width\21default_bindings\2\16attach_mode\vglobal\1\4\0\0\15treesitter\blsp\rmarkdown\nsetup\vaerial\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["barbecue.nvim"] = {
    after = { "neo-tree.nvim" },
    config = { "\27LJ\2\n:\0\1\4\0\3\0\0066\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\1K\0\1\0\vupdate\16barbecue.ui\frequire�\4\1\0\b\0\24\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0026\3\0\0'\5\6\0B\3\2\2=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0005\2\17\0005\3\20\0006\4\14\0009\4\15\0049\4\18\4'\6\19\0004\a\0\0B\4\3\2=\4\21\0033\4\22\0=\4\23\3B\0\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\28barbecue#create_autocmd\24nvim_create_augroup\1\v\0\0\16WinScrolled\16BufWinEnter\16BufWinLeave\15CursorHold\16CursorMoved\17CursorMovedI\16InsertLeave\17BufWritePost\16TextChanged\17TextChangedI\24nvim_create_autocmd\bapi\bvim\22exclude_filetypes\1\6\0\0\14gitcommit\15toggleterm\vaerial\rneo-tree\rterminal\ntheme\vnormal\1\0\0\1\0\2\abg\f#24292f\afg\f#9daaaa\nkinds\18lspkind_icons\fsymbols\1\0\1\14separator\b\1\0\3\18show_modified\2\17attach_navic\1\19create_autocmd\1\nsetup\rbarbecue\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/barbecue.nvim",
    url = "https://github.com/utilyre/barbecue.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\a\0004\4\5\0005\5\3\0>\5\1\0045\5\4\0>\5\2\0045\5\5\0>\5\3\0045\5\6\0>\5\4\4=\4\b\0035\4\t\0005\5\n\0=\5\v\4=\4\f\3=\3\14\2B\0\2\1K\0\1\0\foptions\1\0\0\nhover\vreveal\1\2\0\0\nclose\1\0\2\ndelay\3�\1\fenabled\2\foffsets\1\0\b\24show_tab_indicators\2\22show_buffer_icons\2\16color_icons\2!diagnostics_update_in_insert\2\16diagnostics\rnvim_lsp\24right_mouse_command\5\27always_show_bufferline\2\20separator_style\nthick\1\0\4\14highlight\14Directory\ttext\fOutline\15text_align\nright\rfiletype\vaerial\1\0\4\14highlight\14Directory\ttext\5\15text_align\nright\rfiletype\fOutline\1\0\4\14highlight\14Directory\ttext\5\15text_align\tleft\rfiletype\rneo-tree\1\0\4\14highlight\14Directory\ttext\vPacker\15text_align\tleft\rfiletype\vpacker\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cinnamon.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\b\20default_keymaps\2\17scroll_limit\0032\22horizontal_scroll\2\18default_delay\4����\t����\3\rcentered\1\18always_scroll\1\21extended_keymaps\2\18extra_keymaps\1\nsetup\rcinnamon\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cinnamon.nvim",
    url = "https://github.com/declancm/cinnamon.nvim"
  },
  ["clangd_extensions.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\23\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\5\0005\2\4\0=\2\6\1=\1\3\0006\1\0\0'\3\a\0B\1\2\0029\1\b\0015\3\17\0005\4\t\0=\0\n\0046\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\4=\4\18\0035\4\20\0005\5\19\0=\5\21\4=\4\22\3B\1\2\1K\0\1\0\15extensions\16inlay_hints\1\0\0\1\0\2\23other_hints_prefix\b-> \27parameter_hints_prefix\nfn : \vserver\1\0\0\bcmd\1\5\0\0\vclangd\23--background-index\31--suggest-missing-includes\20--enable-config\nflags\1\0\1\26debounce_text_changes\3�\1\14on_attach\18LSP_ON_ATTACH\17capabilities\1\0\0\nsetup\22clangd_extensions\19semanticTokens\1\0\0\1\0\1\19refreshSupport\2\14workspace\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-fuzzy-path"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-fuzzy-path",
    url = "https://github.com/tzachar/cmp-fuzzy-path"
  },
  ["cmp-git"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-git",
    url = "https://github.com/hrsh7th/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["cmp-zsh"] = {
    after_files = { "/home/braxton/.local/share/nvim/site/pack/packer/opt/cmp-zsh/after/plugin/cmp_zsh.lua" },
    config = { "\27LJ\2\nC\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nzshrc\2\nsetup\fcmp_zsh\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/cmp-zsh",
    url = "https://github.com/tamago324/cmp-zsh"
  },
  ["command_center.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\19command_center\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/command_center.nvim",
    url = "https://github.com/FeiyouG/command_center.nvim"
  },
  ["cosmic-ui"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14cosmic-ui\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cosmic-ui",
    url = "https://github.com/CosmicNvim/cosmic-ui"
  },
  ["crates.nvim"] = {
    after_files = { "/home/braxton/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/Saecki/crates.nvim"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\28current_line_blame_opts\1\0\1\ndelay\3\0\1\0\2\23current_line_blame\2!current_line_blame_formatter4 <author> • <author_time:%R> • <summary>\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\26\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\r\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\4=\4\14\0035\4\16\0005\5\15\0=\5\6\0045\5\17\0=\5\b\0045\5\18\0=\5\n\0045\5\19\0=\5\f\4=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\vextras\1\0\1\21named_parameters\2\23paint_catch_blocks\1\0\2\17declarations\2\vusages\2\22excluded_argnames\vusages\1\2\0\0\tthis\1\2\0\0\tself\1\2\0\0\tself\1\0\0\1\3\0\0\tself\bcls\17declarations\1\0\0\bcpp\1\2\0\0\tthis\trust\1\2\0\0\tself\blua\1\2\0\0\tself\vpython\1\0\0\1\3\0\0\tself\bcls\1\0\3\21paint_arg_usages\2\27paint_arg_declarations\2\ncolor\f#588496\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nl\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\fteasing\1\21case_insensitive\1\28jump_on_sole_occurrence\1\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0+\1\1\0=\1\5\0K\0\1\0004indent_blankline_show_trailing_blankline_indent\6g\bvim\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\18virtual_lines\1\0\1\vprefix\t🔥\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["ltex-extra.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/ltex-extra.nvim",
    url = "https://github.com/barreiroleo/ltex-extra.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n,\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\18previewwindow\awo\bvim'\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\rreadonly\abo\bvimC\0\0\1\0\4\0\t6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\rquickfix\fbuftype\abo\bvim�\r\1\0\b\0S\0{5\0\r\0005\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0=\2\n\0015\2\v\0=\2\f\1=\1\14\0005\1\16\0005\2\15\0=\2\2\0015\2\17\0=\2\4\0015\2\18\0=\2\n\0015\2\19\0=\2\f\1=\1\20\0005\1\22\0005\2\21\0=\2\2\0015\2\23\0=\2\4\0015\2\24\0=\2\n\0015\2\25\0=\2\f\1=\1\26\0005\1\28\0005\2\27\0=\2\2\0015\2\29\0=\2\4\0015\2\30\0=\2\n\0015\2\31\0=\2\f\1=\1 \0005\1\"\0005\2!\0=\2\2\0015\2#\0=\2\4\0015\2$\0=\2\n\0015\2%\0=\2\f\1=\1&\0006\1'\0'\3(\0B\1\2\0029\1)\0015\0030\0005\4*\0=\0+\0045\5,\0=\5-\0045\5.\0=\5/\4=\0041\0035\0042\0=\0043\0035\0045\0005\0054\0=\0056\0045\0057\0005\0068\0>\6\3\0055\0069\0003\a:\0=\a;\6>\6\4\0055\6<\0003\a=\0=\a;\6>\6\5\0055\6>\0003\a?\0=\a;\6>\6\6\0055\6@\0>\6\a\5=\5A\0044\5\0\0=\5B\0044\5\3\0005\6C\0005\aD\0=\aE\0065\aF\0=\aG\6>\6\1\5=\5H\0044\5\4\0005\6I\0>\6\1\0055\6J\0>\6\2\0055\6K\0>\6\3\5=\5L\0044\5\3\0005\6M\0>\6\1\0055\6N\0>\6\2\5=\5O\4=\4G\0035\4Q\0005\5P\0=\5B\0044\5\0\0=\5H\4=\4R\3B\1\2\1K\0\1\0\22inactive_sections\1\0\0\1\2\0\0\r%f %y %m\14lualine_z\1\2\0\0\rprogress\1\2\0\0\rlocation\14lualine_y\1\2\0\0\15fileformat\1\2\0\0\rencoding\1\2\0\0\rfiletype\14lualine_x\rsections\1\4\0\0\nerror\twarn\tinfo\fsources\1\2\0\0\rnvim_lsp\1\2\2\0\16diagnostics\19always_visible\2\21update_in_insert\2\14lualine_c\14lualine_b\1\2\0\0\16searchcount\0\1\2\0\0\a%q\0\1\2\0\0\a%r\tcond\0\1\2\0\0\a%w\1\2\2\0\rfilename\tpath\3\1\16file_status\2\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\15extensions\1\a\0\0\vaerial\rquickfix\rfugitive\rneo-tree\16nvim-dap-ui\15toggleterm\foptions\1\0\0\23section_separators\1\0\2\tleft\b\nright\b\25component_separators\1\0\2\tleft\5\nright\5\ntheme\1\0\2\17globalstatus\2\25always_divide_middle\2\nsetup\flualine\frequire\fcommand\1\0\2\abg\f#e06c75\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\0\1\0\2\abg\f#e06c75\afg\f#23272e\freplace\1\0\2\abg\f#e06c75\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\0\1\0\2\abg\f#e06c75\afg\f#23272e\vvisual\1\0\2\abg\f#c678dd\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#c678dd\1\0\2\abg\f#23272e\afg\f#c678dd\1\0\0\1\0\2\abg\f#c678dd\afg\f#23272e\vinsert\1\0\2\abg\f#61afef\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#61afef\1\0\2\abg\f#23272e\afg\f#61afef\1\0\0\1\0\2\abg\f#61afef\afg\f#23272e\vnormal\1\0\0\6z\1\0\2\abg\f#98c379\afg\f#23272e\6y\1\0\2\abg\f#23272e\afg\f#98c379\6x\1\0\2\abg\f#303742\afg\f#9daaaa\6c\1\0\2\abg\f#303742\afg\f#9daaaa\6b\1\0\2\abg\f#23272e\afg\f#98c379\6a\1\0\0\1\0\2\abg\f#98c379\afg\f#23272e\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\18\0\0\fasm_lsp\vbashls\vclangd\14gradle_ls\14omnisharp\ncmake\ncssls\ngopls\thtml\18rust_analyzer\tltex\njdtls\rmarksman\fpyright\16sumneko_lua\ntaplo\rtsserver\nsetup\20mason-lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    after = { "nvim-dap", "mason-lspconfig.nvim" },
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\22package_installed\b✓\24package_uninstalled\b✗\20package_pending\b➜\nsetup\nmason\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n[\0\1\3\0\a\0\n6\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\1\4�6\1\0\0009\1\4\1'\2\6\0=\2\5\1K\0\1\0\tauto\15signcolumn\awo\rneo-tree\rfiletype\abo\bvim�\14\1\0\6\0000\0=6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\0025\3\t\0005\4\n\0=\4\v\3=\3\f\0025\3\14\0005\4\r\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\21\0005\5\20\0=\5\22\4=\4\23\3=\3\24\0025\3\25\0005\4\26\0=\4\27\3=\3\28\0025\3 \0005\4\29\0005\5\30\0=\5\31\4=\4!\0035\4#\0005\5\"\0=\5\27\4=\4\28\3=\3$\0025\3%\0005\4'\0005\5&\0=\5\27\4=\4\28\3=\3(\0025\3+\0005\4*\0005\5)\0=\5\27\4=\4\28\3=\3\23\0024\3\3\0005\4,\0003\5-\0=\5.\4>\4\1\3=\3/\2B\0\2\1K\0\1\0\19event_handlers\fhandler\0\1\0\1\nevent\21vim_buffer_enter\1\0\0\1\0\0\1\0\a\6a\17git_add_file\6u\21git_unstage_file\6A\16git_add_all\6p\rgit_push\acp\24git_commit_and_push\6r\20git_revert_file\6c\15git_commit\fbuffers\1\0\0\1\0\1\abd\18buffer_delete\1\0\1\18show_unloaded\2\15filesystem\1\0\0\1\0\3\6H\18toggle_hidden\n<c-x>\17clear_filter\6/\21filter_on_submit\19filtered_items\1\0\3\26hijack_netrw_behavior\17open_current\24follow_current_file\2\27use_libuv_file_watcher\2\17hide_by_name\1\5\0\0\14.DS_Store\14thumbs.db\17node_modules\16__pycache__\1\0\3\18hide_dotfiles\1\fvisible\1\20hide_gitignored\1\vwindow\rmappings\1\0\r\t<cr>\topen\18<2-LeftMouse>\topen\6p\25paste_from_clipboard\6R\frefresh\6y\22copy_to_clipboard\6r\vrename\n<C-t>\17close_window\6d\vdelete\6a\badd\6e\topen\6q\17close_window\6x\21cut_to_clipboard\6s\16open_vsplit\1\0\2\rposition\tleft\nwidth\3\30\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\fdeleted\b\nadded\b\rconflict\b\vstaged\b✓\runstaged\b✗\fignored\b◌\14untracked\b★\frenamed\b➜\rmodified\b\tname\1\0\2\26use_git_status_colors\2\19trailing_slash\1\ticon\1\0\4\16folder_open\b\fdefault\b\18folder_closed\b\17folder_empty\b\vindent\1\0\0\1\0\n\18indent_marker\b│\23expander_collapsed\b\19with_expanders\2\14highlight\24NeoTreeIndentMarker\23last_indent_marker\b└\fpadding\3\0\17with_markers\2\16indent_size\3\2\23expander_highlight\20NeoTreeExpander\22expander_expanded\b\20source_selector\15tab_labels\1\0\4\15filesystem\r File\fbuffers\15 Buffer\16diagnostics\r裂Lints\15git_status\f Git\1\0\4\15statusline\1\vwinbar\2\19content_layout\nstart\"show_scrolled_off_parent_node\1\fsources\1\0\5\25close_if_last_window\2\23enable_diagnostics\2\26sort_case_insensitive\2\22enable_git_status\2\23popup_border_style\frounded\1\3\0\0\15filesystem\15git_status\nsetup\rneo-tree\frequire.let g:neo_tree_remove_legacy_commands = 1\bcmd\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneodev\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n�\b\0\0\b\0-\0=5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0005\6\n\0=\6\v\5=\5\f\0045\5\r\0=\5\14\4=\4\16\0035\4\17\0=\4\18\0035\4\27\0005\5\23\0005\6\19\0=\0\20\0065\a\21\0=\a\22\6=\6\24\0055\6\25\0=\6\26\5=\5\28\0045\5\31\0005\6\29\0=\0\20\0065\a\30\0=\a\22\6=\6\24\0055\6 \0=\6\26\5=\5!\0045\5\"\0005\6#\0=\6$\0055\6%\0=\0\20\0065\a&\0=\a\22\6=\6\24\0055\6'\0=\6\26\5=\5\b\4=\4(\3B\1\2\0016\1)\0009\1*\1'\3+\0B\1\2\0016\1)\0009\1*\1'\3,\0B\1\2\1K\0\1\0,hi! link NoiceConfirmBorder FloatBorder1hi! link NoiceCmdlinePopupBorder FloatBorder\bcmd\bvim\nviews\1\0\2\17winhighlight)Normal:Pmenu,FloatBorder:FloatBorder\rwinblend\3\0\1\3\0\0\3\0\3\0\1\0\0\rposition\1\0\2\brow\3\2\bcol\3\2\1\0\1\rrelative\vcursor\14popupmenu\1\0\2\17winhighlight)Normal:Pmenu,FloatBorder:FloatBorder\rwinblend\3\0\1\0\0\1\3\0\0\3\0\3\0\1\0\0\18cmdline_popup\1\0\0\16win_options\1\0\2\17winhighlight)Normal:Pmenu,FloatBorder:FloatBorder\rwinblend\3\0\vborder\1\0\0\fpadding\1\3\0\0\3\0\3\0\nstyle\1\0\0\fpresets\1\0\3\18bottom_search\1\15inc_rename\2\20command_palette\2\blsp\1\0\0\rprogress\1\0\2\fenabled\2\rthrottle\4ժժ\5ժ��\4\14signature\14auto_open\1\0\4\ftrigger\2\rthrottle\3(\fenabled\2\fluasnip\2\1\0\1\fenabled\2\nhover\1\0\1\fenabled\2\roverride\1\0\0\1\0\3\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2 cmp.entry.get_documentation\2\nsetup\nnoice\frequire\1\t\0\0\b┏\b━\b┓\b┃\b┛\b━\b┗\b┃\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\1\0\2\n\0\t\0\0206\2\0\0'\4\1\0B\2\2\0029\3\2\0018\3\3\0029\4\2\1=\3\2\0016\5\4\0009\5\5\0059\a\3\1)\b\1\0)\tK\0B\5\4\2=\5\3\1'\5\a\0\18\6\4\0'\a\b\0&\5\a\5=\5\6\1L\1\2\0\6)\t   (\tmenu\bsub\vstring\tabbr\tkind\18lspkind_icons\frequire�\1\0\1\5\3\b\1!-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\23�6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5�-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\v�-\1\2\0B\1\1\2\15\0\1\0X\2\5�-\1\0\0009\1\a\1+\3\0\0B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\2�\1�\0�\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\21select_next_item\fvisible\2�\1\0\1\5\2\a\1\24-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\14�6\1\2\0009\1\3\0019\1\4\1)\3��B\1\2\2\t\1\0\0X\1\5�-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\2�\1�\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2�\17\1\0\14\0]\0�\0023\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0024\3\t\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\0035\4\v\0>\4\b\0039\4\f\0025\6\16\0005\a\14\0003\b\r\0=\b\15\a=\a\17\0065\a\21\0005\b\18\0006\t\19\0=\t\20\b=\b\22\a5\b\23\0006\t\19\0=\t\20\b=\b\24\a=\a\25\0065\a\27\0005\b\26\0=\b\28\a3\b\29\0=\b\30\a=\a\31\0065\a!\0005\b \0=\b\"\a=\a#\0065\a,\0004\b\a\0009\t$\0029\t%\t9\t&\t>\t\1\b9\t$\0029\t%\t9\t'\t>\t\2\b9\t$\0029\t%\t9\t(\t>\t\3\b9\t$\0029\t%\t9\t)\t>\t\4\b9\t$\0029\t%\t9\t*\t>\t\5\b9\t$\0029\t%\t9\t+\t>\t\6\b=\b-\a=\a.\0069\a/\0029\a0\a9\a1\a5\t3\0009\n/\0029\n2\nB\n\1\2=\n4\t9\n/\0023\f5\0005\r6\0B\n\3\2=\n7\t9\n/\0023\f8\0005\r9\0B\n\3\2=\n:\t9\n/\0029\n;\n5\f<\0B\n\2\2=\n=\tB\a\2\2=\a/\0069\a$\0029\a>\a4\t\5\0005\n?\0>\n\1\t5\n@\0>\n\2\t5\nA\0>\n\3\t5\nB\0>\n\4\t4\n\3\0005\vC\0>\v\1\nB\a\3\2=\a>\6B\4\2\0019\4\f\0029\4D\4'\6E\0005\aH\0009\b$\0029\b>\b4\n\3\0005\vF\0>\v\1\n4\v\3\0005\fG\0>\f\1\vB\b\3\2=\b>\a5\bI\0004\t\a\0009\n$\0029\n%\n9\n&\n>\n\1\t9\n$\0029\n%\n9\n'\n>\n\2\t9\n$\0029\n%\n9\n(\n>\n\3\t9\n$\0029\n%\n9\n)\n>\n\4\t9\n$\0029\n%\n9\n*\n>\n\5\t9\n$\0029\n%\n9\n+\n>\n\6\t=\t-\b=\b.\aB\4\3\0019\4\f\0029\4D\4'\6J\0005\aN\0009\b$\0029\b>\b4\n\4\0005\vK\0>\v\1\n5\vL\0>\v\2\n5\vM\0>\v\3\nB\b\2\2=\b>\a5\bO\0004\t\a\0009\n$\0029\n%\n9\n&\n>\n\1\t9\n$\0029\n%\n9\n'\n>\n\2\t9\n$\0029\n%\n9\n(\n>\n\3\t9\n$\0029\n%\n9\n)\n>\n\4\t9\n$\0029\n%\n9\n*\n>\n\5\t9\n$\0029\n%\n9\n+\n>\n\6\t=\t-\b=\b.\aB\4\3\0019\4\f\0029\4P\4'\6Q\0005\aR\0009\b/\0029\b0\b9\bP\bB\b\1\2=\b/\a9\b$\0029\b>\b4\n\3\0005\vS\0>\v\1\n5\vT\0>\v\2\nB\b\2\2=\b>\a5\bU\0004\t\a\0009\n$\0029\n%\n9\n&\n>\n\1\t9\n$\0029\n%\n9\n'\n>\n\2\t9\n$\0029\n%\n9\n(\n>\n\3\t9\n$\0029\n%\n9\n)\n>\n\4\t9\n$\0029\n%\n9\n*\n>\n\5\t9\n$\0029\n%\n9\n+\n>\n\6\t=\t-\b=\b.\aB\4\3\0019\4\f\0029\4P\4'\6V\0005\aW\0009\b/\0029\b0\b9\bP\bB\b\1\2=\b/\a9\b$\0029\b>\b4\n\3\0005\vX\0>\v\1\n5\vY\0>\v\2\nB\b\2\2=\b>\a5\b\\\0004\t\5\0009\n$\0029\n%\n9\n&\n>\n\1\t9\n$\0029\n%\n9\nZ\n>\n\2\t9\n$\0029\n%\n9\n[\n>\n\3\t9\n$\0029\n%\n9\n+\n>\n\4\t=\t-\b=\b.\aB\4\3\0012\0\0�K\0\1\0\1\0\0\vlength\14sort_text\1\0\1\tname\fcmdline\1\0\1\tname\15fuzzy_path\1\0\0\6:\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\1\0\0\6/\fcmdline\1\0\0\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\17cmp_nvim_lua\1\0\1\tname\rnvim_lsp\blua\1\0\0\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_zsh\1\0\1\tname\vcrates\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\1\fconfirm\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-Space>\1\0\0\rcomplete\vinsert\vpreset\fmapping\fsorting\16comparators\1\0\0\voffset\tkind\vscopes\18recently_used\rlocality\nscore\fcompare\vconfig\tview\fentries\1\0\0\1\0\1\tname\vcustom\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\vwindow\18documentation\1\0\1\17winhighlight)Normal:Float,FloatBorder:FloatBorder\15completion\1\0\0\vborder\vBORDER\1\0\3\17side_padding\3\0\15col_offset\3����\15\17winhighlightINormal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\1\3\0\0\b┃\16FloatBorder\1\3\0\0\b┗\16FloatBorder\1\3\0\0\b━\16FloatBorder\1\3\0\0\b┛\16FloatBorder\1\3\0\0\b┃\16FloatBorder\1\3\0\0\b┓\16FloatBorder\1\3\0\0\b━\16FloatBorder\1\3\0\0\b┏\16FloatBorder\bcmp\frequire\0\0\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0005\5\5\0=\5\6\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\25user_default_options\1\0\0\tsass\fparsers\1\2\0\0\bcss\1\0\1\venable\2\1\0\6\vcss_fn\2\rAARRGGBB\2\rRRGGBBAA\2\nnames\2\vRRGGBB\2\bRGB\2\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\15cursorword\1\0\1\venable\1\15cursorline\1\0\0\1\0\3\venable\2\vnumber\2\ftimeout\3\0\nsetup\20nvim-cursorline\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui", "statuscol.nvim", "nvim-dap-virtual-text" },
    config = { "\27LJ\2\ng\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim�\4\1\0\v\0\29\00066\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\f\0006\4\5\0009\4\6\0049\4\a\4'\6\b\0B\4\2\0026\5\t\0B\5\1\2'\6\n\0006\a\t\0B\a\1\2'\b\v\0006\t\t\0B\t\1\2'\n\3\0&\4\n\4=\4\r\0035\4\14\0=\4\15\3=\3\16\2=\2\3\0019\1\17\0004\2\3\0005\3\19\0003\4\20\0=\4\21\3>\3\1\2=\2\18\0019\1\17\0009\2\17\0009\2\18\2=\2\22\0019\1\17\0009\2\17\0009\2\18\2=\2\23\0016\1\5\0009\1\6\0019\1\24\1'\3\25\0005\4\26\0B\1\3\0016\1\5\0009\1\6\0019\1\24\1'\3\27\0005\4\28\0B\1\3\1K\0\1\0\1\0\2\vtexthl\nField\ttext\b○\26DapBreakpointRejected\1\0\2\vtexthl\nField\ttext\b●\18DapBreakpoint\16sign_define\trust\6c\fprogram\0\1\0\5\frequest\vlaunch\ttype\rcodelldb\16stopOnEntry\2\tname\nDebug\bcwd\23${workspaceFolder}\bcpp\19configurations\15executable\targs\1\3\0\0\v--port\f${port}\fcommand\1\0\0\bbin\nmason\rPATH_SEP\tdata\fstdpath\afn\bvim\1\0\2\ttype\vserver\tport\f${port}\rcodelldb\radapters\bdap\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\nl\0\0\3\2\6\0\r-\0\0\0009\0\0\0004\2\0\0B\0\2\0016\0\1\0009\0\2\0'\2\3\0B\0\2\1-\0\1\0009\0\4\0009\0\5\0B\0\1\1K\0\1\0\0�\1�\nclose\trepl\25DapVirtualTextEnable\bcmd\bvim\topenh\0\0\3\2\5\0\r-\0\0\0009\0\0\0004\2\0\0B\0\2\0016\0\1\0009\0\2\0'\2\3\0B\0\2\1-\0\1\0009\0\4\0009\0\0\0B\0\1\1K\0\1\0\0�\1�\trepl\26DapVirtualTextDisable\bcmd\bvim\ncloseV\0\0\3\1\5\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\1-\0\0\0009\0\3\0009\0\4\0B\0\1\1K\0\1\0\1�\nclose\trepl\26DapVirtualTextDisable\bcmd\bvim(\0\0\2\1\2\0\5-\0\0\0009\0\0\0009\0\1\0B\0\1\1K\0\1\0\1�\nclose\trepl(\0\0\2\1\2\0\5-\0\0\0009\0\0\0009\0\1\0B\0\1\1K\0\1\0\1�\nclose\trepl�\4\1\0\b\0\26\00046\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0004\4\3\0005\5\6\0004\6\4\0005\a\3\0>\a\1\0065\a\4\0>\a\2\0065\a\5\0>\a\3\6=\6\a\5>\5\1\0045\5\t\0005\6\b\0=\6\a\5>\5\2\4=\4\v\3B\1\2\0016\1\0\0'\3\f\0B\1\2\0029\2\r\0019\2\14\0029\2\15\0023\3\17\0=\3\16\0029\2\r\0019\2\18\0029\2\15\0023\3\19\0=\3\16\0029\2\r\0019\2\18\0029\2\20\0023\3\21\0=\3\16\0029\2\r\0019\2\14\0029\2\22\0023\3\23\0=\3\16\0029\2\r\0019\2\14\0029\2\24\0023\3\25\0=\3\16\0022\0\0�K\0\1\0\0\17event_output\0\18event_stopped\0\17event_exited\0\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\bdap\flayouts\1\0\0\1\0\2\rposition\vbottom\tsize\4\0����\3\1\3\0\0\trepl\fconsole\relements\1\0\2\rposition\nright\tsize\3(\1\0\2\tsize\4��̙\3���\3\aid\vscopes\1\0\2\tsize\4����\t����\3\aid\16breakpoints\1\0\2\tsize\4����\t����\3\aid\vstacks\nsetup\ndapui\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fautocmd\1\0\0\1\0\1\fenabled\2\nsetup\19nvim-lightbulb\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    after = { "clangd_extensions.nvim", "mason.nvim", "nvim-cmp", "trouble.nvim", "mason-lspconfig.nvim" },
    config = { "\27LJ\2\n�\1\0\2\6\0\a\0\r6\2\0\0\18\4\0\0\18\5\1\0B\2\3\0016\2\1\0'\4\2\0B\2\2\0029\2\3\0025\4\5\0005\5\4\0=\5\6\4B\2\2\1K\0\1\0\15load_langs\1\0\3\tpath\n.ltex\14log_level\tnone\15init_check\2\1\2\0\0\nen-US\nsetup\15ltex_extra\frequire\18LSP_ON_ATTACH�\a\1\0\r\0&\0[5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0025\2\6\0005\3\5\0=\3\a\2=\2\4\0016\2\b\0\18\4\0\0B\2\2\4H\5J�\a\6\t\0X\a\1�X\aG�\a\6\n\0X\a\19�6\a\1\0'\t\v\0B\a\2\0028\a\6\a9\a\f\a5\t\r\0=\1\14\t6\n\15\0=\n\16\t5\n\17\0=\n\18\t5\n\22\0005\v\20\0005\f\19\0=\f\21\v=\v\n\n=\n\23\tB\a\2\1X\a2�\a\6\24\0X\a\15�6\a\1\0'\t\v\0B\a\2\0028\a\6\a9\a\f\a5\t\25\0=\1\14\t5\n\26\0006\v\15\0=\v\16\n5\v\27\0=\v\18\n=\n\v\tB\a\2\1X\a!�\a\6\28\0X\a\19�6\a\1\0'\t\v\0B\a\2\0029\a\28\a9\a\f\a5\t\29\0=\1\14\t3\n\30\0=\n\16\t5\n\31\0=\n\18\t5\n \0=\n!\t5\n#\0005\v\"\0=\v\28\n=\n\23\tB\a\2\1X\a\f�6\a\1\0'\t\v\0B\a\2\0028\a\6\a9\a\f\a5\t$\0=\1\14\t6\n\15\0=\n\16\t5\n%\0=\n\18\tB\a\2\1F\5\3\3R\5�\127K\0\1\0\1\0\1\26debounce_text_changes\3�\1\1\0\0\1\0\0\1\0\1\rlanguage\nen-US\14filetypes\1\6\0\0\btex\tltex\nlatex\rmarkdown\rplaintex\1\0\1\26debounce_text_changes\3�\1\0\1\0\0\tltex\1\0\1\26debounce_text_changes\3�\1\1\0\0\1\0\1\17runtime_path\2\16sumneko_lua\rsettings\1\0\0\16checkOnSave\1\0\0\1\0\1\fcomamnd\vclippy\nflags\1\0\1\26debounce_text_changes\3�\1\14on_attach\18LSP_ON_ATTACH\17capabilities\1\0\0\nsetup\14lspconfig\18rust_analyzer\vclangd\npairs\19semanticTokens\1\0\0\1\0\1\19refreshSupport\2\14workspace\25default_capabilities\17cmp_nvim_lsp\frequire\1\18\0\0\fasm_lsp\vbashls\vclangd\14gradle_ls\rgroovyls\14omnisharp\ncmake\ncssls\ngopls\thtml\18rust_analyzer\tltex\rmarksman\fpyright\ntaplo\rtsserver\16sumneko_lua\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n�\1\0\1\6\0\14\0 6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\15\0\1\0X\2\24�4\1\t\0005\2\3\0>\2\1\0015\2\4\0>\2\2\0015\2\5\0>\2\3\0015\2\6\0>\2\4\0015\2\a\0>\2\5\0015\2\b\0>\2\6\0015\2\t\0>\2\a\0015\2\n\0>\2\b\0016\2\0\0009\2\1\0029\2\v\2\18\4\0\0005\5\f\0=\1\r\5B\2\3\1K\0\1\0\vborder\1\0\0\24nvim_win_set_config\1\2\0\0\b│\1\2\0\0\b└\1\2\0\0\b─\1\2\0\0\b┘\1\2\0\0\b│\1\2\0\0\b┐\1\2\0\0\b─\1\2\0\0\b┌\22nvim_win_is_valid\bapi\bvim�\2\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0033\4\6\0=\4\a\3B\1\2\1K\0\1\0\fon_open\0\nicons\1\0\5\nERROR\b\nTRACE\b\nDEBUG\b\tINFO\b\tWARN\b\1\0\b\18minimum_width\3\30\vstages\22fade_in_slide_out\14max_width\3<\22background_colour\vNormal\ftimeout\3�\27\bfps\3\30\vrender\fdefault\nlevel\twarn\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n�\n\0\0\5\0'\0O6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3=\3\19\0025\3\21\0005\4\20\0=\4\22\3=\3\23\2B\0\2\0016\0\24\0009\0\25\0'\2\26\0B\0\2\0016\0\24\0009\0\25\0'\2\27\0B\0\2\0016\0\24\0009\0\25\0'\2\28\0B\0\2\0016\0\24\0009\0\25\0'\2\29\0B\0\2\0016\0\24\0009\0\25\0'\2\30\0B\0\2\0016\0\24\0009\0\25\0'\2\31\0B\0\2\0016\0\24\0009\0\25\0'\2 \0B\0\2\0016\0\24\0009\0\25\0'\2!\0B\0\2\0016\0\24\0009\0\25\0'\2\"\0B\0\2\0016\0\24\0009\0\25\0'\2#\0B\0\2\0016\0\24\0009\0\25\0'\2$\0B\0\2\0016\0\24\0009\0\25\0'\2%\0B\0\2\0016\0\24\0009\0\25\0'\2&\0B\0\2\1K\0\1\0>highlight ScrollbarMiscHandle guibg=#262b33 guifg=#c67ada>highlight ScrollbarInfoHandle guibg=#262b33 guifg=#61afef>highlight ScrollbarHintHandle guibg=#262b33 guifg=#9daaaa>highlight ScrollbarWarnHandle guibg=#262b33 guifg=#d29767?highlight ScrollbarErrorHandle guibg=#262b33 guifg=#c65156@highlight ScrollbarSearchHandle guibg=#262b33 guifg=#dbba758highlight ScrollbarMisc guibg=#262b33 guifg=#c67ada8highlight ScrollbarInfo guibg=#262b33 guifg=#61afef8highlight ScrollbarHint guibg=#262b33 guifg=#9daaaa8highlight ScrollbarWarn guibg=#262b33 guifg=#d297679highlight ScrollbarError guibg=#262b33 guifg=#c65156:highlight ScrollbarSearch guibg=#262b33 guifg=#dbba75,highlight ScrollbarHandle guibg=#262b33\bcmd\bvim\fautocmd\vrender\1\0\0\1\v\0\0\16BufWinEnter\rTabEnter\14TermEnter\rWinEnter\16CmdwinLeave\16TextChanged\17InsertChange\15VimResized\16WinScrolled\rBufLeave\nmarks\1\0\0\tMisc\1\0\1\ncolor\f#c67ada\tInfo\1\0\1\ncolor\f#61afef\tHint\1\0\1\ncolor\f#9daaaa\tWarn\1\0\1\ncolor\f#d29767\nError\1\0\1\ncolor\f#c65156\vSearch\1\0\1\ncolor\f#dbba75\fHandler\1\0\0\1\0\1\ncolor\f#262b33\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-scrollview"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\22scrollview_column\3\1\nsetup\15scrollview\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-semantic-tokens"] = {
    after = { "clangd_extensions.nvim", "nvim-lspconfig" },
    config = { "\27LJ\2\n�\14\0\0\4\0]\0�\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0'\2\4\0=\2\3\0019\1\2\0'\2\6\0=\2\5\0019\1\2\0'\2\b\0=\2\a\0019\1\2\0'\2\n\0=\2\t\0019\1\2\0'\2\f\0=\2\v\0019\1\2\0'\2\14\0=\2\r\0019\1\2\0'\2\16\0=\2\15\0019\1\2\0'\2\18\0=\2\17\0019\1\2\0'\2\20\0=\2\19\0019\1\2\0'\2\22\0=\2\21\0019\1\2\0'\2\24\0=\2\23\0019\1\2\0'\2\26\0=\2\25\0019\1\2\0'\2\28\0=\2\27\0019\1\2\0'\2\30\0=\2\29\0019\1\2\0'\2 \0=\2\31\0019\1\2\0'\2 \0=\2!\0019\1\2\0'\2#\0=\2\"\0019\1\2\0'\2%\0=\2$\0019\1\2\0'\2'\0=\2&\0019\1\2\0'\2)\0=\2(\0019\1\2\0'\2+\0=\2*\0019\1\2\0'\2-\0=\2,\0019\1\2\0'\2/\0=\2.\0019\1\2\0'\0021\0=\0020\0019\1\2\0'\0023\0=\0022\0019\1\2\0'\0025\0=\0024\0019\1\2\0'\0027\0=\0026\0019\1\2\0'\0029\0=\0028\0019\1\2\0'\2;\0=\2:\0019\1\2\0'\2=\0=\2<\0019\1\2\0'\2?\0=\2>\0019\1\2\0'\2A\0=\2@\0019\1\2\0'\2C\0=\2B\0019\1\2\0'\2E\0=\2D\0019\1\2\0'\2G\0=\2F\0019\1\2\0'\2I\0=\2H\0019\1\2\0'\2K\0=\2J\0019\1\2\0'\2M\0=\2L\0019\1\2\0'\2O\0=\2N\0019\1\2\0'\2Q\0=\2P\0019\1R\0005\2T\0=\2S\0019\1R\0005\2V\0=\2U\0019\1R\0005\2Y\0005\3X\0=\3Z\2=\2W\0019\1R\0005\2[\0=\2Z\0019\1\\\0B\1\1\1L\0\2\0\nreset\1\0\1\14parameter\17LspParameter\16declaration\1\0\1\14parameter\26LspParameterReference\1\0\1\14parameter\17LspParameter\18functionScope\1\0\1\rvariable\22LspStaticProperty\15classScope\1\0\3\rproperty\22LspStaticProperty\rvariable\22LspStaticVariable\nfield\19LspStaticField\vstatic\18modifiers_map\19LspThisKeyword\16thisKeyword\19LspSelfKeyword\16selfKeyword\22LspStaticProperty\19staticProperty\20LspStructMember\17structMember\14LspMember\vmember\rLspField\nfield\17LspParameter\14parameter\26LspParameterReference\23parameterReference\rLspLabel\nlabel\15LspBuiltin\fbuiltin\23LspBuiltinVariable\20builtinVariable\23LspBuiltinFunction\20builtinFunction\19LspBuiltinType\16builtinType\24LspBuiltinAttribute\21builtinAttribute\fLspSemi\tsemi\rLspComma\ncomma\rLspColon\ncolon\19LspParenthesis\16parenthesis\15LspBracket\fbracket\rLspBrace\nbrace\rLspAngle\nangle\24LspAttributeBracket\21attributeBracket\19LspPunctuation\16punctuation\15LspLogical\flogical\15comparison\15LspBitwise\fbitwise\18LspArithmetic\15arithmetic\23LspFormatSpecifier\20formatSpecifier\22LspEscapeSequence\19escapeSequence\17LspCharacter\14character\15LspBoolean\fboolean\15LspTypedef\ftypedef\rLspUnion\nunion\19LspConstructor\16constructor\17LspTypeAlias\14typeAlias\rLspTrait\ntrait\15LspConcept\fconcept\14LspDerive\vderive\17LspAttribute\14attribute\18LspAnnotation\15annotation\14token_map+nvim-semantic-tokens.table-highlighter\frequire�\2\1\0\a\0\r\1\0283\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0004\4\3\0\18\5\0\0B\5\1\0?\5\0\0=\4\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\0016\2\6\0009\2\a\0029\2\n\0026\4\1\0'\6\v\0B\4\2\0029\4\f\0044\5\0\0B\2\3\2=\2\t\1\18\1\0\0B\1\1\1K\0\1\0\15on_refresh)nvim-semantic-tokens.semantic_tokens\twith%workspace/semanticTokens/refresh\rhandlers\blsp\bvim\17highlighters\1\0\1\vpreset\fdefault\nsetup\25nvim-semantic-tokens\frequire\0\3����\4\0" },
    loaded = true,
    only_config = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-semantic-tokens",
    url = "https://github.com/theHamsta/nvim-semantic-tokens"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\21ensure_installed\1\0\0\1\29\0\0\tbash\6c\ncmake\fcomment\bcpp\fc_sharp\bcss\tcuda\6d\rgdscript\tglsl\ago\nhjson\thtml\tjava\15javascript\tjson\njson5\njsonc\vkotlin\blua\vpython\trust\ttoml\15typescript\bvim\tyaml\bzig\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\b\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\1\0\2\venable\2\14max_lines\3\4\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\6\0\0\rneo-tree\19neo-tree-popup\vnotify\vaerial\vpacker\1\0\3\19autoselect_one\1\23other_win_hl_color\f#61afef\20include_current\1\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  nvterm = {
    config = { "\27LJ\2\n�\3\0\0\a\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0035\4\b\0005\5\5\0006\6\6\0=\6\a\5=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\14\3=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\2B\0\2\1K\0\1\0\vtoggle\1\0\2\nfloat\f<C-S-t>\15horizontal\b<T>\rbehavior\1\0\2\16auto_insert\2\18close_on_exit\2\14terminals\1\0\0\14type_opts\rvertical\1\0\2\rlocation\nright\16split_ratio\4\0����\3\15horizontal\1\0\2\rlocation\nbelow\16split_ratio\4��̙\3����\3\nfloat\1\0\0\vborder\vBORDER\1\0\5\vheight\4��̙\3����\3\bcol\4\0����\3\rrelative\veditor\brow\4��̙\3����\3\nwidth\4��̙\3���\3\tlist\1\0\0\nsetup\vnvterm\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvterm",
    url = "https://github.com/NvChad/nvterm"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\15playground\1\0\0\16keybindings\fdisable\1\0\3\fenabled\2\15updatetime\3\25\20persist_queries\1\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["statuscol.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\16relculright\2\vsetopt\2\nsetup\14statuscol\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/statuscol.nvim",
    url = "https://github.com/luukvbaal/statuscol.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\t\0\27\0)6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\21\0005\5\17\0005\6\r\0005\a\5\0009\b\4\0=\b\6\a9\b\a\0=\b\b\a9\b\t\0=\b\n\a9\b\v\0=\b\f\a=\a\14\0065\a\15\0009\b\4\0=\b\6\a9\b\a\0=\b\b\a9\b\t\0=\b\n\a9\b\v\0=\b\f\a=\a\16\6=\6\18\0055\6\19\0=\6\20\5=\5\22\0045\5\23\0=\5\24\4B\2\2\0019\2\25\1'\4\26\0B\2\2\1K\0\1\0\bfzf\19load_extension\15extensions\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\rdefaults\1\0\0\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\v--trim\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\f<S-A-k>\25preview_scrolling_up\f<S-A-j>\27preview_scrolling_down\n<S-k>\28move_selection_previous\n<S-j>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nsigns\1\0\4\thint\t \nerror\t \fwarning\t \16information\t \16action_keys\1\0\t\frefresh\n<C-r>\nhover\14<C-A-S-k>\nclose\15<C-l><C-k>\15jump_close\v<C-CR>\ropen_tab\14<C-A-S-t>\15open_split\14<C-A-S-h>\tjump\t<CR>\vcancel\n<esc>\16open_vsplit\14<C-A-S-s>\1\0\3\tmode\25document_diagnostics\17auto_preview\nfalse\25use_diagnostic_signs\1\nsetup\ftrouble\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/vim-autoformat",
    url = "https://github.com/vim-autoformat/vim-autoformat"
  },
  ["vim-cpp-enhanced-highlight"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/vim-cpp-enhanced-highlight",
    url = "https://github.com/octol/vim-cpp-enhanced-highlight"
  },
  ["vim-cpp-modern"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/vim-cpp-modern",
    url = "https://github.com/bfrg/vim-cpp-modern"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-one"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/vim-one",
    url = "https://github.com/rakr/vim-one"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["virt-column.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16virt-column\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/virt-column.nvim",
    url = "https://github.com/lukas-reineke/virt-column.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0006\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vwindow\1\0\0\vmargin\1\5\0\0\3\2\3\2\3\2\3\2\vborder\vBORDER\1\0\1\rwinblend\3\1\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/yats.vim",
    url = "https://github.com/HerringtonDarkholme/yats.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\6\0\0\rneo-tree\19neo-tree-popup\vnotify\vaerial\vpacker\1\0\3\19autoselect_one\1\23other_win_hl_color\f#61afef\20include_current\1\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n�\n\0\0\5\0'\0O6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3=\3\19\0025\3\21\0005\4\20\0=\4\22\3=\3\23\2B\0\2\0016\0\24\0009\0\25\0'\2\26\0B\0\2\0016\0\24\0009\0\25\0'\2\27\0B\0\2\0016\0\24\0009\0\25\0'\2\28\0B\0\2\0016\0\24\0009\0\25\0'\2\29\0B\0\2\0016\0\24\0009\0\25\0'\2\30\0B\0\2\0016\0\24\0009\0\25\0'\2\31\0B\0\2\0016\0\24\0009\0\25\0'\2 \0B\0\2\0016\0\24\0009\0\25\0'\2!\0B\0\2\0016\0\24\0009\0\25\0'\2\"\0B\0\2\0016\0\24\0009\0\25\0'\2#\0B\0\2\0016\0\24\0009\0\25\0'\2$\0B\0\2\0016\0\24\0009\0\25\0'\2%\0B\0\2\0016\0\24\0009\0\25\0'\2&\0B\0\2\1K\0\1\0>highlight ScrollbarMiscHandle guibg=#262b33 guifg=#c67ada>highlight ScrollbarInfoHandle guibg=#262b33 guifg=#61afef>highlight ScrollbarHintHandle guibg=#262b33 guifg=#9daaaa>highlight ScrollbarWarnHandle guibg=#262b33 guifg=#d29767?highlight ScrollbarErrorHandle guibg=#262b33 guifg=#c65156@highlight ScrollbarSearchHandle guibg=#262b33 guifg=#dbba758highlight ScrollbarMisc guibg=#262b33 guifg=#c67ada8highlight ScrollbarInfo guibg=#262b33 guifg=#61afef8highlight ScrollbarHint guibg=#262b33 guifg=#9daaaa8highlight ScrollbarWarn guibg=#262b33 guifg=#d297679highlight ScrollbarError guibg=#262b33 guifg=#c65156:highlight ScrollbarSearch guibg=#262b33 guifg=#dbba75,highlight ScrollbarHandle guibg=#262b33\bcmd\bvim\fautocmd\vrender\1\0\0\1\v\0\0\16BufWinEnter\rTabEnter\14TermEnter\rWinEnter\16CmdwinLeave\16TextChanged\17InsertChange\15VimResized\16WinScrolled\rBufLeave\nmarks\1\0\0\tMisc\1\0\1\ncolor\f#c67ada\tInfo\1\0\1\ncolor\f#61afef\tHint\1\0\1\ncolor\f#9daaaa\tWarn\1\0\1\ncolor\f#d29767\nError\1\0\1\ncolor\f#c65156\vSearch\1\0\1\ncolor\f#dbba75\fHandler\1\0\0\1\0\1\ncolor\f#262b33\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\28current_line_blame_opts\1\0\1\ndelay\3\0\1\0\2\23current_line_blame\2!current_line_blame_formatter4 <author> • <author_time:%R> • <summary>\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\21ensure_installed\1\0\0\1\29\0\0\tbash\6c\ncmake\fcomment\bcpp\fc_sharp\bcss\tcuda\6d\rgdscript\tglsl\ago\nhjson\thtml\tjava\15javascript\tjson\njson5\njsonc\vkotlin\blua\vpython\trust\ttoml\15typescript\bvim\tyaml\bzig\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-scrollview
time([[Config for nvim-scrollview]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\22scrollview_column\3\1\nsetup\15scrollview\frequire\0", "config", "nvim-scrollview")
time([[Config for nvim-scrollview]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\26\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\r\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\4=\4\14\0035\4\16\0005\5\15\0=\5\6\0045\5\17\0=\5\b\0045\5\18\0=\5\n\0045\5\19\0=\5\f\4=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\vextras\1\0\1\21named_parameters\2\23paint_catch_blocks\1\0\2\17declarations\2\vusages\2\22excluded_argnames\vusages\1\2\0\0\tthis\1\2\0\0\tself\1\2\0\0\tself\1\0\0\1\3\0\0\tself\bcls\17declarations\1\0\0\bcpp\1\2\0\0\tthis\trust\1\2\0\0\tself\blua\1\2\0\0\tself\vpython\1\0\0\1\3\0\0\tself\bcls\1\0\3\21paint_arg_usages\2\27paint_arg_declarations\2\ncolor\f#588496\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\b\20default_keymaps\2\17scroll_limit\0032\22horizontal_scroll\2\18default_delay\4����\t����\3\rcentered\1\18always_scroll\1\21extended_keymaps\2\18extra_keymaps\1\nsetup\rcinnamon\frequire\0", "config", "cinnamon.nvim")
time([[Config for cinnamon.nvim]], false)
-- Config for: nvim-semantic-tokens
time([[Config for nvim-semantic-tokens]], true)
try_loadstring("\27LJ\2\n�\14\0\0\4\0]\0�\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0'\2\4\0=\2\3\0019\1\2\0'\2\6\0=\2\5\0019\1\2\0'\2\b\0=\2\a\0019\1\2\0'\2\n\0=\2\t\0019\1\2\0'\2\f\0=\2\v\0019\1\2\0'\2\14\0=\2\r\0019\1\2\0'\2\16\0=\2\15\0019\1\2\0'\2\18\0=\2\17\0019\1\2\0'\2\20\0=\2\19\0019\1\2\0'\2\22\0=\2\21\0019\1\2\0'\2\24\0=\2\23\0019\1\2\0'\2\26\0=\2\25\0019\1\2\0'\2\28\0=\2\27\0019\1\2\0'\2\30\0=\2\29\0019\1\2\0'\2 \0=\2\31\0019\1\2\0'\2 \0=\2!\0019\1\2\0'\2#\0=\2\"\0019\1\2\0'\2%\0=\2$\0019\1\2\0'\2'\0=\2&\0019\1\2\0'\2)\0=\2(\0019\1\2\0'\2+\0=\2*\0019\1\2\0'\2-\0=\2,\0019\1\2\0'\2/\0=\2.\0019\1\2\0'\0021\0=\0020\0019\1\2\0'\0023\0=\0022\0019\1\2\0'\0025\0=\0024\0019\1\2\0'\0027\0=\0026\0019\1\2\0'\0029\0=\0028\0019\1\2\0'\2;\0=\2:\0019\1\2\0'\2=\0=\2<\0019\1\2\0'\2?\0=\2>\0019\1\2\0'\2A\0=\2@\0019\1\2\0'\2C\0=\2B\0019\1\2\0'\2E\0=\2D\0019\1\2\0'\2G\0=\2F\0019\1\2\0'\2I\0=\2H\0019\1\2\0'\2K\0=\2J\0019\1\2\0'\2M\0=\2L\0019\1\2\0'\2O\0=\2N\0019\1\2\0'\2Q\0=\2P\0019\1R\0005\2T\0=\2S\0019\1R\0005\2V\0=\2U\0019\1R\0005\2Y\0005\3X\0=\3Z\2=\2W\0019\1R\0005\2[\0=\2Z\0019\1\\\0B\1\1\1L\0\2\0\nreset\1\0\1\14parameter\17LspParameter\16declaration\1\0\1\14parameter\26LspParameterReference\1\0\1\14parameter\17LspParameter\18functionScope\1\0\1\rvariable\22LspStaticProperty\15classScope\1\0\3\rproperty\22LspStaticProperty\rvariable\22LspStaticVariable\nfield\19LspStaticField\vstatic\18modifiers_map\19LspThisKeyword\16thisKeyword\19LspSelfKeyword\16selfKeyword\22LspStaticProperty\19staticProperty\20LspStructMember\17structMember\14LspMember\vmember\rLspField\nfield\17LspParameter\14parameter\26LspParameterReference\23parameterReference\rLspLabel\nlabel\15LspBuiltin\fbuiltin\23LspBuiltinVariable\20builtinVariable\23LspBuiltinFunction\20builtinFunction\19LspBuiltinType\16builtinType\24LspBuiltinAttribute\21builtinAttribute\fLspSemi\tsemi\rLspComma\ncomma\rLspColon\ncolon\19LspParenthesis\16parenthesis\15LspBracket\fbracket\rLspBrace\nbrace\rLspAngle\nangle\24LspAttributeBracket\21attributeBracket\19LspPunctuation\16punctuation\15LspLogical\flogical\15comparison\15LspBitwise\fbitwise\18LspArithmetic\15arithmetic\23LspFormatSpecifier\20formatSpecifier\22LspEscapeSequence\19escapeSequence\17LspCharacter\14character\15LspBoolean\fboolean\15LspTypedef\ftypedef\rLspUnion\nunion\19LspConstructor\16constructor\17LspTypeAlias\14typeAlias\rLspTrait\ntrait\15LspConcept\fconcept\14LspDerive\vderive\17LspAttribute\14attribute\18LspAnnotation\15annotation\14token_map+nvim-semantic-tokens.table-highlighter\frequire�\2\1\0\a\0\r\1\0283\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0004\4\3\0\18\5\0\0B\5\1\0?\5\0\0=\4\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\0016\2\6\0009\2\a\0029\2\n\0026\4\1\0'\6\v\0B\4\2\0029\4\f\0044\5\0\0B\2\3\2=\2\t\1\18\1\0\0B\1\1\1K\0\1\0\15on_refresh)nvim-semantic-tokens.semantic_tokens\twith%workspace/semanticTokens/refresh\rhandlers\blsp\bvim\17highlighters\1\0\1\vpreset\fdefault\nsetup\25nvim-semantic-tokens\frequire\0\3����\4\0", "config", "nvim-semantic-tokens")
time([[Config for nvim-semantic-tokens]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\fteasing\1\21case_insensitive\1\28jump_on_sole_occurrence\1\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0006\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vwindow\1\0\0\vmargin\1\5\0\0\3\2\3\2\3\2\3\2\vborder\vBORDER\1\0\1\rwinblend\3\1\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\18virtual_lines\1\0\1\vprefix\t🔥\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\nextra\1\0\3\nbelow\16<leader>lco\beol\16<leader>lce\nabove\16<leader>lcO\ropleader\1\0\2\nblock\15<leader>Bc\tline\15<leader>Lc\ftoggler\1\0\2\nblock\15<leader>bc\tline\15<leader>lc\1\0\2\vsticky\2\fpadding\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0+\1\1\0=\1\5\0K\0\1\0004indent_blankline_show_trailing_blankline_indent\6g\bvim\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n�\b\0\0\b\0-\0=5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0005\6\n\0=\6\v\5=\5\f\0045\5\r\0=\5\14\4=\4\16\0035\4\17\0=\4\18\0035\4\27\0005\5\23\0005\6\19\0=\0\20\0065\a\21\0=\a\22\6=\6\24\0055\6\25\0=\6\26\5=\5\28\0045\5\31\0005\6\29\0=\0\20\0065\a\30\0=\a\22\6=\6\24\0055\6 \0=\6\26\5=\5!\0045\5\"\0005\6#\0=\6$\0055\6%\0=\0\20\0065\a&\0=\a\22\6=\6\24\0055\6'\0=\6\26\5=\5\b\4=\4(\3B\1\2\0016\1)\0009\1*\1'\3+\0B\1\2\0016\1)\0009\1*\1'\3,\0B\1\2\1K\0\1\0,hi! link NoiceConfirmBorder FloatBorder1hi! link NoiceCmdlinePopupBorder FloatBorder\bcmd\bvim\nviews\1\0\2\17winhighlight)Normal:Pmenu,FloatBorder:FloatBorder\rwinblend\3\0\1\3\0\0\3\0\3\0\1\0\0\rposition\1\0\2\brow\3\2\bcol\3\2\1\0\1\rrelative\vcursor\14popupmenu\1\0\2\17winhighlight)Normal:Pmenu,FloatBorder:FloatBorder\rwinblend\3\0\1\0\0\1\3\0\0\3\0\3\0\1\0\0\18cmdline_popup\1\0\0\16win_options\1\0\2\17winhighlight)Normal:Pmenu,FloatBorder:FloatBorder\rwinblend\3\0\vborder\1\0\0\fpadding\1\3\0\0\3\0\3\0\nstyle\1\0\0\fpresets\1\0\3\18bottom_search\1\15inc_rename\2\20command_palette\2\blsp\1\0\0\rprogress\1\0\2\fenabled\2\rthrottle\4ժժ\5ժ��\4\14signature\14auto_open\1\0\4\ftrigger\2\rthrottle\3(\fenabled\2\fluasnip\2\1\0\1\fenabled\2\nhover\1\0\1\fenabled\2\roverride\1\0\0\1\0\3\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2 cmp.entry.get_documentation\2\nsetup\nnoice\frequire\1\t\0\0\b┏\b━\b┓\b┃\b┛\b━\b┗\b┃\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\t\0\27\0)6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\21\0005\5\17\0005\6\r\0005\a\5\0009\b\4\0=\b\6\a9\b\a\0=\b\b\a9\b\t\0=\b\n\a9\b\v\0=\b\f\a=\a\14\0065\a\15\0009\b\4\0=\b\6\a9\b\a\0=\b\b\a9\b\t\0=\b\n\a9\b\v\0=\b\f\a=\a\16\6=\6\18\0055\6\19\0=\6\20\5=\5\22\0045\5\23\0=\5\24\4B\2\2\0019\2\25\1'\4\26\0B\2\2\1K\0\1\0\bfzf\19load_extension\15extensions\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\rdefaults\1\0\0\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\v--trim\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\f<S-A-k>\25preview_scrolling_up\f<S-A-j>\27preview_scrolling_down\n<S-k>\28move_selection_previous\n<S-j>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fautocmd\1\0\0\1\0\1\fenabled\2\nsetup\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0005\5\5\0=\5\6\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\25user_default_options\1\0\0\tsass\fparsers\1\2\0\0\bcss\1\0\1\venable\2\1\0\6\vcss_fn\2\rAARRGGBB\2\rRRGGBBAA\2\nnames\2\vRRGGBB\2\bRGB\2\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: command_center.nvim
time([[Config for command_center.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\19command_center\19load_extension\14telescope\frequire\0", "config", "command_center.nvim")
time([[Config for command_center.nvim]], false)
-- Config for: virt-column.nvim
time([[Config for virt-column.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16virt-column\frequire\0", "config", "virt-column.nvim")
time([[Config for virt-column.nvim]], false)
-- Config for: nvterm
time([[Config for nvterm]], true)
try_loadstring("\27LJ\2\n�\3\0\0\a\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0035\4\b\0005\5\5\0006\6\6\0=\6\a\5=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\14\3=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\2B\0\2\1K\0\1\0\vtoggle\1\0\2\nfloat\f<C-S-t>\15horizontal\b<T>\rbehavior\1\0\2\16auto_insert\2\18close_on_exit\2\14terminals\1\0\0\14type_opts\rvertical\1\0\2\rlocation\nright\16split_ratio\4\0����\3\15horizontal\1\0\2\rlocation\nbelow\16split_ratio\4��̙\3����\3\nfloat\1\0\0\vborder\vBORDER\1\0\5\vheight\4��̙\3����\3\bcol\4\0����\3\rrelative\veditor\brow\4��̙\3����\3\nwidth\4��̙\3���\3\tlist\1\0\0\nsetup\vnvterm\frequire\0", "config", "nvterm")
time([[Config for nvterm]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\b\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\1\0\2\venable\2\14max_lines\3\4\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\18previewwindow\awo\bvim'\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\rreadonly\abo\bvimC\0\0\1\0\4\0\t6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\rquickfix\fbuftype\abo\bvim�\r\1\0\b\0S\0{5\0\r\0005\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0=\2\n\0015\2\v\0=\2\f\1=\1\14\0005\1\16\0005\2\15\0=\2\2\0015\2\17\0=\2\4\0015\2\18\0=\2\n\0015\2\19\0=\2\f\1=\1\20\0005\1\22\0005\2\21\0=\2\2\0015\2\23\0=\2\4\0015\2\24\0=\2\n\0015\2\25\0=\2\f\1=\1\26\0005\1\28\0005\2\27\0=\2\2\0015\2\29\0=\2\4\0015\2\30\0=\2\n\0015\2\31\0=\2\f\1=\1 \0005\1\"\0005\2!\0=\2\2\0015\2#\0=\2\4\0015\2$\0=\2\n\0015\2%\0=\2\f\1=\1&\0006\1'\0'\3(\0B\1\2\0029\1)\0015\0030\0005\4*\0=\0+\0045\5,\0=\5-\0045\5.\0=\5/\4=\0041\0035\0042\0=\0043\0035\0045\0005\0054\0=\0056\0045\0057\0005\0068\0>\6\3\0055\0069\0003\a:\0=\a;\6>\6\4\0055\6<\0003\a=\0=\a;\6>\6\5\0055\6>\0003\a?\0=\a;\6>\6\6\0055\6@\0>\6\a\5=\5A\0044\5\0\0=\5B\0044\5\3\0005\6C\0005\aD\0=\aE\0065\aF\0=\aG\6>\6\1\5=\5H\0044\5\4\0005\6I\0>\6\1\0055\6J\0>\6\2\0055\6K\0>\6\3\5=\5L\0044\5\3\0005\6M\0>\6\1\0055\6N\0>\6\2\5=\5O\4=\4G\0035\4Q\0005\5P\0=\5B\0044\5\0\0=\5H\4=\4R\3B\1\2\1K\0\1\0\22inactive_sections\1\0\0\1\2\0\0\r%f %y %m\14lualine_z\1\2\0\0\rprogress\1\2\0\0\rlocation\14lualine_y\1\2\0\0\15fileformat\1\2\0\0\rencoding\1\2\0\0\rfiletype\14lualine_x\rsections\1\4\0\0\nerror\twarn\tinfo\fsources\1\2\0\0\rnvim_lsp\1\2\2\0\16diagnostics\19always_visible\2\21update_in_insert\2\14lualine_c\14lualine_b\1\2\0\0\16searchcount\0\1\2\0\0\a%q\0\1\2\0\0\a%r\tcond\0\1\2\0\0\a%w\1\2\2\0\rfilename\tpath\3\1\16file_status\2\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\15extensions\1\a\0\0\vaerial\rquickfix\rfugitive\rneo-tree\16nvim-dap-ui\15toggleterm\foptions\1\0\0\23section_separators\1\0\2\tleft\b\nright\b\25component_separators\1\0\2\tleft\5\nright\5\ntheme\1\0\2\17globalstatus\2\25always_divide_middle\2\nsetup\flualine\frequire\fcommand\1\0\2\abg\f#e06c75\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\0\1\0\2\abg\f#e06c75\afg\f#23272e\freplace\1\0\2\abg\f#e06c75\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\0\1\0\2\abg\f#e06c75\afg\f#23272e\vvisual\1\0\2\abg\f#c678dd\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#c678dd\1\0\2\abg\f#23272e\afg\f#c678dd\1\0\0\1\0\2\abg\f#c678dd\afg\f#23272e\vinsert\1\0\2\abg\f#61afef\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#61afef\1\0\2\abg\f#23272e\afg\f#61afef\1\0\0\1\0\2\abg\f#61afef\afg\f#23272e\vnormal\1\0\0\6z\1\0\2\abg\f#98c379\afg\f#23272e\6y\1\0\2\abg\f#23272e\afg\f#98c379\6x\1\0\2\abg\f#303742\afg\f#9daaaa\6c\1\0\2\abg\f#303742\afg\f#9daaaa\6b\1\0\2\abg\f#23272e\afg\f#98c379\6a\1\0\0\1\0\2\abg\f#98c379\afg\f#23272e\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: playground
time([[Config for playground]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\15playground\1\0\0\16keybindings\fdisable\1\0\3\fenabled\2\15updatetime\3\25\20persist_queries\1\nsetup\28nvim-treesitter.configs\frequire\0", "config", "playground")
time([[Config for playground]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\a\0004\4\5\0005\5\3\0>\5\1\0045\5\4\0>\5\2\0045\5\5\0>\5\3\0045\5\6\0>\5\4\4=\4\b\0035\4\t\0005\5\n\0=\5\v\4=\4\f\3=\3\14\2B\0\2\1K\0\1\0\foptions\1\0\0\nhover\vreveal\1\2\0\0\nclose\1\0\2\ndelay\3�\1\fenabled\2\foffsets\1\0\b\24show_tab_indicators\2\22show_buffer_icons\2\16color_icons\2!diagnostics_update_in_insert\2\16diagnostics\rnvim_lsp\24right_mouse_command\5\27always_show_bufferline\2\20separator_style\nthick\1\0\4\14highlight\14Directory\ttext\fOutline\15text_align\nright\rfiletype\vaerial\1\0\4\14highlight\14Directory\ttext\5\15text_align\nright\rfiletype\fOutline\1\0\4\14highlight\14Directory\ttext\5\15text_align\tleft\rfiletype\rneo-tree\1\0\4\14highlight\14Directory\ttext\vPacker\15text_align\tleft\rfiletype\vpacker\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n�\1\0\1\6\0\14\0 6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2\15\0\1\0X\2\24�4\1\t\0005\2\3\0>\2\1\0015\2\4\0>\2\2\0015\2\5\0>\2\3\0015\2\6\0>\2\4\0015\2\a\0>\2\5\0015\2\b\0>\2\6\0015\2\t\0>\2\a\0015\2\n\0>\2\b\0016\2\0\0009\2\1\0029\2\v\2\18\4\0\0005\5\f\0=\1\r\5B\2\3\1K\0\1\0\vborder\1\0\0\24nvim_win_set_config\1\2\0\0\b│\1\2\0\0\b└\1\2\0\0\b─\1\2\0\0\b┘\1\2\0\0\b│\1\2\0\0\b┐\1\2\0\0\b─\1\2\0\0\b┌\22nvim_win_is_valid\bapi\bvim�\2\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0033\4\6\0=\4\a\3B\1\2\1K\0\1\0\fon_open\0\nicons\1\0\5\nERROR\b\nTRACE\b\nDEBUG\b\tINFO\b\tWARN\b\1\0\b\18minimum_width\3\30\vstages\22fade_in_slide_out\14max_width\3<\22background_colour\vNormal\ftimeout\3�\27\bfps\3\30\vrender\fdefault\nlevel\twarn\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\15cursorword\1\0\1\venable\1\15cursorline\1\0\0\1\0\3\venable\2\vnumber\2\ftimeout\3\0\nsetup\20nvim-cursorline\frequire\0", "config", "nvim-cursorline")
time([[Config for nvim-cursorline]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0026\3\0\0'\5\b\0B\3\2\2=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\14\0006\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\nfloat\15min_height\1\3\0\0\3\1\3\1\vborder\vBORDER\1\0\2\15max_height\3\1\rrelative\bwin\vlayout\14max_width\1\0\3\22default_direction\nright\14min_width\3\20\14placement\tedge\1\3\0\0\3\30\4����\t����\3\nicons\18lspkind_icons\16filter_kind\1\t\0\0\vModule\nClass\vStruct\14Interface\16Constructor\vMethod\tEnum\rFunction\rbackends\1\0\a\16show_guides\2\19open_automatic\1\23highlight_on_hover\2\22highlight_closest\2\19highlight_mode\16split_width\21default_bindings\2\16attach_mode\vglobal\1\4\0\0\15treesitter\blsp\rmarkdown\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: cosmic-ui
time([[Config for cosmic-ui]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14cosmic-ui\frequire\0", "config", "cosmic-ui")
time([[Config for cosmic-ui]], false)
-- Config for: barbecue.nvim
time([[Config for barbecue.nvim]], true)
try_loadstring("\27LJ\2\n:\0\1\4\0\3\0\0066\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\1K\0\1\0\vupdate\16barbecue.ui\frequire�\4\1\0\b\0\24\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0026\3\0\0'\5\6\0B\3\2\2=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0005\2\17\0005\3\20\0006\4\14\0009\4\15\0049\4\18\4'\6\19\0004\a\0\0B\4\3\2=\4\21\0033\4\22\0=\4\23\3B\0\3\1K\0\1\0\rcallback\0\ngroup\1\0\0\28barbecue#create_autocmd\24nvim_create_augroup\1\v\0\0\16WinScrolled\16BufWinEnter\16BufWinLeave\15CursorHold\16CursorMoved\17CursorMovedI\16InsertLeave\17BufWritePost\16TextChanged\17TextChangedI\24nvim_create_autocmd\bapi\bvim\22exclude_filetypes\1\6\0\0\14gitcommit\15toggleterm\vaerial\rneo-tree\rterminal\ntheme\vnormal\1\0\0\1\0\2\abg\f#24292f\afg\f#9daaaa\nkinds\18lspkind_icons\fsymbols\1\0\1\14separator\b\1\0\3\18show_modified\2\17attach_navic\1\19create_autocmd\1\nsetup\rbarbecue\frequire\0", "config", "barbecue.nvim")
time([[Config for barbecue.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd neo-tree.nvim ]]

-- Config for: neo-tree.nvim
try_loadstring("\27LJ\2\n[\0\1\3\0\a\0\n6\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\1\4�6\1\0\0009\1\4\1'\2\6\0=\2\5\1K\0\1\0\tauto\15signcolumn\awo\rneo-tree\rfiletype\abo\bvim�\14\1\0\6\0000\0=6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\0025\3\t\0005\4\n\0=\4\v\3=\3\f\0025\3\14\0005\4\r\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\21\0005\5\20\0=\5\22\4=\4\23\3=\3\24\0025\3\25\0005\4\26\0=\4\27\3=\3\28\0025\3 \0005\4\29\0005\5\30\0=\5\31\4=\4!\0035\4#\0005\5\"\0=\5\27\4=\4\28\3=\3$\0025\3%\0005\4'\0005\5&\0=\5\27\4=\4\28\3=\3(\0025\3+\0005\4*\0005\5)\0=\5\27\4=\4\28\3=\3\23\0024\3\3\0005\4,\0003\5-\0=\5.\4>\4\1\3=\3/\2B\0\2\1K\0\1\0\19event_handlers\fhandler\0\1\0\1\nevent\21vim_buffer_enter\1\0\0\1\0\0\1\0\a\6a\17git_add_file\6u\21git_unstage_file\6A\16git_add_all\6p\rgit_push\acp\24git_commit_and_push\6r\20git_revert_file\6c\15git_commit\fbuffers\1\0\0\1\0\1\abd\18buffer_delete\1\0\1\18show_unloaded\2\15filesystem\1\0\0\1\0\3\6H\18toggle_hidden\n<c-x>\17clear_filter\6/\21filter_on_submit\19filtered_items\1\0\3\26hijack_netrw_behavior\17open_current\24follow_current_file\2\27use_libuv_file_watcher\2\17hide_by_name\1\5\0\0\14.DS_Store\14thumbs.db\17node_modules\16__pycache__\1\0\3\18hide_dotfiles\1\fvisible\1\20hide_gitignored\1\vwindow\rmappings\1\0\r\t<cr>\topen\18<2-LeftMouse>\topen\6p\25paste_from_clipboard\6R\frefresh\6y\22copy_to_clipboard\6r\vrename\n<C-t>\17close_window\6d\vdelete\6a\badd\6e\topen\6q\17close_window\6x\21cut_to_clipboard\6s\16open_vsplit\1\0\2\rposition\tleft\nwidth\3\30\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\fdeleted\b\nadded\b\rconflict\b\vstaged\b✓\runstaged\b✗\fignored\b◌\14untracked\b★\frenamed\b➜\rmodified\b\tname\1\0\2\26use_git_status_colors\2\19trailing_slash\1\ticon\1\0\4\16folder_open\b\fdefault\b\18folder_closed\b\17folder_empty\b\vindent\1\0\0\1\0\n\18indent_marker\b│\23expander_collapsed\b\19with_expanders\2\14highlight\24NeoTreeIndentMarker\23last_indent_marker\b└\fpadding\3\0\17with_markers\2\16indent_size\3\2\23expander_highlight\20NeoTreeExpander\22expander_expanded\b\20source_selector\15tab_labels\1\0\4\15filesystem\r File\fbuffers\15 Buffer\16diagnostics\r裂Lints\15git_status\f Git\1\0\4\15statusline\1\vwinbar\2\19content_layout\nstart\"show_scrolled_off_parent_node\1\fsources\1\0\5\25close_if_last_window\2\23enable_diagnostics\2\26sort_case_insensitive\2\22enable_git_status\2\23popup_border_style\frounded\1\3\0\0\15filesystem\15git_status\nsetup\rneo-tree\frequire.let g:neo_tree_remove_legacy_commands = 1\bcmd\bvim\0", "config", "neo-tree.nvim")

vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n�\1\0\2\6\0\a\0\r6\2\0\0\18\4\0\0\18\5\1\0B\2\3\0016\2\1\0'\4\2\0B\2\2\0029\2\3\0025\4\5\0005\5\4\0=\5\6\4B\2\2\1K\0\1\0\15load_langs\1\0\3\tpath\n.ltex\14log_level\tnone\15init_check\2\1\2\0\0\nen-US\nsetup\15ltex_extra\frequire\18LSP_ON_ATTACH�\a\1\0\r\0&\0[5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0025\2\6\0005\3\5\0=\3\a\2=\2\4\0016\2\b\0\18\4\0\0B\2\2\4H\5J�\a\6\t\0X\a\1�X\aG�\a\6\n\0X\a\19�6\a\1\0'\t\v\0B\a\2\0028\a\6\a9\a\f\a5\t\r\0=\1\14\t6\n\15\0=\n\16\t5\n\17\0=\n\18\t5\n\22\0005\v\20\0005\f\19\0=\f\21\v=\v\n\n=\n\23\tB\a\2\1X\a2�\a\6\24\0X\a\15�6\a\1\0'\t\v\0B\a\2\0028\a\6\a9\a\f\a5\t\25\0=\1\14\t5\n\26\0006\v\15\0=\v\16\n5\v\27\0=\v\18\n=\n\v\tB\a\2\1X\a!�\a\6\28\0X\a\19�6\a\1\0'\t\v\0B\a\2\0029\a\28\a9\a\f\a5\t\29\0=\1\14\t3\n\30\0=\n\16\t5\n\31\0=\n\18\t5\n \0=\n!\t5\n#\0005\v\"\0=\v\28\n=\n\23\tB\a\2\1X\a\f�6\a\1\0'\t\v\0B\a\2\0028\a\6\a9\a\f\a5\t$\0=\1\14\t6\n\15\0=\n\16\t5\n%\0=\n\18\tB\a\2\1F\5\3\3R\5�\127K\0\1\0\1\0\1\26debounce_text_changes\3�\1\1\0\0\1\0\0\1\0\1\rlanguage\nen-US\14filetypes\1\6\0\0\btex\tltex\nlatex\rmarkdown\rplaintex\1\0\1\26debounce_text_changes\3�\1\0\1\0\0\tltex\1\0\1\26debounce_text_changes\3�\1\1\0\0\1\0\1\17runtime_path\2\16sumneko_lua\rsettings\1\0\0\16checkOnSave\1\0\0\1\0\1\fcomamnd\vclippy\nflags\1\0\1\26debounce_text_changes\3�\1\14on_attach\18LSP_ON_ATTACH\17capabilities\1\0\0\nsetup\14lspconfig\18rust_analyzer\vclangd\npairs\19semanticTokens\1\0\0\1\0\1\19refreshSupport\2\14workspace\25default_capabilities\17cmp_nvim_lsp\frequire\1\18\0\0\fasm_lsp\vbashls\vclangd\14gradle_ls\rgroovyls\14omnisharp\ncmake\ncssls\ngopls\thtml\18rust_analyzer\tltex\rmarksman\fpyright\ntaplo\rtsserver\16sumneko_lua\0", "config", "nvim-lspconfig")

vim.cmd [[ packadd trouble.nvim ]]

-- Config for: trouble.nvim
try_loadstring("\27LJ\2\n�\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nsigns\1\0\4\thint\t \nerror\t \fwarning\t \16information\t \16action_keys\1\0\t\frefresh\n<C-r>\nhover\14<C-A-S-k>\nclose\15<C-l><C-k>\15jump_close\v<C-CR>\ropen_tab\14<C-A-S-t>\15open_split\14<C-A-S-h>\tjump\t<CR>\vcancel\n<esc>\16open_vsplit\14<C-A-S-s>\1\0\3\tmode\25document_diagnostics\17auto_preview\nfalse\25use_diagnostic_signs\1\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")

vim.cmd [[ packadd clangd_extensions.nvim ]]

-- Config for: clangd_extensions.nvim
try_loadstring("\27LJ\2\n�\3\0\0\6\0\23\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\5\0005\2\4\0=\2\6\1=\1\3\0006\1\0\0'\3\a\0B\1\2\0029\1\b\0015\3\17\0005\4\t\0=\0\n\0046\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\4=\4\18\0035\4\20\0005\5\19\0=\5\21\4=\4\22\3B\1\2\1K\0\1\0\15extensions\16inlay_hints\1\0\0\1\0\2\23other_hints_prefix\b-> \27parameter_hints_prefix\nfn : \vserver\1\0\0\bcmd\1\5\0\0\vclangd\23--background-index\31--suggest-missing-includes\20--enable-config\nflags\1\0\1\26debounce_text_changes\3�\1\14on_attach\18LSP_ON_ATTACH\17capabilities\1\0\0\nsetup\22clangd_extensions\19semanticTokens\1\0\0\1\0\1\19refreshSupport\2\14workspace\25default_capabilities\17cmp_nvim_lsp\frequire\0", "config", "clangd_extensions.nvim")

vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\1\0\2\n\0\t\0\0206\2\0\0'\4\1\0B\2\2\0029\3\2\0018\3\3\0029\4\2\1=\3\2\0016\5\4\0009\5\5\0059\a\3\1)\b\1\0)\tK\0B\5\4\2=\5\3\1'\5\a\0\18\6\4\0'\a\b\0&\5\a\5=\5\6\1L\1\2\0\6)\t   (\tmenu\bsub\vstring\tabbr\tkind\18lspkind_icons\frequire�\1\0\1\5\3\b\1!-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\23�6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5�-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\v�-\1\2\0B\1\1\2\15\0\1\0X\2\5�-\1\0\0009\1\a\1+\3\0\0B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\2�\1�\0�\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\21select_next_item\fvisible\2�\1\0\1\5\2\a\1\24-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\14�6\1\2\0009\1\3\0019\1\4\1)\3��B\1\2\2\t\1\0\0X\1\5�-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\2�\1�\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2�\17\1\0\14\0]\0�\0023\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0024\3\t\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\0035\4\v\0>\4\b\0039\4\f\0025\6\16\0005\a\14\0003\b\r\0=\b\15\a=\a\17\0065\a\21\0005\b\18\0006\t\19\0=\t\20\b=\b\22\a5\b\23\0006\t\19\0=\t\20\b=\b\24\a=\a\25\0065\a\27\0005\b\26\0=\b\28\a3\b\29\0=\b\30\a=\a\31\0065\a!\0005\b \0=\b\"\a=\a#\0065\a,\0004\b\a\0009\t$\0029\t%\t9\t&\t>\t\1\b9\t$\0029\t%\t9\t'\t>\t\2\b9\t$\0029\t%\t9\t(\t>\t\3\b9\t$\0029\t%\t9\t)\t>\t\4\b9\t$\0029\t%\t9\t*\t>\t\5\b9\t$\0029\t%\t9\t+\t>\t\6\b=\b-\a=\a.\0069\a/\0029\a0\a9\a1\a5\t3\0009\n/\0029\n2\nB\n\1\2=\n4\t9\n/\0023\f5\0005\r6\0B\n\3\2=\n7\t9\n/\0023\f8\0005\r9\0B\n\3\2=\n:\t9\n/\0029\n;\n5\f<\0B\n\2\2=\n=\tB\a\2\2=\a/\0069\a$\0029\a>\a4\t\5\0005\n?\0>\n\1\t5\n@\0>\n\2\t5\nA\0>\n\3\t5\nB\0>\n\4\t4\n\3\0005\vC\0>\v\1\nB\a\3\2=\a>\6B\4\2\0019\4\f\0029\4D\4'\6E\0005\aH\0009\b$\0029\b>\b4\n\3\0005\vF\0>\v\1\n4\v\3\0005\fG\0>\f\1\vB\b\3\2=\b>\a5\bI\0004\t\a\0009\n$\0029\n%\n9\n&\n>\n\1\t9\n$\0029\n%\n9\n'\n>\n\2\t9\n$\0029\n%\n9\n(\n>\n\3\t9\n$\0029\n%\n9\n)\n>\n\4\t9\n$\0029\n%\n9\n*\n>\n\5\t9\n$\0029\n%\n9\n+\n>\n\6\t=\t-\b=\b.\aB\4\3\0019\4\f\0029\4D\4'\6J\0005\aN\0009\b$\0029\b>\b4\n\4\0005\vK\0>\v\1\n5\vL\0>\v\2\n5\vM\0>\v\3\nB\b\2\2=\b>\a5\bO\0004\t\a\0009\n$\0029\n%\n9\n&\n>\n\1\t9\n$\0029\n%\n9\n'\n>\n\2\t9\n$\0029\n%\n9\n(\n>\n\3\t9\n$\0029\n%\n9\n)\n>\n\4\t9\n$\0029\n%\n9\n*\n>\n\5\t9\n$\0029\n%\n9\n+\n>\n\6\t=\t-\b=\b.\aB\4\3\0019\4\f\0029\4P\4'\6Q\0005\aR\0009\b/\0029\b0\b9\bP\bB\b\1\2=\b/\a9\b$\0029\b>\b4\n\3\0005\vS\0>\v\1\n5\vT\0>\v\2\nB\b\2\2=\b>\a5\bU\0004\t\a\0009\n$\0029\n%\n9\n&\n>\n\1\t9\n$\0029\n%\n9\n'\n>\n\2\t9\n$\0029\n%\n9\n(\n>\n\3\t9\n$\0029\n%\n9\n)\n>\n\4\t9\n$\0029\n%\n9\n*\n>\n\5\t9\n$\0029\n%\n9\n+\n>\n\6\t=\t-\b=\b.\aB\4\3\0019\4\f\0029\4P\4'\6V\0005\aW\0009\b/\0029\b0\b9\bP\bB\b\1\2=\b/\a9\b$\0029\b>\b4\n\3\0005\vX\0>\v\1\n5\vY\0>\v\2\nB\b\2\2=\b>\a5\b\\\0004\t\5\0009\n$\0029\n%\n9\n&\n>\n\1\t9\n$\0029\n%\n9\nZ\n>\n\2\t9\n$\0029\n%\n9\n[\n>\n\3\t9\n$\0029\n%\n9\n+\n>\n\4\t=\t-\b=\b.\aB\4\3\0012\0\0�K\0\1\0\1\0\0\vlength\14sort_text\1\0\1\tname\fcmdline\1\0\1\tname\15fuzzy_path\1\0\0\6:\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\1\0\0\6/\fcmdline\1\0\0\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\17cmp_nvim_lua\1\0\1\tname\rnvim_lsp\blua\1\0\0\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_zsh\1\0\1\tname\vcrates\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\1\fconfirm\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-Space>\1\0\0\rcomplete\vinsert\vpreset\fmapping\fsorting\16comparators\1\0\0\voffset\tkind\vscopes\18recently_used\rlocality\nscore\fcompare\vconfig\tview\fentries\1\0\0\1\0\1\tname\vcustom\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\vwindow\18documentation\1\0\1\17winhighlight)Normal:Float,FloatBorder:FloatBorder\15completion\1\0\0\vborder\vBORDER\1\0\3\17side_padding\3\0\15col_offset\3����\15\17winhighlightINormal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\1\3\0\0\b┃\16FloatBorder\1\3\0\0\b┗\16FloatBorder\1\3\0\0\b━\16FloatBorder\1\3\0\0\b┛\16FloatBorder\1\3\0\0\b┃\16FloatBorder\1\3\0\0\b┓\16FloatBorder\1\3\0\0\b━\16FloatBorder\1\3\0\0\b┏\16FloatBorder\bcmp\frequire\0\0\0", "config", "nvim-cmp")

vim.cmd [[ packadd mason.nvim ]]

-- Config for: mason.nvim
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\22package_installed\b✓\24package_uninstalled\b✗\20package_pending\b➜\nsetup\nmason\frequire\0", "config", "mason.nvim")

vim.cmd [[ packadd mason-lspconfig.nvim ]]

-- Config for: mason-lspconfig.nvim
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\18\0\0\fasm_lsp\vbashls\vclangd\14gradle_ls\14omnisharp\ncmake\ncssls\ngopls\thtml\18rust_analyzer\tltex\njdtls\rmarksman\fpyright\16sumneko_lua\ntaplo\rtsserver\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")

vim.cmd [[ packadd nvim-dap ]]

-- Config for: nvim-dap
try_loadstring("\27LJ\2\ng\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim�\4\1\0\v\0\29\00066\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\f\0006\4\5\0009\4\6\0049\4\a\4'\6\b\0B\4\2\0026\5\t\0B\5\1\2'\6\n\0006\a\t\0B\a\1\2'\b\v\0006\t\t\0B\t\1\2'\n\3\0&\4\n\4=\4\r\0035\4\14\0=\4\15\3=\3\16\2=\2\3\0019\1\17\0004\2\3\0005\3\19\0003\4\20\0=\4\21\3>\3\1\2=\2\18\0019\1\17\0009\2\17\0009\2\18\2=\2\22\0019\1\17\0009\2\17\0009\2\18\2=\2\23\0016\1\5\0009\1\6\0019\1\24\1'\3\25\0005\4\26\0B\1\3\0016\1\5\0009\1\6\0019\1\24\1'\3\27\0005\4\28\0B\1\3\1K\0\1\0\1\0\2\vtexthl\nField\ttext\b○\26DapBreakpointRejected\1\0\2\vtexthl\nField\ttext\b●\18DapBreakpoint\16sign_define\trust\6c\fprogram\0\1\0\5\frequest\vlaunch\ttype\rcodelldb\16stopOnEntry\2\tname\nDebug\bcwd\23${workspaceFolder}\bcpp\19configurations\15executable\targs\1\3\0\0\v--port\f${port}\fcommand\1\0\0\bbin\nmason\rPATH_SEP\tdata\fstdpath\afn\bvim\1\0\2\ttype\vserver\tport\f${port}\rcodelldb\radapters\bdap\frequire\0", "config", "nvim-dap")

vim.cmd [[ packadd nvim-dap-ui ]]

-- Config for: nvim-dap-ui
try_loadstring("\27LJ\2\nl\0\0\3\2\6\0\r-\0\0\0009\0\0\0004\2\0\0B\0\2\0016\0\1\0009\0\2\0'\2\3\0B\0\2\1-\0\1\0009\0\4\0009\0\5\0B\0\1\1K\0\1\0\0�\1�\nclose\trepl\25DapVirtualTextEnable\bcmd\bvim\topenh\0\0\3\2\5\0\r-\0\0\0009\0\0\0004\2\0\0B\0\2\0016\0\1\0009\0\2\0'\2\3\0B\0\2\1-\0\1\0009\0\4\0009\0\0\0B\0\1\1K\0\1\0\0�\1�\trepl\26DapVirtualTextDisable\bcmd\bvim\ncloseV\0\0\3\1\5\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\1-\0\0\0009\0\3\0009\0\4\0B\0\1\1K\0\1\0\1�\nclose\trepl\26DapVirtualTextDisable\bcmd\bvim(\0\0\2\1\2\0\5-\0\0\0009\0\0\0009\0\1\0B\0\1\1K\0\1\0\1�\nclose\trepl(\0\0\2\1\2\0\5-\0\0\0009\0\0\0009\0\1\0B\0\1\1K\0\1\0\1�\nclose\trepl�\4\1\0\b\0\26\00046\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0004\4\3\0005\5\6\0004\6\4\0005\a\3\0>\a\1\0065\a\4\0>\a\2\0065\a\5\0>\a\3\6=\6\a\5>\5\1\0045\5\t\0005\6\b\0=\6\a\5>\5\2\4=\4\v\3B\1\2\0016\1\0\0'\3\f\0B\1\2\0029\2\r\0019\2\14\0029\2\15\0023\3\17\0=\3\16\0029\2\r\0019\2\18\0029\2\15\0023\3\19\0=\3\16\0029\2\r\0019\2\18\0029\2\20\0023\3\21\0=\3\16\0029\2\r\0019\2\14\0029\2\22\0023\3\23\0=\3\16\0029\2\r\0019\2\14\0029\2\24\0023\3\25\0=\3\16\0022\0\0�K\0\1\0\0\17event_output\0\18event_stopped\0\17event_exited\0\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\bdap\flayouts\1\0\0\1\0\2\rposition\vbottom\tsize\4\0����\3\1\3\0\0\trepl\fconsole\relements\1\0\2\rposition\nright\tsize\3(\1\0\2\tsize\4��̙\3���\3\aid\vscopes\1\0\2\tsize\4����\t����\3\aid\16breakpoints\1\0\2\tsize\4����\t����\3\aid\vstacks\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")

vim.cmd [[ packadd statuscol.nvim ]]

-- Config for: statuscol.nvim
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\16relculright\2\vsetopt\2\nsetup\14statuscol\frequire\0", "config", "statuscol.nvim")

vim.cmd [[ packadd nvim-dap-virtual-text ]]

-- Config for: nvim-dap-virtual-text
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0", "config", "nvim-dap-virtual-text")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead .zshrc ++once lua require("packer.load")({'cmp-zsh'}, { event = "BufRead .zshrc" }, _G.packer_plugins)]]
vim.cmd [[au BufRead *.sh ++once lua require("packer.load")({'cmp-zsh'}, { event = "BufRead *.sh" }, _G.packer_plugins)]]
vim.cmd [[au BufRead .bashrc ++once lua require("packer.load")({'cmp-zsh'}, { event = "BufRead .bashrc" }, _G.packer_plugins)]]
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
