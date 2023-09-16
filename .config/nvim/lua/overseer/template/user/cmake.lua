return {
    name = "cmake",
    builder = function()
        return {
            cmd = {
                "cmake",
            },
            args = {
                "--build",
                "build",
            },
            cwd = vim.fn.getcwd(),
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
                    "on_exit_set_status",
                    success_codes = {
                        255,
                        -1,
                        0,
                        1,
                    },
                },
                "on_result_diagnostics",
                "default",
            }
        }
    end,
    desc = "Run cmake build",
    condition = {
        filetype = {
            "c",
            "cpp",
        },
        callback = function(_)
            local has_cmake = io.open("CMakeLists.txt")
            if has_cmake then
                io.close(has_cmake)
                return true
            end

            return false
        end
    }
}
