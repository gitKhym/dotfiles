require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "number" -- to enable cursorline!
o.cursorline = true
o.scrolloff = 8
o.number = true -- show line numbers
o.relativenumber = true -- set relative line numbers
o.conceallevel = 1
o.breakindent = true
o.autoread = true
o.swapfile = false
o.clipboard = "unnamedplus"
o.guicursor = "i:block"
vim.o.fillchars =
  "eob: ,fold: ,vert: ,horiz: ,horizup: ,horizdown: ,vertleft: ,vertright: ,verthoriz: ,diff: ,msgsep: ,foldopen: ,foldsep: ,foldclose: "

o.spelllang = "en"
