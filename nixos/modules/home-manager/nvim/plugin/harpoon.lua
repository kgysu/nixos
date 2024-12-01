-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
--
-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
-- vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)





local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'append to harpoon list' })
vim.keymap.set('n', '<leader>A', function()
  harpoon:list():prepend()
end, { desc = 'prepend to harpoon list' })
vim.keymap.set("n", "<C-0>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>p', function()
  harpoon:list():prev()
end, { desc = 'previous in harpoon list' })
vim.keymap.set('n', '<leader>n', function()
  harpoon:list():next()
end, { desc = 'next in harpoon list' })

vim.keymap.set("n", "<C-1>", function()
  harpoon:list():select(1)
end)
  vim.keymap.set("n", "<C-2>", function()
harpoon:list():select(2)
end)
  vim.keymap.set("n", "<C-3>", function()
harpoon:list():select(3)
end)
  vim.keymap.set("n", "<C-4>", function()
harpoon:list():select(4)
end)

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
local file_paths = {}
for _, item in ipairs(harpoon_files.items) do
  table.insert(file_paths, item.value)
end
require('telescope.pickers')
  .new({}, {
    prompt_title = 'Harpoon',
    finder = require('telescope.finders').new_table {
      results = file_paths,
    },
    previewer = conf.file_previewer {},
    sorter = conf.generic_sorter {},
  })
  :find()
end

vim.keymap.set('n', '<C-e>', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon window' })

