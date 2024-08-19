return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-j>"] = actions.move_selection_next,
            ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    }

    telescope.load_extension "fzf"

    local map = vim.keymap.set

    map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find files in cwd" })
    map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find files in cwd" })
    map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find files in cwd" })
    map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy find files in cwd" })
  end,
}
