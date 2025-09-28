return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
  },
  config = function()
    local wk = require("which-key")
    wk.setup()

    -- Register your custom keymaps with modern spec
    wk.add({
      { "<C-p>", desc = "Find Files" },
      { "<C-n>", desc = "Toggle File Tree" },
      { "K", desc = "Hover Documentation" },
      { "<leader>f", group = "Find" },
      { "<leader>fg", desc = "Live Grep" },
      { "<leader>g", group = "Go/Git" },
      { "<leader>gd", desc = "Go to Definition" },
      { "<leader>gf", desc = "Format Code" },
      { "<leader>c", group = "Code" },
      { "<leader>ca", desc = "Code Actions" },
    })
  end,
}