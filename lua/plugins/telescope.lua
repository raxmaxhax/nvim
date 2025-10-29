return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep({
					debounce = 250,
					additional_args = {
						"--no-heading",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob",
						"!node_modules/*",
						"--glob",
						"!.git/*",
						"-j1",
						"--max-count",
						"1000",
					},
				})
			end)
			vim.keymap.set("n", "<leader>fa", function()
				builtin.find_files({ no_ignore = true, hidden = true })
			end)
			require("telescope").load_extension("ui-select")
		end,
	},
}
