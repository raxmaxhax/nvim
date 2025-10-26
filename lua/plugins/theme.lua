return {
  {
    "bjarneo/pixel.nvim",
    lazy = false,
    name = "pixel",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "pixel"
    end
  }
}
