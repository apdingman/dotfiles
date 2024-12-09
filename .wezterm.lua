-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
    { key = '|', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '_', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
}
config.enable_tab_bar = true 
config.color_scheme = 'nightfox'
config.font = wezterm.font 'JetBrains Mono'
config.default_cursor_style = 'BlinkingUnderline'

config.set_environment_variables = {
    LS_COLORS = "di=1;34:fi=0;32:ln=1;36:... (your customized colors here)"
}

-- and finally, return the configuration to wezterm
return config
