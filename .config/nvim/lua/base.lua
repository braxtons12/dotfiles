----------------------------------------------
-- BASE CONFIG OPTIONS
----------------------------------------------

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.cmd("set colorcolumn=101")
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 0
vim.opt.updatetime = 2000
vim.opt.mousemoveevent = true
vim.o.timeoutlen = 2000
vim.cmd("set shortmess+=c")

vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.wildmenu = true
vim.cmd("set inccommand:nosplit")

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = {
        prefix = "",
    },
    update_in_insert = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "DiagnosticDefault" .. type })
end

----------------------------------------------
-- BASE KEYMAPS
----------------------------------------------

local map = require("map")

vim.g.mapleader = " "

map.nmap("<C-s>", "<cmd>vsplit<CR>", "Vertical Split")
map.nmap("s", "m", "")
map.nmap("<leader>s", "<cmd>vsplit<CR>", "Vertical Split")
vim.cmd("map <A-CR>=^[^M\", \"")

map.nmap("<A-h>", "0", "Go to Start of Line")
map.nmap("<A-l>", "$", "Go to End of Line")
map.vmap("<A-h>", "0", "Go to Start of Line")
map.vmap("<A-l>", "$", "Go to End of Line")

map.nmap("<S-h>", "<C-w><C-h>", "Go to Left Window")
map.nmap("<S-l>", "<C-w><C-l>", "Go to Right Window")
map.nmap("<S-k>", "<C-w><C-k>", "Go to Top Window")
map.nmap("<S-j>", "<C-w><C-j>", "Go to Bottom Window")
map.nmap("<C-Left>", "<C-w><C-h>", "Go to Left Window")
map.nmap("<C-Right>", "<C-w><C-l>", "Go to Right Window")
map.nmap("<C-Up>", "<C-w><C-k>", "Go to Top Window")
map.nmap("<C-Down>", "<C-w><C-j>", "Go to Bottom Window")

map.nmap("<C-d>", "<cmd>lua vim.diagnostic.config({virtual_lines = { prefix = \"🔥\"}})<CR>", "Show Diagnostic Text")
map.nmap("<C-S-d>", "<cmd>lua vim.diagnostic.config({virtual_lines = false})<CR>", "Hide Diagnostic Text")


----------------------------------------------
-- BASE AUTOCOMMANDS
----------------------------------------------

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "*.cppm", "*.mpp" },
        callback = function()
            vim.cmd("setfiletype cpp")
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "*.clang-tidy", "*.clang-format", "*.clangd", "*.cmake-format", "*.cmake-lint" },
        callback = function()
            vim.cmd("setfiletype yaml")
        end,
    }
)
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "CMakeLists.txt", "CMakeLists.text", "*.cmake" },
        callback = function()
            vim.cmd("setfiletype cmake")
        end,
    }
)
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "*.gradle" },
        callback = function()
            vim.cmd("setfiletype groovy")
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = {
            "aerial",
            "dapui_scopes",
            "dapui_breakpoints",
            "dapui_stacks",
            "dapui_console"
        },
        callback = function()
            vim.cmd("set winhl=Normal:AerialNormal")
        end,
    }
)

