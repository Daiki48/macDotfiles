local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
		layout_strategy = "horizontal",
		layout_config = {
			height = 90,
			preview_cutoff = 40,
		},
    mappings = {
			n = {
				["q"] = actions.close
			},
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
		file_browser = {
			hijack_netrw = true,
			mappings = {
				["n"] = {
					["N"] = fb_actions.create,
					["Y"] = fb_actions.copy,
					["M"] = fb_actions.move,
					["R"] = fb_actions.rename,
					["D"] = fb_actions.remove,
				},
			},
		},
  },
}

require("telescope").load_extension "file_browser"

vim.keymap.set("n", "<space>ff", function()
	builtin.find_files({
		prompt_prefix = "🔍: ",
		no_ignore = false,
		hidden = true,
		initial_mode = "insert",
	})
end)

vim.keymap.set("n", "<space>fg", function()
	builtin.live_grep()
end)

vim.keymap.set("n", "<space>fb", function()
	builtin.buffers({
		initial_mode = "normal",
	})
end)

vim.keymap.set("n", "<space>fh", function()
	builtin.help_tags({
		initial_mode = "normal",
	})
end)

vim.keymap.set("n", "<space>fr", function()
	builtin.resume({
		initial_mode = "normal",
	})
end)

vim.keymap.set("n", "<space>fd", function()
	builtin.diagnostics({
		initial_mode = "normal",
	})
end)

vim.keymap.set("n", "<space>fj", function()
	telescope.extensions.file_browser.file_browser({
		prompt_prefix = "🔍: ",
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		hidden = true,
		initial_mode = "normal",
		layout_config = {
			height = 40,
			width = 90,
		},
		grouped = true,
	})
end)

