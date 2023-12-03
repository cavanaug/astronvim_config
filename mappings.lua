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
    ["<leader>b"] = { name = "Buffers" },
    -- Quick Mappings
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    -- quick switch windows
    ["<tab><tab>"] = { ":wincmd p<cr>", desc = "Go to previous window" },
    ["<tab>l"] = { ":tabnext<cr>", desc = "Go to next tab" },
    ["<tab>h"] = { ":tabprev<cr>", desc = "Go to prev tab" },
    -- Support my old surround muscle memory
    ["<leader>s"] = { "gzaiw", desc = "Surround <nextchar>", remap = true },
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
