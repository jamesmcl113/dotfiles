return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
  opts = {
    theme = "gruvbox-material",
    sections = {
      lualine_b = {
        'diagnostics'
      },
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = {
        'filetype'
      }
    },
  },
}
