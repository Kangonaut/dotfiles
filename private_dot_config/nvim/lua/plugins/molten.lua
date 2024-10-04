-- [[ molten.nvim ]]
-- desc: a neovim plugin for interactively running code with the jupyter kernel (fork of magma.nvim)
-- repo: https://github.com/benlubas/molten-nvim

return {
  "benlubas/molten-nvim",
  -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  -- NOTE: using main branch instead of latest release, to get fix for :MoltenSave command
  branch = "main",
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  ft = { "quarto", "markdown" },
  init = function()
    vim.g.molten_auto_open_output = false
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_border = { "", "━", "", "" }
    vim.g.molten_output_win_max_height = 12
    vim.g.molten_virt_text_output = true
    vim.g.molten_use_border_highlights = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_wrap_output = true
    vim.g.molten_tick_rate = 142
  end,
  config = function()
    require("which-key").add({
      { "<leader>m",  group = "[m]olten" },
      { "<leader>m_", hidden = true },
    })
    require("which-key").add({
      { "<leader>o",  group = "[o]utput" },
      { "<leader>o_", hidden = true },
    })

    vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "[m]olten [i]nit", silent = true })
    vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>",
      { desc = "[m]olten [e]valuate operator", silent = true })
    vim.keymap.set("n", "<leader>mel", ":MoltenEvaluateLine<CR>", { desc = "[m]olten [e]valuate [l]ine", silent = true })
    vim.keymap.set("v", "<leader>me", ":<C-u>MoltenEvaluateVisual<CR>",
      { desc = "[m]olten [e]valuate visual selection", silent = true })
    vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>",
      { desc = "[m]olten [r]e-evaluate cell", silent = true })
    vim.keymap.set("n", "<leader>mI", ":MoltenInterrupt<CR>", { desc = "[m]olten [I]nterrupt", silent = true })
    vim.keymap.set("n", "<leader>mR", ":MoltenRestart<CR>", { desc = "[m]olten [R]estart", silent = true })
    vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "[m]olten [d]elete", silent = true })
    vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>", { desc = "[o]utput [h]ide", silent = true })
    vim.keymap.set("n", "<leader>oe", ":noautocmd MoltenEnterOutput<CR>", { desc = "[o]utput [e]nter", silent = true })
    vim.keymap.set("n", "<leader>os", ":MoltenShowOutput<CR>", { desc = "[o]utput [s]how", silent = true })
    vim.keymap.set("n", "<leader>op", ":MoltenImagePopup<CR>", { desc = "[o]utput image [p]opup", silent = true })
    vim.keymap.set("n", "<leader>ms", ":MoltenSave<CR>", { desc = "[m]olten [s]ave", silent = true })
    vim.keymap.set("n", "<leader>ml", ":MoltenLoad<CR>", { desc = "[m]olten [l]oad", silent = true })
    vim.keymap.set("n", "<leader>mje", ":MoltenExportOutput<CR>", { desc = "[m]olten [j]upyter [e]xport", silent = true })
    vim.keymap.set("n", "<leader>mji", ":MoltenImportOutput<CR>", { desc = "[m]olten [j]upyter [i]mport", silent = true })
  end,
}
