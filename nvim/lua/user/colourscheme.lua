local palette = require("gruvbox").palette
require("gruvbox").setup {
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    comments = true,
    operator = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  dim_inactive = false,
  transparent_mode = true,
  overrides = {
    ["@alpha.title"] = { fg = palette.neutral_orange },
    ["@alpha.header"] = { fg = palette.neutral_purple },
    ["@alpha.key_bind"] = { fg = palette.bright_purple },
  },
}

vim.cmd "colorscheme gruvbox"

-- remove ugly todo
vim.api.nvim_set_hl(0, "Todo", { bold = true })
