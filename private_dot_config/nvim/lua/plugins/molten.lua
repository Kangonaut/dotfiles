-- [[ molten.nvim ]]
-- desc: a neovim plugin for interactively running code with the jupyter kernel (fork of magma.nvim)
-- repo: https://github.com/benlubas/molten-nvim

return {
  "benlubas/molten-nvim",
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  ft = { "quarto", "markdown" },
  init = function()
    -- these are examples, not defaults. Please see the readme
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 100
    vim.g.molten_auto_image_popup = false

    vim.g.molten_wrap_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
  end,
  config = function()
    require("which-key").add({
      { "<leader>m",  group = "[m]olten" },
      { "<leader>m_", hidden = true },
    })

    vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "[m]olten [i]nit", silent = true })
    vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>",
      { desc = "[m]olten [e]valuate operator", silent = true })
    vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "[m]olten evaluate [l]ine", silent = true })
    vim.keymap.set("v", "<leader>me", ":<C-u>MoltenEvaluateVisual<CR>",
      { desc = "[m]olten evaluate [v]isual selection", silent = true })
    vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>",
      { desc = "[m]olten [r]e-evaluate cell", silent = true })
    vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "[m]olten [d]elete", silent = true })
    vim.keymap.set("n", "<leader>moh", ":MoltenHideOutput<CR>", { desc = "[m]olten [o]utput [h]ide", silent = true })
    vim.keymap.set("n", "<leader>moe", ":MoltenHideOutput<CR>", { desc = "[m]olten [o]utput [e]nter", silent = true })
  end,
}
