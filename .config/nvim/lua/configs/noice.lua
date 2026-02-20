require("noice").setup {
  cmdline = {
    format = {
      obsidian = {
        pattern = "^:%s*Obsidian",
        icon = "O",
      },
    },
  },
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },
  messages = { view = "mini" },

  views = {
    cmdline_popup = {
      border = {
        style = "rounded",
      },
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
    mini = {
      position = {
        row = -1,
        col = "50%",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = -1,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
}
