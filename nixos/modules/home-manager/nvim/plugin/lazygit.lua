require('telescope').load_extension 'lazygit'
vim.keymap.set('n', '<leader>git', ':LazyGit<CR>', { desc = 'open LazyGit' })

