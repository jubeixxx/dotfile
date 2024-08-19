return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    require("neo-tree").setup {

      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      sort_case_insensitive = false,
      sort_function = nil,
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function() require("neo-tree.command").execute { action = "close" } end,
        },
        -- {
        --   event = "file_opened",
        --   handler = function(file_path) require("neo-tree.sources.filesystem").reset_search(state) end,
        -- },
        {
          event = "file_renamed",
          handler = function(args)
            -- fix references to file
            print(args.source, " renamed to ", args.destination)
          end,
        },
        {
          event = "file_moved",
          handler = function(args)
            -- fix references to file
            print(args.source, " moved to ", args.destination)
          end,
        },
      },
    }

    vim.cmd "nnoremap  :Neotree reveal<cr>"
  end,
}
