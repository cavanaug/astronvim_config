-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    foldcolumn = "2", -- set the foldclolumn width
    scrolloff = 3, -- give at least 3 lines of text before/after active line
    signcolumn = "yes", -- sets vim.opt.signcolumn to auto
    spell = false, -- sets vim.opt.spell
    wrap = true,
    modeline = true,
    backup = true,
    writebackup = true,
    cursorline = true,
    cursorcolumn = true,
    backupdir = ".bkp,/home/cavanaug/.local/state/nvim/backup/",
    undodir = "/home/cavanaug/.local/state/nvim/undo/,.",
    conceallevel = 2,
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    localleader = ",", -- sets vim.g.localleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    vim_json_conceal = 0,
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
