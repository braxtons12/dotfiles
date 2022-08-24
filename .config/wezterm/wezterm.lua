local wezterm = require("wezterm")
return {
    font = wezterm.font_with_fallback({
        {
            family = "Hack Nerd Font Mono FC Ligatured",
            harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
        },
        {
            family = "Hack Nerd Font Mono",
            harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
        },
    }),
    scrollback_lines = 1000,
    font_size = 13,
    line_height = 1.0,
    cell_width = 1.0,
    color_scheme = "OneDark (Gogh)",
    colors = {
        foreground = "#cbced3",
        background = "#20242a",
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
        tab_bar = {
            background = "#14171c",
            active_tab = {
                bg_color = "#262b33",
                fg_color = "#61afef",
            },
            inactive_tab = {
                bg_color = "#23282e",
                fg_color = "#9daaaa",
            },
            inactive_tab_hover = {
                bg_color = "#23282e",
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
    },
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    enable_scroll_bar = false,
    window_padding = {
        top = 0,
        bottom = 0,
        left = 0,
        right = 0,
    },
    initial_cols = 130,
    initial_rows = 40,
    window_background_opacity = 1.0,
    text_background_opacity = 1.0,
    keys = {
        {
            key = "n",
            mods = "CTRL|SHIFT",
            action = wezterm.action.ActivateTabRelative(1)
        },
        {
            key = "p",
            mods = "CTRL|SHIFT",
            action = wezterm.action.ActivateTabRelative(-1)
        },
    }
}
