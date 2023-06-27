local wezterm = require 'wezterm'
local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()

return {
    -- keys = {
    --     {
    --         key = "t",
    --         mods = "CMD",
    --         action = wezterm.action { SpawnCommandInNewTab = {
    --             cwd = wezterm.home_dir,
    --         } }
    --     },
    -- },
    colors = colors,
    window_frame = window_frame, -- needed only if using fancy tab bar
    font = wezterm.font({ family = 'Fira Code' }),
    font_size = 14,
    font_rules = {
        {
            intensity = 'Normal',
            italic = false,
            font = wezterm.font({ family = 'Fira Code' }),
        },
    },
    tab_bar_at_bottom = true,
}
