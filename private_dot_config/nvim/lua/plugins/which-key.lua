-- [[ which-key.nvim ]]
-- desc: displays popup with possible keybindings for the command you started typing
-- repo: https://github.com/folke/which-key.nvim

-- NOTE: event = 'VimEnter' loads which-key before all the UI elements are loaded

return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("which-key").setup()

      -- document existing key chains
      require("which-key").add({
        { "<leader>b",   group = "[b]uffer" },
        { "<leader>b_",  hidden = true },
        { "<leader>bc",  group = "[c]lose" },
        { "<leader>bc_", hidden = true },
        { "<leader>bs",  group = "[s]elect" },
        { "<leader>bs_", hidden = true },
        { "<leader>c",   group = "[c]ode" },
        { "<leader>c_",  hidden = true },
        { "<leader>f",   group = "[f]ind" },
        { "<leader>fG",  group = "[G]it" },
        { "<leader>fG_", hidden = true },
        { "<leader>f_",  hidden = true },
        { "<leader>h",   group = "git [h]unk" },
        { "<leader>h_",  hidden = true },
        { "<leader>t",   group = "[t]oggle" },
        { "<leader>t_",  hidden = true },
      })

      -- visual mode
      require("which-key").add({
        { "<leader>h",  group = "git [h]unk" },
        { "<leader>h_", hidden = true },
        { "<leader>f",  group = "[f]ind" },
        { "<leader>f_", hidden = true },
      }, { mode = "v" })
    end,
  },
}
