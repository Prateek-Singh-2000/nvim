return {
	"kylechui/nvim-surround",
	event = "VeryLazy",

	config = function()
		require("nvim-surround").setup({
			aliases = {
				["p"] = { ")", "}", "]" }
			}
		})
	end
}
