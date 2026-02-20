require("neoscroll").setup {
  -- mappings = {
  --   "<C-u>",
  --   "<C-d>",
  --   "<C-b>",
  --   "<C-f>",
  --   "<C-y>",
  --   "<C-e>",
  --   "zt",
  --   "zz",
  --   "zb",
  -- },
  duration_multiplier = 0.35,
  easing = "quartic",
  pre_hook = nil,
  post_hook = nil,
  performance_mode = false,
  ignored_events = {
    "WinScrolled",
    "CursorMoved",
  },
}
