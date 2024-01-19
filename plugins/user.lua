return {
  { "samoshkin/vim-mergetool" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- JC:  Hopefully we get kitty graphics protocol in windows Terminal
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = false, -- only works on Windows for hidden files/directories
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
          },
          hide_by_pattern = {
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            ".gitignore",
            ".local",
            ".config",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = { -- uses glob style patterns
            ".null-ls_*",
          },
        },
      },
    },
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  -- opts = { symbol = "╎", options = { try_as_border = true } },
  -- opts = { symbol = "", options = { try_as_border = true } },
  -- opts = { symbol = "║", options = { try_as_border = true } },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl", --
    opts = {
      indent = { char = "┆" },
      -- indent = { char = "" },
      -- indent = { char = "╎" },
      -- indent = { char = "┃" },
    },
  },
  {
    "roobert/tabtree.nvim",
    enabled = false,
    config = function() require("tabtree").setup() end,
  },
  -- {
  --   "abecodes/tabout.nvim",
  --   enabled = false,
  --   opts = {
  --     tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
  --     backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
  --     act_as_tab = true, -- shift content if tab out is not possible
  --     act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
  --     default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
  --     default_shift_tab = "<C-d>", -- reverse shift default action,
  --     enable_backwards = true, -- well ...
  --     completion = true, -- if the tabkey is used in a completion pum
  --     tabouts = {
  --       { open = "'", close = "'" },
  --       { open = '"', close = '"' },
  --       { open = "`", close = "`" },
  --       { open = "(", close = ")" },
  --       { open = "[", close = "]" },
  --       { open = "{", close = "}" },
  --     },
  --     ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
  --     exclude = {}, -- tabout will ignore these filetypes
  --   },
  --   dependencies = { "nvim-treesitter/nvim-treesitter" }, -- or require if not used so far
  --   -- after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
  -- },

  require("better_escape").setup {
    mapping = { "kj", "jj" }, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = true, -- clear line after escaping if there is only whitespace
  },

  require("illuminate").configure {
    under_cursor = true,
    min_count_to_highlight = 2,
  },

  require("mini.indentscope").setup {
    symbol = "│",
  },

  -- require("copilot").setup {
  --   panel = {
  --     enabled = true,
  --     auto_refresh = false,
  --     keymap = {
  --       jump_prev = "[[",
  --       jump_next = "]]",
  --       accept = "<CR>",
  --       refresh = "gr",
  --       open = "<M-CR>",
  --     },
  --     layout = {
  --       position = "bottom", -- | top | left | right
  --       ratio = 0.4,
  --     },
  --   },
  --   suggestion = {
  --     enabled = true,
  --     auto_trigger = false,
  --     debounce = 75,
  --     keymap = {
  --       accept = "<M-l>",
  --       accept_word = false,
  --       accept_line = false,
  --       next = "<M-]>",
  --       prev = "<M-[>",
  --       dismiss = "<C-]>",
  --     },
  --   },
  --   filetypes = {
  --     yaml = false,
  --     markdown = false,
  --     help = false,
  --     gitcommit = false,
  --     gitrebase = false,
  --     hgcommit = false,
  --     svn = false,
  --     cvs = false,
  --     ["."] = false,
  --   },
  --   copilot_node_command = "node", -- Node.js version must be > 18.x
  --   server_opts_overrides = {},
  -- },
  -- require("lspconfig")["yamlls"].setup {
  --   settings = {
  --     yaml = {
  --       schemas = {
  --         ["http://json-schema.org/draft-07/schema#"] = "*.schema.yaml",
  --       },
  --     },
  --   },
  -- },
  --
}
