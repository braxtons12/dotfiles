return {
    name = "xmake",
    builder = function()
        return {
            cmd = "xmake",
            args = {
                "b",
            },
            cwd = vim.fn.getcwd(),
            env = {
                XMAKE_COLORTERM = "nocolor",
            },
            tags = {
                require("overseer.constants").TAG.BUILD,
            },
            components = {
                {
                    "on_output_parse",
                    problem_matcher = {
                        owner = "cpp",
                        fileLocation = {
                            "relative",
                            "${cwd}"
                        },
                        pattern = {
                            lua_pat = [[^error: ([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]],
                            file = 1,
                            line = 2,
                            column = 3,
                            severity = 4,
                            message = 5,
                        },
                    },
                },
                {
                    "on_output_parse",
                    problem_matcher = {
                        owner = "cpp",
                        fileLocation = {
                            "relative",
                            "${cwd}"
                        },
                        pattern = {
                            lua_pat = [[^([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]],
                            file = 1,
                            line = 2,
                            column = 3,
                            severity = 4,
                            message = 5,
                        },
                    },
                },
                {
                    "on_output_parse",
                    problem_matcher = {
                        owner = "cpp",
                        fileLocation = {
                            "relative",
                            "${cwd}"
                        },
                        pattern = "$cpp",
                    },
                },
                {
                    "on_exit_set_status",
                    success_codes = {
                        255,
                        -1,
                        0,
                    },
                },
                "on_result_diagnostics",
                "default",
            }
        }
    end,
    desc = "Run xmake build",
    condition = {
        filetype = {
            "c",
            "cpp",
        },
        callback = function(_)
            local has_xmake = io.open("xmake.lua")
            if has_xmake then
                io.close(has_xmake)
                return true
            end

            return false
        end
    }
}
