return {
  { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
  { "dhruvasagar/vim-table-mode", event = "VeryLazy" },
  { "nvim-treesitter/playground", event = "VeryLazy" },
  { "mbbill/undotree", event = "VeryLazy" },
  { "f3fora/cmp-spell", event = "VeryLazy" },
  {
    "MunsMan/kitty-navigator.nvim",
    event = "VeryLazy",
    opts = { keybindings = {} },
  },
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("easy-dotnet").setup()
    end,
  },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        mappings = {
          n = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          },
          i = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          },
        },
        file_ignore_patterns = {
          "%.class",
          "target/",
        },
        path_display = {
          "filename_first",
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require "configs.neoscroll"
    end,
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      exclude = {
        filetypes = {
          "java",
          "rust",
          "markdown",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "lua",
        },
      },
    },
  },
  {
    "numToStr/FTerm.nvim",
    config = function()
      require "configs.FTerm"
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle <cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      {
        "<leader>;",
        ":LazyGit<return>",
        silent = true,
        noremap = true,
      },
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "serhez/bento.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.bento"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,

    opts = {
      inlay_hints = { enabled = true },
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          visual = "s",
        },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura_simple"
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "rust-analyzer",
        "prettierd",
        "eslint-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "terraform-ls",
        "prismals",
        "ltex-ls-plus",
        "omnisharp",
        "qmlls",
        "gdtoolkit",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require "configs.tiny-inline-diagnostics"
      vim.diagnostic.config { virtual_text = false }
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = true,
      },
      picker = {
        sources = {
          explorer = {
            focus = "list",
            auto_close = false,
            layout = {
              layout = { position = "right" },
            },
            sort = {
              fields = { "type", "name" },
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "gdscript",
        "python",
        "lua",
        "html",
        "css",
        "json",
        "typescript",
        "javascript",
        "tsx",
        "markdown",
        "commonlisp",
        "terraform",
        "prisma",
        "rust",
        "c_sharp",
        "qmljs",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    opts = function()
      require("nvim-treesitter.configs").setup {
        refactor = {
          navigation = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
            keymaps = {
              goto_definition = false,
              list_definitions = "gnd",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
            },
          },
        },
      }
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      require("nvim-tree").setup {
        hijack_cursor = true,
        sort = {
          sorter = "name",
          folders_first = false,
          files_first = true,
        },
        view = {
          side = "right",
        },
        renderer = {
          root_folder_label = false,
          highlight_diagnostics = "all",
        },
        diagnostics = {
          enable = true,
        },
      }
    end,
  },
}
