local wezterm = require 'wezterm'
return {
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = 'Whimsy',
--  window_background_opacity = 0.88,
  font = wezterm.font("Hack", {weight="Bold", italic=false}),
  font_size = 20.0,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  default_cursor_style = 'BlinkingBar',
  enable_csi_u_key_encoding = true,
}
