local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Chalk'
config.font = wezterm.font 'JetBrainsMonoNerdFont'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16
config.default_prog = { 'tmux' }

return config

