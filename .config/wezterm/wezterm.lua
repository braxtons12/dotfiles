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
    font_size = 14,
    line_height = 1.0,
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
    },
    enable_tab_bar = false,
    enable_scroll_bar = false,
    window_padding = {
        top = 0,
        bottom = 0,
        left = 0,
        right = 0,
    },
    window_background_opacity = 1.0,
    text_background_opacity = 1.0
}
