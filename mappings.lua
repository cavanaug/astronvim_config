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
    ["<C-c>"] = { "<cmd>close<cr>", desc = "Close split" },
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
    --     #conflictstyle = diff3
    -- .hgrc settings
    --     [merge-tools]
    --     vimdiff.executable = nvimdiff
    --     vimdiff.args = -f -d $output -M $local $base $other -c "wincmd J" -c "set modifiable" -c "set write"
    --     vimdiff.premerge = keep
    ["<leader>m"] = {
      name = " Merge/Diff",
      r = { "<cmd>diffget REMOTE<cr>", "Merge <REMOTE> diff", mode = { "n", "v" } },
      l = { "<cmd>diffget LOCAL<cr>", "Merge <LOCAL> diff", mode = { "n", "v" } },
      b = { "<cmd>diffget BASE<cr>", "Merge <BASE>  diff", mode = { "n", "v" } },
      p = { "<cmd>diffput<cr>", "Merge <this> diff", mode = { "n", "v" } },
      c = { "<cmd>wincmd j<cr>wqa<cr>", "Merge complete...", mode = { "n", "v" } },
      q = { "<cmd>cq!<cr>", "Merge quit/abandon...", mode = { "n", "v" } },
    },

    -- AI Mappings
    ["<leader>a"] = {
      name = "󰧑 AI/ChatGPT",
      c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
      e = { "<cmd>ChatGPTEditWithInstruction<CR>", "GPT Edit with instruction", mode = { "n", "v" } },
      g = { "<cmd>ChatGPTRun grammar_correction<CR>", "GPT Grammar Correction", mode = { "n", "v" } },
      t = { "<cmd>ChatGPTRun translate<CR>", "GPT Translate", mode = { "n", "v" } },
      k = { "<cmd>ChatGPTRun keywords<CR>", "GPT Keywords", mode = { "n", "v" } },
      d = { "<cmd>ChatGPTRun docstring<CR>", "GPT Docstring", mode = { "n", "v" } },
      a = { "<cmd>ChatGPTRun add_tests<CR>", "GPT Add Tests", mode = { "n", "v" } },
      o = { "<cmd>ChatGPTRun optimize_code<CR>", "GPT Optimize Code", mode = { "n", "v" } },
      s = { "<cmd>ChatGPTRun summarize<CR>", "GPT Summarize", mode = { "n", "v" } },
      f = { "<cmd>ChatGPTRun fix_bugs<CR>", "GPT Fix Bugs", mode = { "n", "v" } },
      x = { "<cmd>ChatGPTRun explain_code<CR>", "GPT Explain Code", mode = { "n", "v" } },
      r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "GPT Roxygen Edit", mode = { "n", "v" } },
      l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "GPT Code Readability Analysis", mode = { "n", "v" } },
    },

    ["g"] = { name = "Go..." },
    ["gf"] = { "<cmd>wincmd F<cr>", desc = "Go to file:line under cursor" },

    -- Telescope Mappings
    ["<leader>fC"] = false,
    ["<leader>fe"] = { function() require("telescope.builtin").commands() end, desc = "Find ex commands" },
    ["<leader>fa"] = {
      function()
        local cwd = vim.fn.stdpath "config" .. "/.."
        local search_dirs = {}
        for _, dir in ipairs(astronvim.supported_configs) do -- search all supported config locations
          if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
        end
        if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning
          require("astronvim.utils").utils.notify("No user configuration files found", vim.log.levels.WARN)
        else
          if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
          require("telescope.builtin").find_files {
            prompt_title = "Config Files",
            search_dirs = search_dirs,
            cwd = cwd,
            follow = true,
          } -- call telescope
        end
      end,
      desc = "Find AstroNvim config files",
    },
    ["<leader>fA"] = {
      function()
        local cwd = vim.fn.stdpath "data" .. "/lazy"
        require("telescope.builtin").find_files {
          prompt_title = "Plugin Config Files",
          cwd = cwd,
          follow = true,
        } -- call telescope
      end,
      desc = "Find Astrovim plugin files",
    },

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
    -- ["<C-Space>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
    -- ["<C-/>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    ["<C-Space>"] = { "za", desc = "Toggle fold under cursor" },
    ["<C-Enter>"] = { "", desc = "Step into topic" },
    ["<C-BS>"] = { "", desc = "Step out of topic" },
    ["<C-'"] = false,
  },

  --
  -- Terminal Window Maps
  --
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    --
    -- Faster access to common items
    -- ["<C-Space>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
    ["<C-o>"] = { "", noremap = true, desc = "Toggle Term" },
  },
}
