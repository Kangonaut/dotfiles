-- [[ jupytext.nvim ]]
-- desc: seamlessly open Jupyter Notebooks as their associated plain-text alternatives
-- repo: https://github.com/GCBallesteros/jupytext.nvim

return {
  "GCBallesteros/jupytext.nvim",
  opts = {
    style = "markdown",
    output_extension = "md",
    force_ft = "markdown",
  },
}
