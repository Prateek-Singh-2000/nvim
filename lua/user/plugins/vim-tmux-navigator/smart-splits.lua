-- Works with any multiplexer
return {
	"smart-splits-nvim/smart-splits.nvim",
	opts = {
		mux = {
			backend = "smart-splits-backend-wezterm",
		},
	},
	dependencies = {
		{
			"smart-splits-nvim/backend-wezterm",
			opts = {
				-- name/path of the wezterm binary; used only by :checkhealth's diagnostic version probe,
				-- never on any hot path (see "How it works")
				cli_path = 'wezterm',
			},
		},
	},
}
