-- [[ quarto.nvim]]
-- desc: quarto mode for neovim
-- repo: https://github.com/quarto-dev/quarto-nvim

return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {},
  ft = { "quarto", "markdown" },
  config = function()
    require("quarto").setup({
      lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = { "r", "python", "rust" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    })

    -- add categories to which-key
    require("which-key").add({
      -- run
      { "<leader>r", group = "[r]un" },
      { "<leader>r_", hidden = true },

      -- insert
      { "<leader>i", group = "[i]nsert" },
      { "<leader>i_", hidden = true },
    })

    -- runner keymaps
    local runner = require("quarto.runner")
    vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "[r]un [c]ell", silent = true })
    vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "[r]un cell and [a]bove", silent = true })
    vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "[r]un [A]ll cells", silent = true })
    vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "[r]un [l]ine", silent = true })
    vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "[r]un visual range", silent = true })
    vim.keymap.set("n", "<leader>re", function()
      runner.run_all(true)
    end, { desc = "[r]un [e]verything (all languages)", silent = true })

    -- insert keymaps
    vim.keymap.set("n", "<leader>ip", "i```{python}<CR><CR>```<ESC>k0", { desc = "[i]nsert [p]ython block" })
  end,
}
