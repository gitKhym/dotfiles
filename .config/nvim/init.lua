vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

vim.opt.fillchars:append { vert = " ", eob = " ", fold = " " }

if vim.g.neovide then
  vim.g.neovide_transparency = 0.8
  vim.o.guifont = "AnomalyMono Nerd Font"
  vim.g.neovide_padding_top = 50
  vim.g.neovide_padding_bottom = 50
  vim.g.neovide_padding_right = 50
  vim.g.neovide_padding_left = 50
  vim.g.neovide_window_floating_opacity = 0
  vim.g.neovide_fullscreen = true
  vim.g.neovide_hide_mouse_when_typing = false

  -- Cursor
  vim.g.neovide_cursor_animation_length = 0.035
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_vfx_mode = "railgun"

  -- Floating Window
  vim.g.neovide_floating_blur_amount_x = 0
  vim.g.neovide_floating_blur_amount_y = 0

  vim.g.neovide_floating_opacity = 0.1
end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=125})
  augroup END
]]

vim.schedule(function()
  require "mappings"
end)
