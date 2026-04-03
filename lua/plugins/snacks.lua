return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	test = "",
	opts = {
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		picker = {
			formatters = { file = { truncate = 1000 } },
			enabled = true,
			sources = {
				git_files = {
					untracked = true,
				},
				smart = {
					multi = { "recent", "files" },
					finder = { "files" },
					-- min_chars = 3,
				},
				explorer = {
					hidden = true,
					ignored = false,
					include = {
						"**/ThirdParty",
						"**/thirdparty",
						"**/Build",
						"**/build",
					},
					exclude = {
						"**/__pycache__",
					},
				},
			},
		},
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = true, -- show open fold icons
				git_hl = true, -- use Git Signs hl for fold icons
			},
			git = {
				patterns = { "GitSign" },
			},
			refresh = 50, -- refresh at most every 50ms
		},
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 10, total = 200 },
				easing = "linear",
			},
			-- faster animation when repeating scroll after delay
			animate_repeat = {
				delay = 100, -- delay in ms before using the repeat animation
				duration = { step = 5, total = 50 },
				easing = "linear",
			},
		},
		terminal = { enabled = true },
		notifier = { enabled = true },
		git = { enabled = true },
		scratch = { enabled = true },
	},
}
