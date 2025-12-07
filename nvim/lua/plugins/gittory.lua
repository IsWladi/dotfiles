return {
	{
		"IsWladi/Gittory", -- for development purposes use local path instead of github

		branch = "main", -- stable version

		tag = "v0.2.0", -- pin to a specific version (recommended for stability)
		dependencies = {
			{ "j-hui/fidget.nvim" },
		},
		opts = {
			atStartUp = true,

			notifySettings = {
				enabled = true,
				availableNotifyPlugins = { "fidget" },
			},
		},
	},
}
