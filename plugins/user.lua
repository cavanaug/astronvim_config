return {
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
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  require("better_escape").setup {
    mapping = { "kj", "jj" },   -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = true,   -- clear line after escaping if there is only whitespace
  },

  require("illuminate").configure {
    under_cursor = true,
    min_count_to_highlight = 2,
  },

  -- require("lspconfig")["yamlls"].setup {
  --   settings = {
  --     yaml = {
  --       schemas = {
  --         ["http://json-schema.org/draft-07/schema#"] = "*.schema.yaml",
  --       },
  --     },
  --   },
  -- },
}
