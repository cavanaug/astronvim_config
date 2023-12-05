-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  -- second key is the lefthand side of the map
  n = {
    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

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
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["gf"] = { ":wincmd F<cr>", desc = "Go to file under cursor" },

    -- quick switch windows (Im not so sure about this long term as it seems to conflict with other things)
    -- ["<tab><tab>"] = { ":wincmd p<cr>", desc = "Go to previous window" },
    -- ["<tab>l"] = { ":tabnext<cr>", desc = "Go to next tab" },
    -- ["<tab>h"] = { ":tabprev<cr>", desc = "Go to prev tab" },
    ["<leader><tab>"] = { ":tabnext<cr>", desc = "Go to next tab" },

    -- Support my old surround muscle memory
    ["<leader>s"] = { "gzaiw", desc = "Surround <nextchar>", remap = true },

    -- Support Neotree Explorer favorites
    ["<leader>e"] = {
      "<cmd>Neotree source=filesystem selector=false reveal<cr>",
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
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    --
    -- Faster access to common items
    ["<C-Space>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Term" },
  },
}
