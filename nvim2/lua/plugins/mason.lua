return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require "mason"

    local mason_lspconfig = require "mason-lspconfig"

    require("mason-tool-installer").setup {

      ensure_installed = {
        "prettier",
        "isort",
        "stylua",
        "black",
        "pylint",
        "eslint_d",
        "luacheck",
        "jsonlint",
        "hadolint",
      },
    }

    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        "vtsls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "pyright",
        "zls",
      },
    }
  end,
}
