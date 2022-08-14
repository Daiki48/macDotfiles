local toggleterm = require("toggleterm")
local terminal = require("toggleterm.terminal").Terminal

toggleterm.setup{
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = 'single',
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local float_term = terminal:new(
	{
		hidden = true,
		direction = "float",
		float_opts = {
			border = "curved"
		},
	}
)

toggleterm.float_toggle = function()
	float_term:toggle()
end

local lazygit = terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("Closing terminal")
	end,
})

function _lazygit_toggle()
	lazygit:toggle()
end


vim.keymap.set('n', 'tt', ':ToggleTerm<CR>')
vim.keymap.set("n", "lg", ":lua _lazygit_toggle()<CR>")
