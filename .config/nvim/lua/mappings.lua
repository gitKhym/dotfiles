require "nvchad.mappings"
-- add yours here

local map = vim.keymap.set
map("n", "<leader>qw", "<cmd> q <CR>", { desc = "Quit without saving" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
map("n", "<leader>-", "<cmd> vsplit <CR>", { desc = "Split vertically" })
map("n", "<leader>_", "<cmd> split <CR>", { desc = "Split horizontally" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")
map("n", "k", "gk")
map("n", "j", "gj")
map("n", "n", "nzz", { noremap = true, silent = true })
map("n", "N", "Nzz", { noremap = true, silent = true })
map("v", "y", "ygv<esc>")

map({ "n", "v", "x", "o" }, "H", "^")
map({ "n", "v", "x", "o" }, "L", "$")
map("n", "dH", "d^")
map("n", "dL", "d$")

map("n", "E", "ge")

-- Snacks Explorer
map("n", "<C-n>", function()
  require("snacks.picker").explorer()
end, { desc = "Toggle snacks explorer" })

-- VScode alt move line
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })

-- Tmux Navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Telescope mappings
local telescope = require "telescope.builtin"
map("n", "<A-f>", function()
  telescope.find_files()
end, { desc = "Find files" })

map("n", "<leader>b", function()
  telescope.buffers { sort_lastused = true }
end, { desc = "Open Buffers", noremap = true, silent = true })

map("n", "<leader>gr", function()
  telescope.lsp_references()
end, { desc = "Find Reference" })

-- LSP
map("n", "gh", function()
  vim.lsp.buf.hover()
end, {})

-- Harpoon mappings
map("n", "<A-e>", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Open Harpoon" })
map("n", "<leader>e", function()
  require("harpoon.mark").add_file()
end, { desc = "Add Harpoon File" })

-- Trouble mappings
map("n", "<A-z>", function()
  require("trouble").toggle()
end, { desc = "Open Trouble" })

map("n", "<leader>gz", function()
  vim.diagnostic.open_float()
end, { desc = "What" })

-- Increname
-- map("n", "<leader>rn", ":IncRename ", {})
map("n", "<leader>rn", function()
  return ":increname " .. vim.fn.expand "<cword>"
end, { expr = true })

-- Undo Tree
map("n", "<A-u>", vim.cmd.UndotreeToggle, { desc = "Open undor tree" })

-- FTerm
map("n", "<A-i>", function()
  require("FTerm").toggle()
end)
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
map("t", "<C-v>", "<C-\\><C-n>")

-- Nvim-tree
map("n", "<leader>ft", function()
  require("nvim-tree.api").tree.find_file { open = true, find_file = true }
end, { desc = "Find file in tree" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
