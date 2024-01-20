-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  --
  -- Normal Mode Maps
  --
  n = {
    --
    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    ["<A-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    ["<A-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
    ["<A-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
    ["<A-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
    ["<C-Up>"] = false,
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- ["<leader>b"] = { name = "Buffers" },

    -- Quick Mappings
    -- quick File Ops
    ["<C-s>"] = { "<cmd>w!<cr>", desc = "Save File" },

    --
    --   Merge/Diff Mappings
    --
    -- Note: This is entirely predicated on a 3-way merge as I use for git/mercurial
    --       It assumes a model of  LOCAL | BASE | OTHER   on top with the MERGED on the bottom
    --       It also assumes that   LOCAL | BASE | OTHER   are RO, and that only MERGED IS RW
    --
    -- .gitconfig settings
    --     [merge]
    --     tool = nvimdiff
    --     conflictstyle = diff3
    -- .hgrc settings
    --     [merge-tools]
    --     vimdiff.executable = nvimdiff
    --     vimdiff.args = -f -d $output -M $local $base $other -c "wincmd J" -c "set modifiable" -c "set write"
    --     vimdiff.premerge = keep
    ["<leader>m"] = {
      name = " Merge/Diff",
      o = { "<cmd>diffget remote<cr>", desc = "Merge <remote> diff" },
      l = { "<cmd>diffget local<cr>", desc = "Merge <local> diff" },
      b = { "<cmd>diffget base<cr>", desc = "Merge <base>  diff" },
      p = { "<cmd>diffput<cr>", desc = "Merge <this> diff" },
      c = { "<cmd>wincmd j<cr>wqa<cr>", desc = "Merge complete..." },
      a = { "<cmd>cqa!<cr>", desc = "Merge abandoned..." },
    },

    ["<leader>a"] = {
      name = "AI/ChatGPT",
      c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
      e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
      g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
      t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
      k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
      d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
      a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
      o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
      s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
      f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
      x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
      r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
      l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
    },

    ["g"] = { name = "Go to ..." },
    ["gf"] = { "<cmd>wincmd F<cr>", desc = "Go to file:line under cursor" },

    -- quick switch windows (Im not so sure about this long term as it seems to conflict with other things)
    ["<leader><tab>"] = { "<cmd>tabnext<cr>", desc = "Go to next tab" },

    -- Support my old surround muscle memory
    ["<leader>s"] = { "gzaiw", desc = "Surround <nextchar>", remap = true },

    -- Support Neotree Explorer favorites
    ["<leader>e"] = {
      "<cmd>Neotree source=filesystem selector=false reveal_force_cwd<cr>",
      desc = "Neotree Explorer (.)",
    },
    ["<leader>E"] = {
      "<cmd>Neotree source=filesystem selector=false reveal dir=~<cr>",
      desc = "Neotree Explorer (home)",
    },
    ["<leader>be"] = {
      "<cmd>Neotree source=buffers selector=false reveal<cr>",
      desc = "Neotree Explorer (Buffers)",
    },
    ["<leader>ge"] = {
      "<cmd>Neotree source=git_status selector=false reveal<cr>",
      desc = "Neotree Explorer (Git)",
    },
    ["<leader>o"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          for _, v in ipairs(vim.api.nvim_tabpage_list_wins(0)) do -- search all windows to find neo-tree
            if vim.api.nvim_get_option_value("filetype", { win = v }) == "neo-tree" then
              vim.fn.win_gotoid(v) -- go to non-neo-tree window to toggle
            end
          end
        end
      end,
      desc = "Toggle Explorer Focus",
    },

    -- Faster access to common items
    ["<C-Space>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
  },

  --
  -- Terminal Window Maps
  --
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    --
    -- Faster access to common items
    ["<C-Space>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
  },
}
