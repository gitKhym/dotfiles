-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig

local Colors = {
  transp = "#292A37",
  darkblue = "#1c1e2b",
  pink = "#f6a0ca",
  cyan = "cyan",
  blue = "blue",
}

local M = {

  ui = {
    tabufline = {
      enabled = false,
    },

    statusline = {
      order = {
        "mode",
        "file",
        "git",
        "%=",
        "lsp",
      },
    },
    nvdash = {

      load_on_startup = true,
      header = {
        " ██▒   █▓  ██████  ▄████▄   ▒█████  ▓█████▄ ▓█████ ",
        "▓██░   █▒▒██    ▒ ▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀ ",
        " ▓██  █▒░░ ▓██▄   ▒▓█    ▄ ▒██░  ██▒░██   █▌▒███   ",
        "  ▒██ █░░  ▒   ██▒▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄ ",
        "   ▒▀█░  ▒██████▒▒▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒",
        "   ░ ▐░  ▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░",
        "   ░ ░░  ░ ░▒  ░ ░  ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░",
        "     ░░  ░  ░  ░  ░        ░ ░ ░ ▒   ░ ░  ░    ░   ",
        "      ░        ░  ░ ░          ░ ░     ░       ░  ░",
        "     ░            ░                  ░             ",
      },

      buttons = { {
        "This is defo vscode",
        "",
        "",
      } },
    },
  },
  base46 = {
    hl_override = {
      -- BG
      Normal = { bg = "NONE", fg = "NONE" },
      CursorLine = { bg = "none" },

      -- Misc
      SpellBad = { undercurl = true, fg = "red" },
      ColorColumn = { bg = "none", fg = "#ABAAF8" },

      -- General Code
      -- TODO: this is terrible
      -- HACK: what
      -- OPTIM: this
      -- WARN: NOT GOOD
      -- BUG: What

      LspInlayHint = { fg = Colors.yellow, bg = "none" },
      ["@comment"] = { fg = Colors.cyan, bg = Colors.darkblue },
      Visual = { bg = Colors.pink, fg = "black" },
      LineNr = { fg = Colors.pink },
      CursorLineNr = { fg = "white" },
      Include = { fg = Colors.cyan },
      ["@tag"] = { fg = "yellow", italic = true },
      ["@string"] = { fg = "green" },
      ["@function.call"] = { fg = "blue" },
      ["@keyword"] = { fg = Colors.pink },
      FloatBorder = { fg = Colors.pink },
      NvimTreeCursorLine = { bg = Colors.cyan, fg = "black" },
      NvimTreeIndentMarker = { fg = Colors.transp },
      WinSeparator = { fg = Colors.pink },

      -- Nvim Tree
      NvimTreeFolderIcon = { fg = Colors.pink },
      NvimTreeFolderName = { fg = Colors.pink },
      NvimTreeOpenedFolderName = { fg = Colors.pink },
      NvimTreeFolderArrowOpen = { fg = Colors.pink },
      NvimTreeFolderArrowClosed = { fg = Colors.pink },
      NvimTreeWinSeparator = { fg = Colors.pink, bg = "none" },
      NvimTreeWindowPicker = { fg = Colors.cyan, bg = "none" },
      NvimTreeNormal = { bg = "none" },

      -- Icons
      DevIconlua = { fg = Colors.cyan },
      DevIconTSX = { fg = Colors.cyan },
      DevIconJSX = { fg = Colors.cyan },
      DevIconjs = { fg = Colors.cyan },
      DevIconcss = { fg = Colors.cyan },
      DevIconDefault = { fg = Colors.cyan },

      -- Telescope
      TelescopeSelection = { bg = Colors.cyan, fg = "black" },
      TelescopeNormal = { fg = "#BDB8BF", bg = "NONE" },
      TelescopeBorder = { fg = Colors.cyan, bg = "none" },
      TelescopePromptBorder = { fg = Colors.cyan, bg = "none" },
      TelescopePromptPrefix = { fg = Colors.cyan, bg = "none" },
      TelescopePromptTitle = { fg = Colors.pink, bg = "none" },
      TelescopeResultsTitle = { fg = Colors.pink, bg = "none" },
      TelescopePreviewTitle = { fg = Colors.pink, bg = "none" },
      TelescopePromptNormal = { fg = "white", bg = "none" },
      TelescopeMatching = { fg = Colors.pink },
      NonText = { fg = Colors.pink },

      -- NvDash
      NvDashButtons = { bg = "none" },
      NvDashAscii = { bg = "none", fg = Colors.pink },

      -- CMP
      CmpBorder = { fg = "red" },
      CmpDocBorder = { fg = "red", bg = "none" },
      CmpItemAbbrMatch = { fg = Colors.pink },
      PmenuSel = { fg = Colors.cyan, bg = "none" },
      CmpDoc = { bg = "none" },
      CmpPmenu = { bg = "none" },

      -- Searching
      Search = { bg = Colors.pink, fg = "black", bold = true },
      IncSearch = { bg = Colors.cyan, fg = "black", bold = true },
    },

    transparency = true,
    theme = "jabuti",
  },
}

return M
