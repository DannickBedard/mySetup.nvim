return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.tlint,
				-- null_ls.builtins.diagnostics.cssls,
				--null_ls.builtins.diagnostics.intelephense,
				--null_ls.builtins.diagnostics.tsserver,
				-- null_ls.builtins.diagnostics.lua_ls,
				-- null_ls.builtins.completion.spell,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
