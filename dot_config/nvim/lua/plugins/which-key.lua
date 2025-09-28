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

    -- Register your custom keymaps with descriptions
    wk.register({
      ["<C-p>"] = { "Find Files" },
      ["<C-n>"] = { "Toggle File Tree" },
      ["K"] = { "Hover Documentation" },
      ["<leader>"] = {
        f = {
          name = "Find",
          g = { "Live Grep" },
        },
        g = {
          name = "Go/Git",
          d = { "Go to Definition" },
          f = { "Format Code" },
        },
        c = {
          name = "Code",
          a = { "Code Actions" },
        },
      },
    })
  end,
}