local wezterm = require "wezterm"
local scheme = wezterm.get_builtin_color_schemes()["Catppuccin Latte"]

return {
  font = wezterm.font("Fantasque Sans Mono", { weight = "Medium" }),
  font_size = 16,
  color_scheme = "Catppuccin Latte",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  use_fancy_tab_bar = false,
  colors = {
    tab_bar = {
      background = scheme.background,
      new_tab = { bg_color = scheme.cursor_fg, fg_color = scheme.ansi[8], intensity = "Bold" },
      new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
    },
  },
  tab_bar_at_bottom = false,
}
