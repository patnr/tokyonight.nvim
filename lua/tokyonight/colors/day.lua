---@param opts tokyonight.Config
return function(opts)
  local style = opts.light_style or "night"
  style = style == "day" and "night" or style

  local Util = require("tokyonight.util")

  ---@type Palette
  local colors = vim.deepcopy(Util.mod("tokyonight.colors." .. style))

  ---@type Palette

  Util.invert(colors)
  colors.bg_dark = Util.blend(colors.bg, 0.9, colors.fg)
  -- Make bg fully white
  colors.bg = "#ffffff"
  colors.fg = "#1a1a33"
  -- colors.green = "#b31a1a"
  -- There is no point setting vim.g.terminal_color_N (via `theme.terminal()`)
  -- because they need to be set before the terminal is opened,
  -- while Styler is called after terminal is opened.
  return colors
end
