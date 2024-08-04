return {
  "leath-dub/snipe.nvim",
  config = function()
    local snipe = require "snipe"
    snipe.setup()
    vim.keymap.set("n", "gs", snipe.create_buffer_menu_toggler(), { desc = "Toggle buffer list" })
  end,
}
