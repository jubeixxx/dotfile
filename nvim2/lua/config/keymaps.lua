local map = vim.keymap.set

local M = {}

M.init = function()
  -- local normal_keyboard = require("util.keyboard").has_normal_keyboard()
  map("n", "<c-s>", ":w!<CR>", { silent = true, desc = "save file" })
  map("n", "<c-q>", function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
      if win["quickfix"] == 1 then qf_exists = true end
    end
    if qf_exists == true then
      vim.cmd "cclose"
      return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then vim.cmd "copen" end
  end, { silent = true, desc = "toggle qflist", noremap = true })

  map("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, desc = "Explorer Neotree" })
  map("n", "<leader>gz", function()
    local current_path = vim.fn.expand "%"
    if current_path == "neo-tree filesystem [1]" then return end
    local Terminal = require("toggleterm.terminal").Terminal
    local git_log_term = Terminal:new {
      cmd = "git log " .. current_path .. "; read -n 1 -s -r -p 'Press any key to close...'",
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "curved",
      },
    }

    git_log_term:toggle()
  end, { silent = true, desc = "Explorer Neotree" })

  map("n", "<leader>lD", ":lua vim.diagnostic.setqflist()<cr>", { silent = true, desc = "open float diagnostic" })
  map("n", "<leader>ld", ":lua vim.diagnostic.open_float()<cr>", { silent = true, desc = "open float diagnostic" })

  map("n", "<leader>gl", ":BlameLineToggle<cr>", { silent = true, desc = "Open Git Blame in Line" })
  map("n", "j", "gj")
  map("n", "k", "gk")
  map("n", "<leader>ui", ":InlayHintsToggle<cr> ")
end

return M
