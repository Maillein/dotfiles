local wezterm = require 'wezterm'
local launch_menu = {}
local default_prog

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
  font_shaper = 'Harfbuzz',
  font = wezterm.font_with_fallback {
    {
      family = 'UDEV Gothic NFLG',
      harfbuzz_features = { 'calt', 'clig', 'liga' }
    },
    'Noto Color Emoji',
  },
  font_size = 14,
  front_end = 'WebGpu',
  dpi = 144.0,
  use_ime = true,
  disable_default_key_bindings = true,
  leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    -- send Ctrl + a
    -- { key = 'Space', mods = 'LEADER|CTRL', action = wezterm.action { SendString = '\x01' } },

    -- Copy & Paste
    { key = 'C', mods = 'CTRL', action = wezterm.action { CopyTo = 'Clipboard' } },
    { key = 'V', mods = 'CTRL', action = wezterm.action { PasteFrom = 'Clipboard' } },

    -- Tab
    { key = 't', mods = 'LEADER', action = wezterm.action { SpawnTab = 'CurrentPaneDomain' } },
    { key = 'l', mods = 'LEADER', action = wezterm.action.ShowLauncher },
    { key = 'C', mods = 'LEADER', action = wezterm.action { CloseCurrentTab = { confirm = false } } },
    { key = 'Tab', mods = 'CTRL', action = wezterm.action { ActivateTabRelative = 1 } },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action { ActivateTabRelative = -1 } },
    { key = '1', mods = 'LEADER', action = wezterm.action { ActivateTab = 0 } },
    { key = '2', mods = 'LEADER', action = wezterm.action { ActivateTab = 1 } },
    { key = '3', mods = 'LEADER', action = wezterm.action { ActivateTab = 2 } },
    { key = '4', mods = 'LEADER', action = wezterm.action { ActivateTab = 3 } },
    { key = '5', mods = 'LEADER', action = wezterm.action { ActivateTab = 4 } },
    { key = '6', mods = 'LEADER', action = wezterm.action { ActivateTab = 5 } },
    { key = '7', mods = 'LEADER', action = wezterm.action { ActivateTab = 6 } },
    { key = '8', mods = 'LEADER', action = wezterm.action { ActivateTab = 7 } },
    { key = '9', mods = 'LEADER', action = wezterm.action { ActivateTab = 8 } },

    -- Split pane
    { key = 's', mods = 'LEADER', action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
    { key = 'v', mods = 'LEADER', action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },

    -- Activate Pane
    { key = 'RightArrow', mods = 'ALT', action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'LeftArrow', mods = 'ALT', action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'UpArrow', mods = 'ALT', action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'DownArrow', mods = 'ALT', action = wezterm.action { ActivatePaneDirection = 'Down' } },

    -- Adjust Pane
    { key = 'RightArrow', mods = 'ALT|SHIFT', action = wezterm.action { AdjustPaneSize = { 'Right', 2 } } },
    { key = 'LeftArrow', mods = 'ALT|SHIFT', action = wezterm.action { AdjustPaneSize = { 'Left', 2 } } },
    { key = 'UpArrow', mods = 'ALT|SHIFT', action = wezterm.action { AdjustPaneSize = { 'Up', 2 } } },
    { key = 'DownArrow', mods = 'ALT|SHIFT', action = wezterm.action { AdjustPaneSize = { 'Down', 2 } } },

    -- Close Pane
    { key = 'c', mods = "LEADER", action = wezterm.action { CloseCurrentPane = { confirm = false } } },

    -- Font
    { key = '-', mods = 'LEADER', action = wezterm.action.DecreaseFontSize },
    { key = ';', mods = 'LEADER', action = wezterm.action.IncreaseFontSize },
    { key = 'r', mods = 'LEADER', action = wezterm.action.ResetFontSize },

    -- Fullscreen
    { key = 'Enter', mods = 'ALT', action = wezterm.action.ToggleFullScreen }
  }
}

return config
