print("after/plugin/telescope.lua entered")

local builtin = require "telescope.builtin"

-- This finds buffers by their name.
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = '[F]ind [B]uffers'})

-- This may not be particularly useful.
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind in [D]iagnostics' })

-- This finds files by their name.
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = '[F]ind [F]iles'})

-- This finds files by their content.
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = '[F]ind by [G]rep'})

-- This finds Git controlled files by their name.
-- It avoids excluded files such as those under a `node_modules` directory.
vim.keymap.set('n', '<leader>fG', builtin.git_files, {desc = '[F]ind in [G]it'})

-- This finds help files by their content.
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = '[F]ind in [H]elp'})

-- This fines files whose content includes the word under the cursor.
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })

-- Project Search (from ThePrimeagen)
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({search = vim.fn.input("Grep> ")})
end)

