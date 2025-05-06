local wez = require 'wezterm'
local act = wez.action

local keybindings = {
  { key = 'P',        mods = 'CTRL|SHIFT',     action = act.ActivateCommandPalette },

  -- TABS
  { key = 't',        mods = 'CTRL|ALT|SHIFT', action = act { SpawnTab = "CurrentPaneDomain" } },
  { key = 'h',        mods = 'CTRL|ALT|SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'l',        mods = 'CTRL|ALT|SHIFT', action = act.ActivateTabRelative(1) },

  -- PANES
  { key = 's',        mods = 'CTRL|ALT',       action = act { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = 'h',        mods = 'CTRL|ALT',       action = act { ActivatePaneDirection = "Left" } },
  { key = 'l',        mods = 'CTRL|ALT',       action = act { ActivatePaneDirection = "Right" } },
  { key = 'k',        mods = 'CTRL|ALT',       action = act { ActivatePaneDirection = "Up" } },
  { key = 'j',        mods = 'CTRL|ALT',       action = act { ActivatePaneDirection = "Down" } },

  -- COPY/PASTE
  { key = 'c',        mods = 'CTRL|SHIFT',     action = act { CopyTo = "Clipboard" } },
  { key = 'v',        mods = 'CTRL|SHIFT',     action = act { PasteFrom = "Clipboard" } },

  -- SCROLL
  { key = 'PageUp',   mods = '',               action = act { ScrollByPage = -0.5 } },
  { key = 'PageDown', mods = '',               action = act { ScrollByPage = 0.5 } },

  -- ACTIONS
  { key = 'f',        mods = 'CTRL|SHIFT|ALT', action = act.Search { CaseSensitiveString = "" } },
  { key = 'c',        mods = 'CTRL|SHIFT|ALT', action = act.ActivateCopyMode },
  { key = 's',        mods = 'CTRL|SHIFT|ALT', action = act.QuickSelect },

}

return keybindings
