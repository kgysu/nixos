local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]ile' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git Files' })
vim.keymap.set('n', '<leader>sg', function()
  builtin.grep_search({ search = vim.fn.input("Grep > ") })
end, { desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })


