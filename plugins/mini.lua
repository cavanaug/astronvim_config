return {
  "echasnovski/mini.clue",
  cond = false,
  event = "VeryLazy",
  opts = function()
    -- map_leader("w", "<cmd>update!<CR>", "Save")
    -- map_leader("qq", require("utils").quit, "Quit")
    -- map_leader("qt", "<cmd>tabclose<cr>", "Close Tab")
    -- map_leader("sc", require("utils.coding").cht, "Cheatsheets")
    -- map_leader("so", require("utils.coding").stack_overflow, "Stack Overflow")

    local miniclue = require "mini.clue"
    return {
      window = {
        delay = 200,
        config = {
          anchor = "SE",
          width = 40,
        },
      },
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
    }
  end,
}
