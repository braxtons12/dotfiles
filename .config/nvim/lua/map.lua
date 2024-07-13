----------------------------------------------
-- MAPPING HELPER FUNCTIONS
----------------------------------------------

local function has_module(name)
    local has_mod, _ = pcall(require, name)
    return has_mod
end

local function is_module_loaded(name)
    return package.loaded[name] ~= nil
end

COMMAND_CENTER_MAPPINGS = {}

--- Creates a keymapping using the given parameters and registers it with which-key
---
--- @param mode string  The mode the mapping should be registered for (eg "n" for normal mode)
--- @param keystroke string  The keystroke to map
--- @param command string  The command to execute when `keystroke` is performed
--- @param description ?string  Description of the command to be displayed by which-key
--- @param options ?table<string, any>  Options for the mapping, compatible with `vim.api.nvim_set_keymap`;
--- if not provided, this will default to `{noremap = true, silent = true}`
local function map(mode, keystroke, command, description, options)
    local opts = {
        noremap = true,
        silent = true,
        desc = description,
    }
    if options then
        ---@diagnostic disable-next-line: cast-local-type
        opts = vim.tbl_extend("force", options, options)
    end

    if description == nil then
        description = ""
    end

    ---@diagnostic disable-next-line: param-type-mismatch
    vim.api.nvim_set_keymap(mode, keystroke, command, opts)

    if mode ~= "t" then
        local mapping = {
            {
                desc = description,
                cmd = command,
                keys = { mode, keystroke, opts },
            }
        }
        if is_module_loaded("command_center") then
            local command_center = require("command_center")
            command_center.add(mapping, { command_center.mode.ADD })
        else
            vim.list_extend(COMMAND_CENTER_MAPPINGS, { mapping })
        end
    end
end

--- Creates a normal-mode keymapping using the given parameters and registers it with which-key
---
--- @param keystroke string  The keystroke to map
--- @param command string  The command to execute when `keystroke` is performed
--- @param description ?string  Description of the command to be displayed by which-key
--- @param options ?table<string, any>  Options for the mapping, compatible with `vim.api.nvim_set_keymap`;
--- if not provided, this will default to `{noremap = true, silent = true}`
local function nmap(keystroke, command, description, options)
    map("n", keystroke, command, description, options)
end

--- Creates a terminal-mode keymapping using the given parameters and registers it with which-key
---
--- @param keystroke string  The keystroke to map
--- @param command string  The command to execute when `keystroke` is performed
--- @param description ?string  Description of the command to be displayed by which-key
--- @param options ?table<string, any>  Options for the mapping, compatible with `vim.api.nvim_set_keymap`;
--- if not provided, this will default to `{noremap = true, silent = true}`
local function tmap(keystroke, command, description, options)
    map("t", keystroke, command, description, options)
end

--- Creates a visual-mode keymapping using the given parameters and registers it with which-key
---
--- @param keystroke string  The keystroke to map
--- @param command string  The command to execute when `keystroke` is performed
--- @param description ?string  Description of the command to be displayed by which-key
--- @param options ?table<string, any>  Options for the mapping, compatible with `vim.api.nvim_set_keymap`;
--- if not provided, this will default to `{noremap = true, silent = true}`
local function vmap(keystroke, command, description, options)
    map("v", keystroke, command, description, options)
end

----------------------------------------------
-- BASE MODULE API
----------------------------------------------

return {
    --- Creates a normal-mode keymapping using the given parameters and registers it with which-key
    ---
    --- @param keystroke string  The keystroke to map
    --- @param command string  The command to execute when `keystroke` is performed
    --- @param description ?string  Description of the command to be displayed by which-key
    --- @param options ?table<string, any>  Options for the mapping, compatible with `vim.api.nvim_set_keymap`;
    --- if not provided, this will default to `{noremap = true, silent = true}`
    nmap = function(keystroke, command, description, options)
        nmap(keystroke, command, description, options)
    end,
    --- Creates a terminal-mode keymapping using the given parameters and registers it with which-key
    ---
    --- @param keystroke string  The keystroke to map
    --- @param command string  The command to execute when `keystroke` is performed
    --- @param description ?string  Description of the command to be displayed by which-key
    --- @param options ?table<string, any>  Options for the mapping, compatible with `vim.api.nvim_set_keymap`;
    --- if not provided, this will default to `{noremap = true, silent = true}`
    tmap = function(keystroke, command, description, options)
        tmap(keystroke, command, description, options)
    end,
    --- Creates a visual-mode keymapping using the given parameters and registers it with which-key
    ---
    --- @param keystroke string  The keystroke to map
    --- @param command string  The command to execute when `keystroke` is performed
    --- @param description ?string  Description of the command to be displayed by which-key
    --- @param options ?table<string, any>  Options for the mapping, compatible with `vim.api.nvim_set_keymap`;
    --- if not provided, this will default to `{noremap = true, silent = true}`
    vmap = function(keystroke, command, description, options)
        vmap(keystroke, command, description, options)
    end,
    --- Returns the platform-native URI path separator (eg "/" on \*nix, "\\" on Windows)
    path_separator = function()
        return package.config:sub(1, 1)
    end,
    get_command_center_mappings = function()
        return COMMAND_CENTER_MAPPINGS
    end,
    codeaction = function()
        if vim.bo.filetype == 'rust' then
            vim.cmd("RustLsp codeAction")
        else
            require("cosmic-ui").code_actions()
        end
    end,
}
