return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = {"stylua"},
        c = {"astyle"},
        cpp = {"astyle"},
        json = {"prettier"},
      },
    
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      conform.format({
        lsp_fallback = true,
        timeout_ms = 500,
        async = true,
      })
    end)
  end
}
