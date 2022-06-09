-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
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
    config = { "\27LJ\2\n˚\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\nextra\1\0\3\nabove\16<leader>lcO\beol\16<leader>lce\nbelow\16<leader>lco\ropleader\1\0\2\nblock\15<leader>Bc\tline\15<leader>Lc\ftoggler\1\0\2\nblock\15<leader>bc\tline\15<leader>lc\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["DoxygenToolkit.vim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/DoxygenToolkit.vim",
    url = "https://github.com/vim-scripts/DoxygenToolkit.vim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nø\2\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\6!diagnostics_update_in_insert\2\27always_show_bufferline\2\20separator_style\nthick\22show_buffer_icons\2\16diagnostics\rnvim_lsp\24right_mouse_command\5\1\0\4\rfiletype\rNvimTree\15text_align\tleft\14highlight\14Directory\ttext\18File Explorer\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
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
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
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
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cmp-zsh",
    url = "https://github.com/tamago324/cmp-zsh"
  },
  ["cosmic-ui"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14cosmic-ui\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/cosmic-ui",
    url = "https://github.com/CosmicNvim/cosmic-ui"
  },
  ["crates.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/Saecki/crates.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lua-dev.nvim"] = {
    after = { "nvim-lspconfig" },
    loaded = true,
    only_config = true
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n,\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\18previewwindow\awo\bvim'\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\rreadonly\abo\bvimC\0\0\1\0\4\0\t6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\rquickfix\fbuftype\abo\bvimÎ\f\1\0\b\0R\0y5\0\r\0005\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0=\2\n\0015\2\v\0=\2\f\1=\1\14\0005\1\16\0005\2\15\0=\2\2\0015\2\17\0=\2\4\0015\2\18\0=\2\n\0015\2\19\0=\2\f\1=\1\20\0005\1\22\0005\2\21\0=\2\2\0015\2\23\0=\2\4\0015\2\24\0=\2\n\0015\2\25\0=\2\f\1=\1\26\0005\1\28\0005\2\27\0=\2\2\0015\2\29\0=\2\4\0015\2\30\0=\2\n\0015\2\31\0=\2\f\1=\1 \0005\1\"\0005\2!\0=\2\2\0015\2#\0=\2\4\0015\2$\0=\2\n\0015\2%\0=\2\f\1=\1&\0006\1'\0'\3(\0B\1\2\0029\1)\0015\0030\0005\4*\0=\0+\0045\5,\0=\5-\0045\5.\0=\5/\4=\0041\0035\0042\0=\0043\0035\0045\0005\0054\0=\0056\0045\0057\0005\0068\0>\6\3\0055\0069\0003\a:\0=\a;\6>\6\4\0055\6<\0003\a=\0=\a;\6>\6\5\0055\6>\0003\a?\0=\a;\6>\6\6\5=\5@\0044\5\0\0=\5A\0044\5\3\0005\6B\0005\aC\0=\aD\0065\aE\0=\aF\6>\6\1\5=\5G\0044\5\4\0005\6H\0>\6\1\0055\6I\0>\6\2\0055\6J\0>\6\3\5=\5K\0044\5\3\0005\6L\0>\6\1\0055\6M\0>\6\2\5=\5N\4=\4F\0035\4P\0005\5O\0=\5A\0044\5\0\0=\5G\4=\4Q\3B\1\2\1K\0\1\0\22inactive_sections\1\0\0\1\2\0\0\r%f %y %m\14lualine_z\1\2\0\0\rprogress\1\2\0\0\rlocation\14lualine_y\1\2\0\0\15fileformat\1\2\0\0\rencoding\1\2\0\0\rfiletype\14lualine_x\rsections\1\3\0\0\nerror\twarn\fsources\1\2\0\0\rnvim_lsp\1\2\2\0\16diagnostics\21update_in_insert\2\19always_visible\2\14lualine_c\14lualine_b\0\1\2\0\0\a%q\0\1\2\0\0\a%r\tcond\0\1\2\0\0\a%w\1\2\2\0\rfilename\16file_status\2\tpath\3\1\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\15extensions\1\3\0\0\rquickfix\rfugitive\foptions\1\0\0\23section_separators\1\0\2\tleft\bÓÇ∏\nright\bÓÇ∫\25component_separators\1\0\2\tleft\5\nright\5\ntheme\1\0\2\17globalstatus\2\25always_divide_middle\2\nsetup\flualine\frequire\fcommand\1\0\2\abg\f#e06c75\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\0\1\0\2\abg\f#e06c75\afg\f#23272e\freplace\1\0\2\abg\f#e06c75\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\0\1\0\2\abg\f#e06c75\afg\f#23272e\vvisual\1\0\2\abg\f#c678dd\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#c678dd\1\0\2\abg\f#23272e\afg\f#c678dd\1\0\0\1\0\2\abg\f#c678dd\afg\f#23272e\vinsert\1\0\2\abg\f#61afef\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#61afef\1\0\2\abg\f#23272e\afg\f#61afef\1\0\0\1\0\2\abg\f#61afef\afg\f#23272e\vnormal\1\0\0\6z\1\0\2\abg\f#98c379\afg\f#23272e\6y\1\0\2\abg\f#23272e\afg\f#98c379\6x\1\0\2\abg\f#303742\afg\f#9daaaa\6c\1\0\2\abg\f#303742\afg\f#9daaaa\6b\1\0\2\abg\f#23272e\afg\f#98c379\6a\1\0\0\1\0\2\abg\f#98c379\afg\f#23272e\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nŒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\a\fmap_c_h\1\vmap_bs\2\vmap_cr\1\21enable_moveright\1\27disable_in_visualblock\2\21disable_in_macro\2\fmap_c_w\1\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimf\0\2\b\0\6\0\f6\2\0\0'\4\1\0B\2\2\0026\3\3\0009\3\4\3'\5\5\0009\6\2\0018\6\6\0029\a\2\1B\3\4\2=\3\2\1L\1\2\0\n%s %s\vformat\vstring\tkind\18lspkind_icons\frequireÂ\1\0\1\5\3\b\1 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\22Ä6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5Ä-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\1¿\0¿\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\21select_next_item\fvisible\2®\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\vÄ6\0\2\0009\0\3\0009\0\4\0)\2ˇˇB\0\2\2\t\0\0\0X\0\4Ä-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\3¿\1¿\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2œ\t\1\0\14\0D\0ë\0013\0\0\0003\1\1\0004\2\t\0005\3\2\0>\3\1\0025\3\3\0>\3\2\0025\3\4\0>\3\3\0025\3\5\0>\3\4\0025\3\6\0>\3\5\0025\3\a\0>\3\6\0025\3\b\0>\3\a\0025\3\t\0>\3\b\0026\3\n\0'\5\v\0B\3\2\0029\4\f\0035\6\16\0005\a\14\0003\b\r\0=\b\15\a=\a\17\0065\a\20\0005\b\18\0=\2\19\b=\b\21\a5\b\22\0=\2\19\b=\b\23\a=\a\24\0065\a\26\0003\b\25\0=\b\27\a=\a\28\0065\a\30\0005\b\29\0=\b\31\a=\a \0069\a!\0039\a\"\a9\a#\a5\t%\0009\n!\0039\n$\nB\n\1\2=\n&\t9\n!\0033\f'\0005\r(\0B\n\3\2=\n)\t9\n!\0033\f*\0005\r+\0B\n\3\2=\n,\tB\a\2\2=\a!\0069\a-\0039\a.\a4\t\3\0005\n/\0>\n\1\t5\n0\0>\n\2\t4\n\3\0005\v1\0>\v\1\nB\a\3\2=\a.\6B\4\2\0019\4\f\0039\0042\4'\0063\0005\a6\0009\b-\0039\b.\b4\n\3\0005\v4\0>\v\1\n4\v\3\0005\f5\0>\f\1\vB\b\3\2=\b.\aB\4\3\0019\4\f\0039\0042\4'\0067\0005\a;\0009\b-\0039\b.\b4\n\3\0005\v8\0>\v\1\n5\v9\0>\v\2\n4\v\3\0005\f:\0>\f\1\vB\b\3\2=\b.\aB\4\3\0019\4\f\0039\4<\4'\6=\0005\a>\0009\b!\0039\b\"\b9\b<\bB\b\1\2=\b!\a4\b\3\0005\t?\0>\t\1\b=\b.\aB\4\3\0019\4\f\0039\4<\4'\6@\0005\aA\0009\b!\0039\b\"\b9\b<\bB\b\1\2=\b!\a9\b-\0039\b.\b4\n\3\0005\vB\0>\v\1\n4\v\3\0005\fC\0>\f\1\vB\b\3\2=\b.\aB\4\3\0012\0\0ÄK\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\17cmp_nvim_lua\1\0\1\tname\rnvim_lsp\blua\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-space>\1\0\0\rcomplete\vinsert\vpreset\fmapping\tview\fentries\1\0\0\1\0\2\20selection_order\16near_cursor\tname\vcustom\15formatting\vformat\1\0\0\0\vwindow\18documentation\1\0\0\15completion\1\0\0\vborder\1\0\0\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\0\0\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    after = { "nvim-lspconfig" },
    loaded = true,
    only_config = true
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-cmp", "trouble.nvim" },
    config = { "\27LJ\2\n:\0\4\n\0\3\0\t6\4\0\0009\4\1\0049\4\2\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\bset\vkeymap\bvim'\0\3\t\1\1\0\a-\3\0\0'\5\0\0\18\6\0\0\18\a\1\0\18\b\2\0B\3\5\1K\0\1\0\2¿\6n>\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\23document_highlight\bbuf\blsp\bvimÎ\4\1\2\n\0\20\0\0316\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0013\2\5\0003\3\6\0005\4\a\0=\1\b\0049\5\t\0009\5\n\5\15\0\5\0X\6\14Ä6\5\0\0009\5\v\5'\a\f\0B\5\2\0016\5\0\0009\5\1\0059\5\r\0055\a\14\0005\b\16\0005\t\15\0=\t\17\b3\t\18\0=\t\19\bB\5\3\0012\0\0ÄK\0\1\0\rcallback\0\fpattern\1\0\0\1\2\0\0\6*\1\b\0\0\rBufEnter\fBufRead\rBufWrite\16ColorScheme\17InsertChange\16InsertEnter\14WinClosed\24nvim_create_autocmdÈ\1\t\t\t\t\taugroup lsp_document_highlight\n\t\t\t\t\t  autocmd! * <buffer>\n\t\t\t\t\t  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n\t\t\t\t\t  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n\t\t\t\t\taugroup END\n\t\t\t\t\t\bcmd\23document_highlight\26resolved_capabilities\vbuffer\1\0\2\fnoremap\2\vsilent\2\0\0\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimÌ\1\0\4\f\0\f\0\0236\4\0\0009\4\1\0049\4\2\4)\6\0\0'\a\3\0005\b\6\0006\t\0\0009\t\1\t9\t\4\t9\t\5\tB\t\1\2=\t\a\b6\t\0\0009\t\b\t9\t\t\t)\v\0\0B\t\2\2=\t\n\b+\t\0\0B\4\5\0016\4\0\0009\4\v\4L\4\2\0\bNIL\ttick\29nvim_buf_get_changedtick\bapi\17textDocument\1\0\0\30make_text_document_params\tutil%textDocument/semanticTokens/full\16buf_request\blsp\bvimñ\1\0\2\b\0\a\1\0276\2\0\0009\2\1\2\15\0\2\0X\3\fÄ6\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0\18\a\1\0B\4\3\2)\5\1\0D\2\3\0X\2\nÄ6\2\4\0009\2\5\0026\4\4\0009\4\6\4)\6\2\0\18\a\1\0B\4\3\2#\4\4\0\26\4\0\4D\2\2\0K\0\1\0\bpow\nfloor\tmath\vrshift\tband\bbit\a_G\4k\0\2\r\1\2\1\0214\2\0\0)\3\0\0\21\4\1\0\23\4\0\4)\5\1\0M\3\14Ä-\a\0\0\18\t\0\0\18\n\6\0B\a\3\2\t\a\0\0X\b\aÄ6\b\0\0009\b\1\b\18\n\2\0)\v\1\0\22\f\0\0068\f\f\1B\b\4\1O\3ÚL\2\2\0\4¿\vinsert\ntable\2´\6\1\4&\0\24\5}\14\0\0\0X\4\vÄ\15\0\1\0X\4\tÄ9\4\0\0029\4\1\0046\5\2\0009\5\3\0059\5\4\0059\a\5\2B\5\2\2\4\4\5\0X\4\1Ä2\0nÄ3\4\6\0003\5\a\0009\6\5\0026\a\2\0009\a\b\a9\a\t\a9\t\n\2B\a\2\0029\b\v\a9\b\f\b9\b\r\b9\t\14\b9\n\15\b9\v\16\0016\f\2\0009\f\3\f9\f\17\f'\14\18\0B\f\2\0026\r\2\0009\r\3\r9\r\19\r\18\15\6\0\18\16\f\0)\17\0\0)\18ˇˇB\r\5\1+\r\0\0)\14\0\0)\15\1\0\21\16\v\0)\17\5\0M\15KÄ8\19\18\v\15\0\r\0X\20\3Ä \20\19\r\f\r\20\0X\21\1Ä\18\r\19\0\22\20\0\0188\20\20\v\t\19\1\0X\21\3Ä \21\20\14\f\14\21\0X\22\1Ä\18\14\20\0\22\21\2\0188\21\21\v\22\21\0\0218\21\21\t\18\22\5\0\22\24\3\0188\24\24\v\18\25\n\0B\22\3\0026\23\2\0009\23\3\0239\23\20\23\18\25\6\0\18\26\r\0\22\27\0\r+\28\1\0B\23\5\2:\23\1\0236\24\2\0009\24\21\24\18\26\23\0\18\27\14\0B\24\3\0026\25\2\0009\25\21\25\18\27\23\0\22\28\4\0188\28\28\v \28\28\14B\25\3\0026\26\2\0009\26\3\0269\26\22\26\18\28\6\0\18\29\f\0'\30\23\0\18\31\21\0&\30\31\30\18\31\r\0\18 \24\0\18!\25\0B\26\a\1)\26\1\0\21\27\22\0)\28\1\0M\26\rÄ6\30\2\0009\30\3\0309\30\22\30\18 \6\0\18!\f\0'\"\23\0008#\29\22&\"#\"\18#\r\0\18$\24\0\18%\25\0B\30\a\1O\26ÛO\15µ2\0\0ÄK\0\1\0K\0\1\0\17LspSemantic_\27nvim_buf_add_highlight\18str_byteindex\23nvim_buf_get_lines\29nvim_buf_clear_namespace\22nvim-lsp-semantic\26nvim_create_namespace\tdata\19tokenModifiers\15tokenTypes\vlegend\27semanticTokensProvider\24server_capabilities\14client_id\21get_client_by_id\blsp\0\0\nbufnr\29nvim_buf_get_changedtick\bapi\bvim\ttick\vparams\2\0\6\b\4€\a\1\0\15\0*\0]3\0\0\0005\1\1\0005\2\3\0003\3\2\0=\3\4\0023\3\5\0=\3\6\0026\3\a\0'\5\b\0B\3\2\0029\3\t\0036\5\n\0009\5\v\0059\5\f\0059\5\r\5B\5\1\0A\3\0\0029\4\14\0035\5\16\0=\5\15\0046\4\17\0\18\6\1\0B\4\2\4H\aBÄ\a\b\18\0X\t\rÄ6\t\a\0'\v\19\0B\t\2\0028\t\b\t9\t\20\t5\v\21\0=\3\22\v=\0\23\v5\f\24\0=\f\25\v=\2\26\vB\t\2\1X\t3Ä\a\b\27\0X\t\18Ä6\t\a\0'\v\19\0B\t\2\0028\t\b\t9\t\20\t5\v\28\0=\3\22\v=\0\23\v5\f\29\0=\f\25\v5\f!\0005\r\31\0005\14\30\0=\14 \r=\r\27\f=\f\"\vB\t\2\1X\t\31Ä\a\b#\0X\t\19Ä6\t\a\0'\v$\0B\t\2\0029\t\20\t5\v%\0005\f&\0=\0\23\f5\r'\0=\r\25\f=\f\19\vB\t\2\0026\n\a\0'\f\19\0B\n\2\0028\n\b\n9\n\20\n\18\f\t\0B\n\2\1X\t\nÄ6\t\a\0'\v\19\0B\t\2\0028\t\b\t9\t\20\t5\v(\0=\0\23\v5\f)\0=\f\25\vB\t\2\1F\a\3\3R\aºK\0\1\0\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\1\0\1\17runtime_path\2\flua-dev\16sumneko_lua\rsettings\1\0\0\16checkOnSave\1\0\0\1\0\1\fcomamnd\vclippy\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\18rust_analyzer\rhandlers\nflags\1\0\1\26debounce_text_changes\3ñ\1\14on_attach\17capabilities\1\0\0\nsetup\14lspconfig\vclangd\npairs\1\0\1\19refreshSupport\2\19semanticTokens\14workspace\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire%textDocument/semanticTokens/full\0%workspace/semanticTokens/refresh\1\0\0\0\1\16\0\0\fasm_lsp\vbashls\vclangd\14omnisharp\ncmake\ncssls\ngopls\thtml\18rust_analyzer\tltex\rmarksman\fpyright\ntaplo\rtsserver\16sumneko_lua\0\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nç\2\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0027\0\1\0006\0\2\0006\1\1\0=\1\1\0006\0\1\0009\0\3\0005\2\4\0005\3\5\0=\3\6\2B\0\2\1K\0\1\0\nicons\1\0\5\nTRACE\b‚úé\nERROR\bÔÅó\nDEBUG\bÔÜà\tINFO\bÔÅö\tWARN\bÔÅ™\1\0\b\nlevel\twarn\ftimeout\3ƒ\19\14max_width\3<\vstages\22fade_in_slide_out\vrender\fdefault\18minimum_width\3\30\bfps\3\30\22background_colour\vNormal\nsetup\bvim\vnotify\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\ná\a\0\0\a\0\"\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\t\0005\4\a\0004\5\3\0005\6\6\0>\6\1\5=\5\b\4=\4\n\3=\3\v\0025\3\f\0005\4\r\0005\5\14\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0=\5\19\0045\5\20\0005\6\21\0=\6\22\0055\6\23\0=\6\24\5=\5\25\4=\4\15\3=\3\26\0025\3\27\0005\4\28\0=\4\15\3=\3\29\0025\3\31\0005\4\30\0=\4 \3=\3!\2B\0\2\1K\0\1\0\factions\15change_dir\1\0\0\1\0\1\venable\1\16diagnostics\1\0\4\thint\bÔÅ™\nerror\bÔÅó\tinfo\bÔÅö\fwarning\bÔÅ±\1\0\2\venable\2\17show_on_dirs\1\rrenderer\vglyphs\bgit\1\0\a\fdeleted\bÔëò\runmerged\bÓúß\vstaged\b‚úì\runstaged\b‚úó\fignored\b‚óå\14untracked\b‚òÖ\frenamed\b‚ûú\vfolder\1\0\b\topen\bÓóæ\fdefault\bÓóø\nempty\bÔÑî\fsymlink\bÔíÇ\15arrow_open\bÔëº\17symlink_open\bÔíÇ\17arrow_closed\bÔë†\15empty_open\bÔÑï\1\0\2\fsymlink\bÔíÅ\fdefault\bÔí•\tshow\1\0\4\17folder_arrow\2\vfolder\2\bgit\2\tfile\2\1\0\4\fpadding\6 \18webdev_colors\2\18symlink_arrow\n ‚ûõ \18git_placement\vbefore\19indent_markers\nicons\1\0\3\tnone\a  \vcorner\t‚îî \tedge\t‚îÇ \1\0\1\venable\2\1\0\2\27highlight_opened_files\ball\18highlight_git\2\tview\rmappings\1\0\0\tlist\1\0\0\1\0\3\tmode\6n\vaction\nclose\bkey\n<C-t>\24update_focused_file\1\0\1\20respect_buf_cwd\2\1\0\2\venable\2\15update_cwd\1\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n∆\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\21ensure_installed\1\0\0\1\29\0\0\tbash\6c\ncmake\fcomment\bcpp\fc_sharp\bcss\tcuda\6d\rgdscript\tglsl\ago\nhjson\thtml\tjava\15javascript\tjson\njson5\njsonc\vkotlin\blua\vpython\trust\ttoml\15typescript\bvim\tyaml\bzig\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvterm = {
    config = { "\27LJ\2\nØ\3\0\0\6\0\19\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\4=\4\f\3=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\2B\0\2\1K\0\1\0\vtoggle\1\0\2\nfloat\f<C-S-t>\15horizontal\b<T>\rbehavior\1\0\2\18close_on_exit\2\16auto_insert\2\14terminals\1\0\0\14type_opts\rvertical\1\0\2\rlocation\nright\16split_ratio\4\0ÄÄÄˇ\3\15horizontal\1\0\2\rlocation\nbelow\16split_ratio\4≥ÊÃô\3≥ÊÃ˛\3\nfloat\1\0\0\1\0\6\rrelative\veditor\nwidth\4≥ÊÃô\3≥Êåˇ\3\vheight\4≥ÊÃô\3≥ÊÃ˛\3\brow\4≥ÊÃô\3≥ÊÃ˛\3\bcol\4\0ÄÄ¿˛\3\vborder\vsingle\tlist\1\0\0\nsetup\vnvterm\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/nvterm",
    url = "https://github.com/NvChad/nvterm"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n…\3\0\0\b\0\23\0$6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\21\0005\4\17\0005\5\r\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\t\0=\a\n\0069\a\v\0=\a\f\6=\6\14\0055\6\15\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\t\0=\a\n\0069\a\v\0=\a\f\6=\6\16\5=\5\18\0045\5\19\0=\5\20\4=\4\22\3B\1\2\1K\0\1\0\rdefaults\1\0\0\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\v--trim\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<S-k>\25preview_scrolling_up\n<S-j>\27preview_scrolling_down\f<S-A-k>\28move_selection_previous\f<S-A-j>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nsigns\1\0\4\thint\tÔ†µ \16information\tÔëâ \nerror\tÔôô \fwarning\tÔî© \16action_keys\1\0\t\nclose\15<C-l><C-k>\nhover\14<C-A-S-k>\tjump\t<CR>\16open_vsplit\14<C-A-S-s>\15open_split\14<C-A-S-h>\15jump_close\v<C-CR>\ropen_tab\14<C-A-S-t>\vcancel\n<esc>\frefresh\n<C-r>\1\0\3\25use_diagnostic_signs\1\tmode\25document_diagnostics\17auto_preview\nfalse\nsetup\ftrouble\frequire\0" },
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
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/braxton/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
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
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nÑ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\vmargin\1\5\0\0\3\2\3\2\3\2\3\2\1\0\2\rwinblend\3\1\vborder\vsingle\nsetup\14which-key\frequire\0" },
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
-- Config for: lua-dev.nvim
time([[Config for lua-dev.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17runtime_path\2\nsetup\flua-dev\frequire\0", "config", "lua-dev.nvim")
time([[Config for lua-dev.nvim]], false)
-- Config for: nvterm
time([[Config for nvterm]], true)
try_loadstring("\27LJ\2\nØ\3\0\0\6\0\19\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\4=\4\f\3=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\2B\0\2\1K\0\1\0\vtoggle\1\0\2\nfloat\f<C-S-t>\15horizontal\b<T>\rbehavior\1\0\2\18close_on_exit\2\16auto_insert\2\14terminals\1\0\0\14type_opts\rvertical\1\0\2\rlocation\nright\16split_ratio\4\0ÄÄÄˇ\3\15horizontal\1\0\2\rlocation\nbelow\16split_ratio\4≥ÊÃô\3≥ÊÃ˛\3\nfloat\1\0\0\1\0\6\rrelative\veditor\nwidth\4≥ÊÃô\3≥Êåˇ\3\vheight\4≥ÊÃô\3≥ÊÃ˛\3\brow\4≥ÊÃô\3≥ÊÃ˛\3\bcol\4\0ÄÄ¿˛\3\vborder\vsingle\tlist\1\0\0\nsetup\vnvterm\frequire\0", "config", "nvterm")
time([[Config for nvterm]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nø\2\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\6!diagnostics_update_in_insert\2\27always_show_bufferline\2\20separator_style\nthick\22show_buffer_icons\2\16diagnostics\rnvim_lsp\24right_mouse_command\5\1\0\4\rfiletype\rNvimTree\15text_align\tleft\14highlight\14Directory\ttext\18File Explorer\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\ná\a\0\0\a\0\"\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\t\0005\4\a\0004\5\3\0005\6\6\0>\6\1\5=\5\b\4=\4\n\3=\3\v\0025\3\f\0005\4\r\0005\5\14\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0=\5\19\0045\5\20\0005\6\21\0=\6\22\0055\6\23\0=\6\24\5=\5\25\4=\4\15\3=\3\26\0025\3\27\0005\4\28\0=\4\15\3=\3\29\0025\3\31\0005\4\30\0=\4 \3=\3!\2B\0\2\1K\0\1\0\factions\15change_dir\1\0\0\1\0\1\venable\1\16diagnostics\1\0\4\thint\bÔÅ™\nerror\bÔÅó\tinfo\bÔÅö\fwarning\bÔÅ±\1\0\2\venable\2\17show_on_dirs\1\rrenderer\vglyphs\bgit\1\0\a\fdeleted\bÔëò\runmerged\bÓúß\vstaged\b‚úì\runstaged\b‚úó\fignored\b‚óå\14untracked\b‚òÖ\frenamed\b‚ûú\vfolder\1\0\b\topen\bÓóæ\fdefault\bÓóø\nempty\bÔÑî\fsymlink\bÔíÇ\15arrow_open\bÔëº\17symlink_open\bÔíÇ\17arrow_closed\bÔë†\15empty_open\bÔÑï\1\0\2\fsymlink\bÔíÅ\fdefault\bÔí•\tshow\1\0\4\17folder_arrow\2\vfolder\2\bgit\2\tfile\2\1\0\4\fpadding\6 \18webdev_colors\2\18symlink_arrow\n ‚ûõ \18git_placement\vbefore\19indent_markers\nicons\1\0\3\tnone\a  \vcorner\t‚îî \tedge\t‚îÇ \1\0\1\venable\2\1\0\2\27highlight_opened_files\ball\18highlight_git\2\tview\rmappings\1\0\0\tlist\1\0\0\1\0\3\tmode\6n\vaction\nclose\bkey\n<C-t>\24update_focused_file\1\0\1\20respect_buf_cwd\2\1\0\2\venable\2\15update_cwd\1\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nç\2\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0027\0\1\0006\0\2\0006\1\1\0=\1\1\0006\0\1\0009\0\3\0005\2\4\0005\3\5\0=\3\6\2B\0\2\1K\0\1\0\nicons\1\0\5\nTRACE\b‚úé\nERROR\bÔÅó\nDEBUG\bÔÜà\tINFO\bÔÅö\tWARN\bÔÅ™\1\0\b\nlevel\twarn\ftimeout\3ƒ\19\14max_width\3<\vstages\22fade_in_slide_out\vrender\fdefault\18minimum_width\3\30\bfps\3\30\22background_colour\vNormal\nsetup\bvim\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\a\fmap_c_h\1\vmap_bs\2\vmap_cr\1\21enable_moveright\1\27disable_in_visualblock\2\21disable_in_macro\2\fmap_c_w\1\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n˚\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\nextra\1\0\3\nabove\16<leader>lcO\beol\16<leader>lce\nbelow\16<leader>lco\ropleader\1\0\2\nblock\15<leader>Bc\tline\15<leader>Lc\ftoggler\1\0\2\nblock\15<leader>bc\tline\15<leader>lc\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n…\3\0\0\b\0\23\0$6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\21\0005\4\17\0005\5\r\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\t\0=\a\n\0069\a\v\0=\a\f\6=\6\14\0055\6\15\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\t\0=\a\n\0069\a\v\0=\a\f\6=\6\16\5=\5\18\0045\5\19\0=\5\20\4=\4\22\3B\1\2\1K\0\1\0\rdefaults\1\0\0\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\v--trim\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<S-k>\25preview_scrolling_up\n<S-j>\27preview_scrolling_down\f<S-A-k>\28move_selection_previous\f<S-A-j>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: cosmic-ui
time([[Config for cosmic-ui]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14cosmic-ui\frequire\0", "config", "cosmic-ui")
time([[Config for cosmic-ui]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\vmargin\1\5\0\0\3\2\3\2\3\2\3\2\1\0\2\rwinblend\3\1\vborder\vsingle\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n∆\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\2\21ensure_installed\1\0\0\1\29\0\0\tbash\6c\ncmake\fcomment\bcpp\fc_sharp\bcss\tcuda\6d\rgdscript\tglsl\ago\nhjson\thtml\tjava\15javascript\tjson\njson5\njsonc\vkotlin\blua\vpython\trust\ttoml\15typescript\bvim\tyaml\bzig\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\18previewwindow\awo\bvim'\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0L\0\2\0\rreadonly\abo\bvimC\0\0\1\0\4\0\t6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\rquickfix\fbuftype\abo\bvimÎ\f\1\0\b\0R\0y5\0\r\0005\1\1\0005\2\0\0=\2\2\0015\2\3\0=\2\4\0015\2\5\0=\2\6\0015\2\a\0=\2\b\0015\2\t\0=\2\n\0015\2\v\0=\2\f\1=\1\14\0005\1\16\0005\2\15\0=\2\2\0015\2\17\0=\2\4\0015\2\18\0=\2\n\0015\2\19\0=\2\f\1=\1\20\0005\1\22\0005\2\21\0=\2\2\0015\2\23\0=\2\4\0015\2\24\0=\2\n\0015\2\25\0=\2\f\1=\1\26\0005\1\28\0005\2\27\0=\2\2\0015\2\29\0=\2\4\0015\2\30\0=\2\n\0015\2\31\0=\2\f\1=\1 \0005\1\"\0005\2!\0=\2\2\0015\2#\0=\2\4\0015\2$\0=\2\n\0015\2%\0=\2\f\1=\1&\0006\1'\0'\3(\0B\1\2\0029\1)\0015\0030\0005\4*\0=\0+\0045\5,\0=\5-\0045\5.\0=\5/\4=\0041\0035\0042\0=\0043\0035\0045\0005\0054\0=\0056\0045\0057\0005\0068\0>\6\3\0055\0069\0003\a:\0=\a;\6>\6\4\0055\6<\0003\a=\0=\a;\6>\6\5\0055\6>\0003\a?\0=\a;\6>\6\6\5=\5@\0044\5\0\0=\5A\0044\5\3\0005\6B\0005\aC\0=\aD\0065\aE\0=\aF\6>\6\1\5=\5G\0044\5\4\0005\6H\0>\6\1\0055\6I\0>\6\2\0055\6J\0>\6\3\5=\5K\0044\5\3\0005\6L\0>\6\1\0055\6M\0>\6\2\5=\5N\4=\4F\0035\4P\0005\5O\0=\5A\0044\5\0\0=\5G\4=\4Q\3B\1\2\1K\0\1\0\22inactive_sections\1\0\0\1\2\0\0\r%f %y %m\14lualine_z\1\2\0\0\rprogress\1\2\0\0\rlocation\14lualine_y\1\2\0\0\15fileformat\1\2\0\0\rencoding\1\2\0\0\rfiletype\14lualine_x\rsections\1\3\0\0\nerror\twarn\fsources\1\2\0\0\rnvim_lsp\1\2\2\0\16diagnostics\21update_in_insert\2\19always_visible\2\14lualine_c\14lualine_b\0\1\2\0\0\a%q\0\1\2\0\0\a%r\tcond\0\1\2\0\0\a%w\1\2\2\0\rfilename\16file_status\2\tpath\3\1\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\15extensions\1\3\0\0\rquickfix\rfugitive\foptions\1\0\0\23section_separators\1\0\2\tleft\bÓÇ∏\nright\bÓÇ∫\25component_separators\1\0\2\tleft\5\nright\5\ntheme\1\0\2\17globalstatus\2\25always_divide_middle\2\nsetup\flualine\frequire\fcommand\1\0\2\abg\f#e06c75\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\0\1\0\2\abg\f#e06c75\afg\f#23272e\freplace\1\0\2\abg\f#e06c75\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\2\abg\f#23272e\afg\f#e06c75\1\0\0\1\0\2\abg\f#e06c75\afg\f#23272e\vvisual\1\0\2\abg\f#c678dd\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#c678dd\1\0\2\abg\f#23272e\afg\f#c678dd\1\0\0\1\0\2\abg\f#c678dd\afg\f#23272e\vinsert\1\0\2\abg\f#61afef\afg\f#23272e\1\0\2\abg\f#23272e\afg\f#61afef\1\0\2\abg\f#23272e\afg\f#61afef\1\0\0\1\0\2\abg\f#61afef\afg\f#23272e\vnormal\1\0\0\6z\1\0\2\abg\f#98c379\afg\f#23272e\6y\1\0\2\abg\f#23272e\afg\f#98c379\6x\1\0\2\abg\f#303742\afg\f#9daaaa\6c\1\0\2\abg\f#303742\afg\f#9daaaa\6b\1\0\2\abg\f#23272e\afg\f#98c379\6a\1\0\0\1\0\2\abg\f#98c379\afg\f#23272e\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n§\2\0\0\4\0\v\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0026\3\6\0009\3\a\0039\3\b\0039\3\t\3=\3\n\2B\0\2\1K\0\1\0\14log_level\tWARN\vlevels\blog\bvim\21ensure_installed\1\0\1\27automatic_installation\2\1\16\0\0\fasm_lsp\vbashls\vclangd\14omnisharp\ncmake\ncssls\ngopls\thtml\18rust_analyzer\tltex\rmarksman\fpyright\16sumneko_lua\ntaplo\rtsserver\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n:\0\4\n\0\3\0\t6\4\0\0009\4\1\0049\4\2\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\bset\vkeymap\bvim'\0\3\t\1\1\0\a-\3\0\0'\5\0\0\18\6\0\0\18\a\1\0\18\b\2\0B\3\5\1K\0\1\0\2¿\6n>\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\23document_highlight\bbuf\blsp\bvimÎ\4\1\2\n\0\20\0\0316\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0013\2\5\0003\3\6\0005\4\a\0=\1\b\0049\5\t\0009\5\n\5\15\0\5\0X\6\14Ä6\5\0\0009\5\v\5'\a\f\0B\5\2\0016\5\0\0009\5\1\0059\5\r\0055\a\14\0005\b\16\0005\t\15\0=\t\17\b3\t\18\0=\t\19\bB\5\3\0012\0\0ÄK\0\1\0\rcallback\0\fpattern\1\0\0\1\2\0\0\6*\1\b\0\0\rBufEnter\fBufRead\rBufWrite\16ColorScheme\17InsertChange\16InsertEnter\14WinClosed\24nvim_create_autocmdÈ\1\t\t\t\t\taugroup lsp_document_highlight\n\t\t\t\t\t  autocmd! * <buffer>\n\t\t\t\t\t  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n\t\t\t\t\t  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n\t\t\t\t\taugroup END\n\t\t\t\t\t\bcmd\23document_highlight\26resolved_capabilities\vbuffer\1\0\2\fnoremap\2\vsilent\2\0\0\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimÌ\1\0\4\f\0\f\0\0236\4\0\0009\4\1\0049\4\2\4)\6\0\0'\a\3\0005\b\6\0006\t\0\0009\t\1\t9\t\4\t9\t\5\tB\t\1\2=\t\a\b6\t\0\0009\t\b\t9\t\t\t)\v\0\0B\t\2\2=\t\n\b+\t\0\0B\4\5\0016\4\0\0009\4\v\4L\4\2\0\bNIL\ttick\29nvim_buf_get_changedtick\bapi\17textDocument\1\0\0\30make_text_document_params\tutil%textDocument/semanticTokens/full\16buf_request\blsp\bvimñ\1\0\2\b\0\a\1\0276\2\0\0009\2\1\2\15\0\2\0X\3\fÄ6\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0\18\a\1\0B\4\3\2)\5\1\0D\2\3\0X\2\nÄ6\2\4\0009\2\5\0026\4\4\0009\4\6\4)\6\2\0\18\a\1\0B\4\3\2#\4\4\0\26\4\0\4D\2\2\0K\0\1\0\bpow\nfloor\tmath\vrshift\tband\bbit\a_G\4k\0\2\r\1\2\1\0214\2\0\0)\3\0\0\21\4\1\0\23\4\0\4)\5\1\0M\3\14Ä-\a\0\0\18\t\0\0\18\n\6\0B\a\3\2\t\a\0\0X\b\aÄ6\b\0\0009\b\1\b\18\n\2\0)\v\1\0\22\f\0\0068\f\f\1B\b\4\1O\3ÚL\2\2\0\4¿\vinsert\ntable\2´\6\1\4&\0\24\5}\14\0\0\0X\4\vÄ\15\0\1\0X\4\tÄ9\4\0\0029\4\1\0046\5\2\0009\5\3\0059\5\4\0059\a\5\2B\5\2\2\4\4\5\0X\4\1Ä2\0nÄ3\4\6\0003\5\a\0009\6\5\0026\a\2\0009\a\b\a9\a\t\a9\t\n\2B\a\2\0029\b\v\a9\b\f\b9\b\r\b9\t\14\b9\n\15\b9\v\16\0016\f\2\0009\f\3\f9\f\17\f'\14\18\0B\f\2\0026\r\2\0009\r\3\r9\r\19\r\18\15\6\0\18\16\f\0)\17\0\0)\18ˇˇB\r\5\1+\r\0\0)\14\0\0)\15\1\0\21\16\v\0)\17\5\0M\15KÄ8\19\18\v\15\0\r\0X\20\3Ä \20\19\r\f\r\20\0X\21\1Ä\18\r\19\0\22\20\0\0188\20\20\v\t\19\1\0X\21\3Ä \21\20\14\f\14\21\0X\22\1Ä\18\14\20\0\22\21\2\0188\21\21\v\22\21\0\0218\21\21\t\18\22\5\0\22\24\3\0188\24\24\v\18\25\n\0B\22\3\0026\23\2\0009\23\3\0239\23\20\23\18\25\6\0\18\26\r\0\22\27\0\r+\28\1\0B\23\5\2:\23\1\0236\24\2\0009\24\21\24\18\26\23\0\18\27\14\0B\24\3\0026\25\2\0009\25\21\25\18\27\23\0\22\28\4\0188\28\28\v \28\28\14B\25\3\0026\26\2\0009\26\3\0269\26\22\26\18\28\6\0\18\29\f\0'\30\23\0\18\31\21\0&\30\31\30\18\31\r\0\18 \24\0\18!\25\0B\26\a\1)\26\1\0\21\27\22\0)\28\1\0M\26\rÄ6\30\2\0009\30\3\0309\30\22\30\18 \6\0\18!\f\0'\"\23\0008#\29\22&\"#\"\18#\r\0\18$\24\0\18%\25\0B\30\a\1O\26ÛO\15µ2\0\0ÄK\0\1\0K\0\1\0\17LspSemantic_\27nvim_buf_add_highlight\18str_byteindex\23nvim_buf_get_lines\29nvim_buf_clear_namespace\22nvim-lsp-semantic\26nvim_create_namespace\tdata\19tokenModifiers\15tokenTypes\vlegend\27semanticTokensProvider\24server_capabilities\14client_id\21get_client_by_id\blsp\0\0\nbufnr\29nvim_buf_get_changedtick\bapi\bvim\ttick\vparams\2\0\6\b\4€\a\1\0\15\0*\0]3\0\0\0005\1\1\0005\2\3\0003\3\2\0=\3\4\0023\3\5\0=\3\6\0026\3\a\0'\5\b\0B\3\2\0029\3\t\0036\5\n\0009\5\v\0059\5\f\0059\5\r\5B\5\1\0A\3\0\0029\4\14\0035\5\16\0=\5\15\0046\4\17\0\18\6\1\0B\4\2\4H\aBÄ\a\b\18\0X\t\rÄ6\t\a\0'\v\19\0B\t\2\0028\t\b\t9\t\20\t5\v\21\0=\3\22\v=\0\23\v5\f\24\0=\f\25\v=\2\26\vB\t\2\1X\t3Ä\a\b\27\0X\t\18Ä6\t\a\0'\v\19\0B\t\2\0028\t\b\t9\t\20\t5\v\28\0=\3\22\v=\0\23\v5\f\29\0=\f\25\v5\f!\0005\r\31\0005\14\30\0=\14 \r=\r\27\f=\f\"\vB\t\2\1X\t\31Ä\a\b#\0X\t\19Ä6\t\a\0'\v$\0B\t\2\0029\t\20\t5\v%\0005\f&\0=\0\23\f5\r'\0=\r\25\f=\f\19\vB\t\2\0026\n\a\0'\f\19\0B\n\2\0028\n\b\n9\n\20\n\18\f\t\0B\n\2\1X\t\nÄ6\t\a\0'\v\19\0B\t\2\0028\t\b\t9\t\20\t5\v(\0=\0\23\v5\f)\0=\f\25\vB\t\2\1F\a\3\3R\aºK\0\1\0\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\1\0\1\17runtime_path\2\flua-dev\16sumneko_lua\rsettings\1\0\0\16checkOnSave\1\0\0\1\0\1\fcomamnd\vclippy\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\18rust_analyzer\rhandlers\nflags\1\0\1\26debounce_text_changes\3ñ\1\14on_attach\17capabilities\1\0\0\nsetup\14lspconfig\vclangd\npairs\1\0\1\19refreshSupport\2\19semanticTokens\14workspace\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire%textDocument/semanticTokens/full\0%workspace/semanticTokens/refresh\1\0\0\0\1\16\0\0\fasm_lsp\vbashls\vclangd\14omnisharp\ncmake\ncssls\ngopls\thtml\18rust_analyzer\tltex\rmarksman\fpyright\ntaplo\rtsserver\16sumneko_lua\0\0", "config", "nvim-lspconfig")

vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimf\0\2\b\0\6\0\f6\2\0\0'\4\1\0B\2\2\0026\3\3\0009\3\4\3'\5\5\0009\6\2\0018\6\6\0029\a\2\1B\3\4\2=\3\2\1L\1\2\0\n%s %s\vformat\vstring\tkind\18lspkind_icons\frequireÂ\1\0\1\5\3\b\1 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\22Ä6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5Ä-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\1¿\0¿\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\21select_next_item\fvisible\2®\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\vÄ6\0\2\0009\0\3\0009\0\4\0)\2ˇˇB\0\2\2\t\0\0\0X\0\4Ä-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\3¿\1¿\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2œ\t\1\0\14\0D\0ë\0013\0\0\0003\1\1\0004\2\t\0005\3\2\0>\3\1\0025\3\3\0>\3\2\0025\3\4\0>\3\3\0025\3\5\0>\3\4\0025\3\6\0>\3\5\0025\3\a\0>\3\6\0025\3\b\0>\3\a\0025\3\t\0>\3\b\0026\3\n\0'\5\v\0B\3\2\0029\4\f\0035\6\16\0005\a\14\0003\b\r\0=\b\15\a=\a\17\0065\a\20\0005\b\18\0=\2\19\b=\b\21\a5\b\22\0=\2\19\b=\b\23\a=\a\24\0065\a\26\0003\b\25\0=\b\27\a=\a\28\0065\a\30\0005\b\29\0=\b\31\a=\a \0069\a!\0039\a\"\a9\a#\a5\t%\0009\n!\0039\n$\nB\n\1\2=\n&\t9\n!\0033\f'\0005\r(\0B\n\3\2=\n)\t9\n!\0033\f*\0005\r+\0B\n\3\2=\n,\tB\a\2\2=\a!\0069\a-\0039\a.\a4\t\3\0005\n/\0>\n\1\t5\n0\0>\n\2\t4\n\3\0005\v1\0>\v\1\nB\a\3\2=\a.\6B\4\2\0019\4\f\0039\0042\4'\0063\0005\a6\0009\b-\0039\b.\b4\n\3\0005\v4\0>\v\1\n4\v\3\0005\f5\0>\f\1\vB\b\3\2=\b.\aB\4\3\0019\4\f\0039\0042\4'\0067\0005\a;\0009\b-\0039\b.\b4\n\3\0005\v8\0>\v\1\n5\v9\0>\v\2\n4\v\3\0005\f:\0>\f\1\vB\b\3\2=\b.\aB\4\3\0019\4\f\0039\4<\4'\6=\0005\a>\0009\b!\0039\b\"\b9\b<\bB\b\1\2=\b!\a4\b\3\0005\t?\0>\t\1\b=\b.\aB\4\3\0019\4\f\0039\4<\4'\6@\0005\aA\0009\b!\0039\b\"\b9\b<\bB\b\1\2=\b!\a9\b-\0039\b.\b4\n\3\0005\vB\0>\v\1\n4\v\3\0005\fC\0>\f\1\vB\b\3\2=\b.\aB\4\3\0012\0\0ÄK\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\17cmp_nvim_lua\1\0\1\tname\rnvim_lsp\blua\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-space>\1\0\0\rcomplete\vinsert\vpreset\fmapping\tview\fentries\1\0\0\1\0\2\20selection_order\16near_cursor\tname\vcustom\15formatting\vformat\1\0\0\0\vwindow\18documentation\1\0\0\15completion\1\0\0\vborder\1\0\0\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\0\0\0", "config", "nvim-cmp")

vim.cmd [[ packadd trouble.nvim ]]

-- Config for: trouble.nvim
try_loadstring("\27LJ\2\n\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nsigns\1\0\4\thint\tÔ†µ \16information\tÔëâ \nerror\tÔôô \fwarning\tÔî© \16action_keys\1\0\t\nclose\15<C-l><C-k>\nhover\14<C-A-S-k>\tjump\t<CR>\16open_vsplit\14<C-A-S-s>\15open_split\14<C-A-S-h>\15jump_close\v<C-CR>\ropen_tab\14<C-A-S-t>\vcancel\n<esc>\frefresh\n<C-r>\1\0\3\25use_diagnostic_signs\1\tmode\25document_diagnostics\17auto_preview\nfalse\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
