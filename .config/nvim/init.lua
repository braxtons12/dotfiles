local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("base")

local basic_plugins = require("basic")
local lsp_plugins = require("lsp")
local completion_plugins = require("completion")
local debugging_plugins = require("debugging")
local ui_plugins = require("ui")

local plugins = basic_plugins
vim.list_extend(plugins, lsp_plugins)
vim.list_extend(plugins, completion_plugins)
vim.list_extend(plugins, debugging_plugins)
vim.list_extend(plugins, ui_plugins)

local border = require("ui.border").with_hl_group

require("lazy").setup(plugins, {
    ui = {
        border = border,
    },
})

require("ui.theming")
