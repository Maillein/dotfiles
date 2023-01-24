local wezterm = require 'wezterm'
local font_size = 12
local launch_menu = {}
local default_prog

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  font_size = 12
  default_prog = { 'Manjaro.exe' }
  table.insert(launch_menu, {
    label = 'PowerSHell',
    args = { 'pwsh.exe' }
  })
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  font_size = 14
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
  font_size = font_size,
  front_end = 'WebGpu',
  dpi = 144.0,
  use_ime = true,
  disable_default_key_bindings = true,
  leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    -- Copy & Paste
    { key = 'C', mods = 'CTRL', action = wezterm.action { CopyTo = 'Clipboard' } },
    { key = 'V', mods = 'CTRL', action = wezterm.action { PasteFrom = 'Clipboard' } },

    { key = 'X', mods = 'CTRL', action = wezterm.action.ActivateCopyMode },

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

    -- Enter Pane Mode
    { key = 'p', mods = 'LEADER', action = wezterm.action { ActivateKeyTable = { name = 'pane_mode', one_shot = false } } },

    -- Activate Pane
    { key = 'RightArrow', mods = 'ALT', action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'LeftArrow', mods = 'ALT', action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'UpArrow', mods = 'ALT', action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'DownArrow', mods = 'ALT', action = wezterm.action { ActivatePaneDirection = 'Down' } },

    -- Close Pane & TAB
    { key = 'c', mods = "LEADER", action = wezterm.action { CloseCurrentPane = { confirm = true } } },
    { key = 'C', mods = "LEADER", action = wezterm.action { CloseCurrentTab = { confirm = true } } },

    -- Font
    { key = 'f', mods = 'LEADER',
      action = wezterm.action { ActivateKeyTable = { name = 'font_size_mode', one_shot = false } } },

    -- Fullscreen
    { key = 'Enter', mods = 'ALT', action = wezterm.action.ToggleFullScreen }
  },

  key_tables = {
    pane_mode = {
      { key = 'h', action = wezterm.action.ActivatePaneDirection 'Left' },
      { key = 'j', action = wezterm.action.ActivatePaneDirection 'Down' },
      { key = 'k', action = wezterm.action.ActivatePaneDirection 'Up' },
      { key = 'l', action = wezterm.action.ActivatePaneDirection 'Right' },
      { key = 'h', mods = 'CTRL', action = wezterm.action { AdjustPaneSize = { 'Left', 2 } } },
      { key = 'j', mods = 'CTRL', action = wezterm.action { AdjustPaneSize = { 'Down', 2 } } },
      { key = 'k', mods = 'CTRL', action = wezterm.action { AdjustPaneSize = { 'Up', 2 } } },
      { key = 'l', mods = 'CTRL', action = wezterm.action { AdjustPaneSize = { 'Right', 2 } } },
      { key = 'j', mods = 'SHIFT', action = wezterm.action { ActivateTabRelative = -1 } },
      { key = 'k', mods = 'SHIFT', action = wezterm.action { ActivateTabRelative = 1 } },
      { key = 's', action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
      { key = 'v', action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },
      { key = 'c', action = wezterm.action { CloseCurrentPane = { confirm = false } } },
      { key = 'C', action = wezterm.action { CloseCurrentTab = { confirm = false } } },
      { key = 'Escape', action = wezterm.action.PopKeyTable },
      { key = '[', mods = 'CTRL', action = wezterm.action.PopKeyTable }
    },
    font_size_mode = {
      { key = 'j', action = wezterm.action.DecreaseFontSize },
      { key = 'k', action = wezterm.action.IncreaseFontSize },
      { key = 'r', action = wezterm.action.ResetFontSize },
      { key = 'Escape', action = wezterm.action.PopKeyTable },
      { key = '[', mods = 'CTRL', action = wezterm.action.PopKeyTable }
    }
  }
}

return config
