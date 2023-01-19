local wezterm = require 'wezterm'
local launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  default_prog = { 'Manjaro.exe' }
  table.insert(launch_menu, {
    label = 'PowerSHell',
    args = { 'pwsh.exe' }
  })
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  default_prog = { '/usr/bin/zsh', '-l' }
end

local config = {
  default_prog = default_prog,
  -- hide_tab_bar_if_only_one_tab = true,
  launch_menu = launch_menu,
  color_scheme = 'tokyonight',
  -- font_shaper = 'Harfbuzz',
  font = wezterm.font {
    family = 'UDEV Gothic NFLG',
    -- harfbuzz_features = { 'calt', 'clig', 'liga' }
  },
  font_size = 14,
  front_end = 'WebGpu',
  dpi = 144.0,
  use_ime = true,
}

return config
