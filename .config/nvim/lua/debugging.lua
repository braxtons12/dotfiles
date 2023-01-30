local map = require("map")

START_DEBUGGER = function()
    local dap = require("dap")
    dap.continue()
    dap.repl.close()
end

return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        keys = {
            "<leader>debug",
            "<leader>exit",
            "<S-b>",
            "<F1>",
            "<F2>",
            "<F3>",
            "<F4>",
            "<F5>",
            "<F6>",
            "<F7>",
        },
        dependencies = "williamboman/mason.nvim",
        config = function(_, _)
            local dap = require("dap")
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") ..
                        map.path_separator() .. "mason" .. map.path_separator() .. "bin"
                        .. map.path_separator() .. "codelldb",
                    args = { "--port", "${port}" },
                },
            }
            dap.configurations.cpp = {
                {
                    name = "Debug",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input({
                            "Path to executable: ",
                            vim.fn.getcwd() .. map.path_separator(),
                            "file"
                        })
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                }
            }
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Field" })
            vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "Field" })

            map.nmap("<leader>debug", "<cmd>lua START_DEBUGGER()<CR>", "Start debugging application")
            map.nmap("<leader>exit", "<cmd>lua require(\"dap\").terminate()<CR>", "Terminate debugging")
            map.nmap("<S-b>", "<cmd>lua require(\"dap\").toggle_breakpoint()<CR>", "Toggle Breakpoint")
            map.nmap("<F1>", "<cmd>lua START_DEBUGGER()<CR>", "Debug Continue")
            map.nmap("<F2>", "<cmd>lua require(\"dap\").step_back()<CR>", "Debug Step Back")
            map.nmap("<F3>", "<cmd>lua require(\"dap\").step_out()<CR>", "Debug Step Out")
            map.nmap("<F4>", "<cmd>lua require(\"dap\").step_over()<CR>", "Debug Step Over")
            map.nmap("<F5>", "<cmd>lua require(\"dap\").step_into()<CR>", "Debug Step Into")
            map.nmap("<F6>", "<cmd>lua require(\"dap\").run_to_cursor()<CR>", "Terminate debugging")
            map.nmap("<F7>", "<cmd>lua require(\"dap\").terminate()<CR>", "Terminate debugging")
        end
    },
}
