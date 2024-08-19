return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    lint.linter_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "pylint" },
      lua = { "luacheck" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function() lint.try_lint() end,
    })

    vim.keymap.set(
      "n",
      "<leader>lc",
      function() lint.try_lint() end,
      { desc = "Trigger linting in current file", silent = true }
    )
  end,
}
