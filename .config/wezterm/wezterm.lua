local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
    {
        family = "Hack Nerd Font Mono FC Ligatured",
        harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
    },
    {
        family = "Hack Nerd Font Mono",
        harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
    },
})
config.warn_about_missing_glyphs = false
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 10000
config.font_size = 13
config.line_height = 1.0
config.cell_width = 1.0
--config.color_scheme = "OneDark (Gogh)"
config.colors = {
    foreground = "#cbced3",
    background = "#20242a",
    cursor_fg = "#20242a",
    cursor_bg = "#cbced3",
    ansi = {
        --black =
        '#20242a',
        --red =
        '#d05b64',
        --green =
        '#87b268',
        --yellow =
        '#24b06a',
        --blue =
        '#509ede',
        --magenta =
        '#b567cc',
        --cyan =
        '#45a5b1',
        --white =
        '#cbced3',
    },
    brights = {
        --black =
        '#686e78',
        --red =
        '#d05b64',
        --green =
        '#87b268',
        --yellow =
        '#24b06a',
        --blue =
        '#509ede',
        --magenta =
        '#b567cc',
        --cyan =
        '#45a5b1',
        --white =
        '#cbced3',
    },
    tab_bar = {
        background = "#14171c",
        active_tab = {
            bg_color = "#262b33",
            fg_color = "#61afef",
        },
        inactive_tab = {
            bg_color = "#202429",
            fg_color = "#9daaaa",
        },
        inactive_tab_hover = {
            bg_color = "#202429",
            fg_color = "#61afef",
            italic = true,
        },
        new_tab = {
            bg_color = "#262b33",
            fg_color = "#9daaaa",
        },
        new_tab_hover = {
            bg_color = "#262b33",
            fg_color = "#61afef",
            italic = true,
        },
    },
}

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_scroll_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_max_width = 20

local left_arrow = wezterm.nerdfonts.ple_lower_left_triangle
local right_arrow = wezterm.nerdfonts.ple_upper_right_triangle

config.tab_bar_style = {
    new_tab = wezterm.format {
        { Text = ' + ' },
        'ResetAttributes',
        { Foreground = { Color = config.colors.tab_bar.background } },
        { Background = { Color = config.colors.tab_bar.new_tab.bg_color } },
        { Text = right_arrow },
    },
    new_tab_hover = wezterm.format {
        { Text = ' + ' },
        'ResetAttributes',
        { Foreground = { Color = config.colors.tab_bar.background } },
        { Background = { Color = config.colors.tab_bar.new_tab.bg_color } },
        { Text = right_arrow },
    },
}

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
    'format-tab-title',
    function(tab, tabs, _, _, _, max_width)
        local title = tab_title(tab)
        local index = tab.tab_index

        title = wezterm.truncate_right(title, max_width - 3)
        local foreground = config.colors.tab_bar.active_tab.bg_color
        local background = config.colors.tab_bar.inactive_tab.bg_color


        if tab.is_active then
            if index ~= 0 then
                background = config.colors.tab_bar.inactive_tab.bg_color
            else
                background = config.colors.tab_bar.active_tab.bg_color
            end
            foreground = config.colors.tab_bar.active_tab.bg_color
        end

        local left_foreground = foreground
        local left_background = background

        local right_foreground = foreground
        local right_background = background

        if index > 0  then
            if tab.is_active then 
                right_background = right_foreground
            else
                if tabs[index].is_active then
                    local swap = left_foreground
                    left_foreground = left_background
                    left_background = swap
                else
                    left_foreground = background
                end

                if #tabs > index + 1 then
                    if tabs[index + 1] then
                        right_background = background
                        right_foreground = background
                    end
                end
            end
        end

        if index == 0 then
            return {
                { Foreground = { Color = background } },
                { Background = { Color = background } },
                { Text = ' ' },
                'ResetAttributes',
                { Text = ' ' .. title .. ' '},
            }
        end

        return {
            { Foreground = { Color = left_foreground } },
            { Background = { Color = left_background } },
            { Text = right_arrow },
            'ResetAttributes',
            { Text = ' ' .. title },
            'ResetAttributes',
            { Foreground = { Color = right_foreground } },
            { Background = { Color = right_background } },
            { Text = right_arrow },
        }
    end
)

config.window_padding = {
    top = 0,
    bottom = 0,
    left = 0,
    right = 0,
}
config.initial_cols = 150
config.initial_rows = 44
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0
config.keys = {
    {
        key = "n",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivateTabRelative(1),
    },
    {
        key = "n",
        mods = "CTRL|ALT",
        action = wezterm.action.SpawnTab("DefaultDomain"),
    },
    {
        key = "p",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        key = "Enter",
        mods = "ALT",
        action = "DisableDefaultAssignment",
    },
}

return config
