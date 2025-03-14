-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font 'Monaspace Argon'
config.font_size = 14

-- config.color_scheme = 'JWR dark (terminal.sexy)'
-- config.color_scheme = 'Japanesque (Gogh)'
-- config.color_scheme = 'MaterialDark'
-- config.color_scheme = 'MaterialDarker'
-- config.color_scheme = 'Marrakesh (dark) (terminal.sexy)'
-- config.color_scheme = 'Mariana'
config.color_scheme = 'JetBrains Darcula'

-- write a function to calculate the size of the tabs, such thats
-- the first tab takes all the space, if there are two, they split
-- and if there are three, they split again and so on


return config
