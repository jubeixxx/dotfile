-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

local term = require "toggleterm"

term.setup {
  open_mapping = [[<c-\>]],
}

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
-- }

vim.opt.swapfile = false
vim.keymap.set("n", "<C-q>", ":call QuickFixToggle <cr>")

---@type LazySpec
return {
  "Mofiqul/adwaita.nvim",
  {
    "ThePrimeagen/harpoon",
    config = function()
      local opts = { silent = true, noremap = true }
      vim.keymap.set("n", "<c-o>", ":lua require('harpoon.mark').add_file() <cr>", opts)
      vim.keymap.set("n", "<c-e>", ":lua require('harpoon.ui').toggle_quick_menu() <cr>", opts)
      vim.keymap.set("n", "<c-n>", ":lua require('harpoon.ui').nav_next() <cr>", opts)
      vim.keymap.set("n", "<c-p>", ":lua require('harpoon.ui').nav_prev() <cr>", opts)
    end,
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "matze/vim-move",
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function() require("render-markdown").setup {} end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {},
  -- },
  "leath-dub/snipe.nvim",
}
