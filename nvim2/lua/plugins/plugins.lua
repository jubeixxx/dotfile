return {
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup {
        keys = {
          ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
        },
      }
    end,
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup {
        copy_sync = {
          enable = false,
        },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "NTBBloodbath/zig-tools.nvim",
    ft = "zig",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "akinsho/toggleterm.nvim",
    },
    config = function() require("zig-tools").setup() end,
    requires = {
      {
        "akinsho/toggleterm.nvim",
        config = function() require("toggleterm").setup() end,
      },
      {
        "nvim-lua/plenary.nvim",
        module_pattern = "plenary.*",
      },
    },
  },
  {
    "tpope/vim-fugitive",
  },
  { "lewis6991/gitsigns.nvim" },
}
