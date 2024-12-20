-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Tabsize
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2




-- ## KEYMAPS ##
--
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'write/save' })

vim.keymap.set('n', '<leader>eq', '@q<CR>', { desc = 'exec recording' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'go down and center cursor' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'go up and center cursor' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open Explorer
vim.keymap.set('n', '<leader>ex', vim.cmd.Explore, { desc = 'Open File Explorer' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move selected lines up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })


-- ######


-- Autocommands

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set colorscheme on file-type
vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Set coloscheme based on file type',
  group = vim.api.nvim_create_augroup('kgysu-colorscheme', { clear = true }),
  callback = function()
    if vim.bo.filetype == "zig" then
      vim.cmd.colorscheme("gruvbox")
    elseif vim.bo.filetype == "go" then
      vim.cmd.colorscheme("tokyonight-night")
    else
      vim.cmd.colorscheme("gruvbox")
    end
  end,
})



-- ## PLUGINS ##

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
--   local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
--   if vim.v.shell_error ~= 0 then
--     error('Error cloning lazy.nvim:\n' .. out)
--   end
-- end ---@diagnostic disable-next-line: undefined-field
-- vim.opt.rtp:prepend(lazypath)



-- [[ Configure and install plugins ]]
-- require('lazy').setup({
--   'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
--   -- "gc" to comment visual regions/lines
--   --{ 'numToStr/Comment.nvim', opts = {} },
--   --
--   {
--     'lewis6991/gitsigns.nvim',
--     opts = {
--       signs = {
--         add = { text = '+' },
--         change = { text = '~' },
--         delete = { text = '_' },
--         topdelete = { text = '‾' },
--         changedelete = { text = '~' },
--       },
--     },
--   },
--   --
--
--   -- Useful plugin to show you pending keybinds.
--   {
--     'folke/which-key.nvim',
--     event = 'VimEnter', -- Sets the loading event to 'VimEnter'
--     opts = {
--       icons = {
--         -- set icon mappings to true if you have a Nerd Font
--         mappings = vim.g.have_nerd_font,
--         -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
--         -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
--         keys = vim.g.have_nerd_font and {} or {
--           Up = '<Up> ',
--           Down = '<Down> ',
--           Left = '<Left> ',
--           Right = '<Right> ',
--           C = '<C-…> ',
--           M = '<M-…> ',
--           D = '<D-…> ',
--           S = '<S-…> ',
--           CR = '<CR> ',
--           Esc = '<Esc> ',
--           ScrollWheelDown = '<ScrollWheelDown> ',
--           ScrollWheelUp = '<ScrollWheelUp> ',
--           NL = '<NL> ',
--           BS = '<BS> ',
--           Space = '<Space> ',
--           Tab = '<Tab> ',
--           F1 = '<F1>',
--           F2 = '<F2>',
--           F3 = '<F3>',
--           F4 = '<F4>',
--           F5 = '<F5>',
--           F6 = '<F6>',
--           F7 = '<F7>',
--           F8 = '<F8>',
--           F9 = '<F9>',
--           F10 = '<F10>',
--           F11 = '<F11>',
--           F12 = '<F12>',
--         },
--       },
--
--       -- Document existing key chains
--       spec = {
--         { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
--         { '<leader>d', group = '[D]ocument' },
--         { '<leader>r', group = '[R]ename' },
--         { '<leader>s', group = '[S]earch' },
--         { '<leader>w', group = '[W]orkspace' },
--         { '<leader>t', group = '[T]oggle' },
--         { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
--       },
--     },
--   },
--   --
--
--    -- Fuzzy Finder (files, lsp, etc)
--    {
--     'nvim-telescope/telescope.nvim',
--     event = 'VimEnter',
--     branch = '0.1.x',
--     dependencies = {
--       'nvim-lua/plenary.nvim',
--       { -- If encountering errors, see telescope-fzf-native README for installation instructions
--         'nvim-telescope/telescope-fzf-native.nvim',
--         build = 'make',
--         cond = function()
--           return vim.fn.executable 'make' == 1
--         end,
--       },
--       { 'nvim-telescope/telescope-ui-select.nvim' },
--       { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
--     },
--     config = function()
--       -- [[ Configure Telescope ]]
--       -- See `:help telescope` and `:help telescope.setup()`
--       require('telescope').setup {
--         extensions = {
--           ['ui-select'] = {
--             require('telescope.themes').get_dropdown(),
--           },
--         },
--       }
--       -- Enable Telescope extensions if they are installed
--       pcall(require('telescope').load_extension, 'fzf')
--       pcall(require('telescope').load_extension, 'ui-select')
--       -- See `:help telescope.builtin`
--       local builtin = require 'telescope.builtin'
--       vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
--       vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
--       vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
--       vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
--       vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
--       vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
--       vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
--       vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
--       vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
--       vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
--
--       -- Slightly advanced example of overriding default behavior and theme
--       vim.keymap.set('n', '<leader>/', function()
--         -- You can pass additional configuration to Telescope to change the theme, layout, etc.
--         builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--           winblend = 10,
--           previewer = false,
--         })
--       end, { desc = '[/] Fuzzily search in current buffer' })
--
--       -- It's also possible to pass additional configuration options.
--       --  See `:help telescope.builtin.live_grep()` for information about particular keys
--       vim.keymap.set('n', '<leader>s/', function()
--         builtin.live_grep {
--           grep_open_files = true,
--           prompt_title = 'Live Grep in Open Files',
--         }
--       end, { desc = '[S]earch [/] in Open Files' })
--
--       -- Shortcut for searching your Neovim configuration files
--       vim.keymap.set('n', '<leader>sn', function()
--         builtin.find_files { cwd = vim.fn.stdpath 'config' }
--       end, { desc = '[S]earch [N]eovim files' })
--     end,
--   },
--
--   -- LSP
--   {
--     -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
--     -- used for completion, annotations and signatures of Neovim apis
--     'folke/lazydev.nvim',
--     ft = 'lua',
--     opts = {
--       library = {
--         { path = 'luvit-meta/library', words = { 'vim%.uv' } },
--       },
--     },
--   },
--   { 'Bilal2453/luvit-meta', lazy = true },
--   {
--     -- Main LSP Configuration
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       -- Automatically install LSPs and related tools to stdpath for Neovim
--       { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
--       'williamboman/mason-lspconfig.nvim',
--       'WhoIsSethDaniel/mason-tool-installer.nvim',
--       { 'j-hui/fidget.nvim', opts = {} },
--       'hrsh7th/cmp-nvim-lsp',
--     },
--     config = function()
--       vim.api.nvim_create_autocmd('LspAttach', {
--         group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
--         callback = function(event)
--           local map = function(keys, func, desc, mode)
--             mode = mode or 'n'
--             vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
--           end
--           --  To jump back, press <C-t>.
--           map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
--           map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--           map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
--           map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
--           map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--           map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--           map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--           map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
--           map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--
--           local client = vim.lsp.get_client_by_id(event.data.client_id)
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
--             local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
--             vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.document_highlight,
--             })
--             vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.clear_references,
--             })
--             vim.api.nvim_create_autocmd('LspDetach', {
--               group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
--               callback = function(event2)
--                 vim.lsp.buf.clear_references()
--                 vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
--               end,
--             })
--           end
--
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
--             map('<leader>th', function()
--               vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
--             end, '[T]oggle Inlay [H]ints')
--           end
--         end,
--       })
--
--       -- Change diagnostic symbols in the sign column (gutter)
--       if vim.g.have_nerd_font then
--         local signs = { Error = '', Warn = '', Hint = '', Info = '' }
--         for type, icon in pairs(signs) do
--           local hl = 'DiagnosticSign' .. type
--           vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--         end
--       end
--
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--
--       local servers = {
--         -- clangd = {},
--         -- gopls = {},
--         -- pyright = {},
--         -- rust_analyzer = {},
--         lua_ls = {
--           -- cmd = {...},
--           -- filetypes = { ...},
--           -- capabilities = {},
--           settings = {
--             Lua = {
--               completion = {
--                 callSnippet = 'Replace',
--               },
--               diagnostics = { disable = { 'missing-fields' } },
--             },
--           },
--         },
--       }
--
--       require('mason').setup()
--       local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         'stylua', -- Used to format Lua code
--       })
--       require('mason-tool-installer').setup { ensure_installed = ensure_installed }
--
--       require('mason-lspconfig').setup {
--         handlers = {
--           function(server_name)
--             local server = servers[server_name] or {}
--             server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--             require('lspconfig')[server_name].setup(server)
--           end,
--         },
--       }
--     end,
--   },
--   --
--
--   -- Autoformat
--   {
--     'stevearc/conform.nvim',
--     event = { 'BufWritePre' },
--     cmd = { 'ConformInfo' },
--     keys = {
--       {
--         '<leader>f',
--         function()
--           require('conform').format { async = true, lsp_format = 'fallback' }
--         end,
--         mode = '',
--         desc = '[F]ormat buffer',
--       },
--     },
--     opts = {
--       notify_on_error = false,
--       format_on_save = function(bufnr)
--         local disable_filetypes = { c = true, cpp = true }
--         local lsp_format_opt
--         if disable_filetypes[vim.bo[bufnr].filetype] then
--           lsp_format_opt = 'never'
--         else
--           lsp_format_opt = 'fallback'
--         end
--         return {
--           timeout_ms = 500,
--           lsp_format = lsp_format_opt,
--         }
--       end,
--       formatters_by_ft = {
--         lua = { 'stylua' },
--       },
--     },
--   },
--
--   -- Autocompletion
--   {
--     'hrsh7th/nvim-cmp',
--     event = 'InsertEnter',
--     dependencies = {
--       {
--         'L3MON4D3/LuaSnip',
--         build = (function()
--           if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
--             return
--           end
--           return 'make install_jsregexp'
--         end)(),
--         dependencies = {
--           -- `friendly-snippets` contains a variety of premade snippets.
--           --    See the README about individual language/framework/plugin snippets:
--           --    https://github.com/rafamadriz/friendly-snippets
--           -- {
--           --   'rafamadriz/friendly-snippets',
--           --   config = function()
--           --     require('luasnip.loaders.from_vscode').lazy_load()
--           --   end,
--           -- },
--         },
--       },
--       'saadparwaiz1/cmp_luasnip',
--       'hrsh7th/cmp-nvim-lsp',
--       'hrsh7th/cmp-path',
--     },
--     config = function()
--       local cmp = require 'cmp'
--       local luasnip = require 'luasnip'
--       luasnip.config.setup {}
--
--       cmp.setup {
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--         completion = { completeopt = 'menu,menuone,noinsert' },
--         mapping = cmp.mapping.preset.insert {
--           ['<C-n>'] = cmp.mapping.select_next_item(),
--           ['<C-p>'] = cmp.mapping.select_prev_item(),
--           ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--           ['<C-f>'] = cmp.mapping.scroll_docs(4),
--           -- Accept ([y]es) the completion.
--           ['<C-y>'] = cmp.mapping.confirm { select = true },
--           --['<CR>'] = cmp.mapping.confirm { select = true },
--           ['<Tab>'] = cmp.mapping.select_next_item(),
--           ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--           ['<C-Space>'] = cmp.mapping.complete {},
--           ['<C-l>'] = cmp.mapping(function()
--             if luasnip.expand_or_locally_jumpable() then
--               luasnip.expand_or_jump()
--             end
--           end, { 'i', 's' }),
--           ['<C-h>'] = cmp.mapping(function()
--             if luasnip.locally_jumpable(-1) then
--               luasnip.jump(-1)
--             end
--           end, { 'i', 's' }),
--         },
--         sources = {
--           {
--             name = 'lazydev',
--             group_index = 0,
--           },
--           { name = 'nvim_lsp' },
--           { name = 'luasnip' },
--           { name = 'path' },
--         },
--       }
--     end,
--   },
--
--
--   -- Color Schemes
--   {
--     'folke/tokyonight.nvim',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     init = function()
--       vim.cmd.colorscheme 'tokyonight-night'
--
--       -- You can configure highlights by doing something like:
--       vim.cmd.hi 'Comment gui=none'
--     end,
--   },
--   {
--     'ellisonleao/gruvbox.nvim', 
--     priority = 999, 
--     config = true, 
--     opts = function()
--       require("gruvbox").setup({
--         terminal_colors = true, -- add neovim terminal colors
--         undercurl = true,
--         underline = false,
--         bold = true,
--         italic = {
--           strings = false,
--           emphasis = false,
--           comments = false,
--           operators = false,
--           folds = false,
--         },
--         strikethrough = true,
--         invert_selection = false,
--         invert_signs = false,
--         invert_tabline = false,
--         invert_intend_guides = false,
--         inverse = true, -- invert background for search, diffs, statuslines and errors
--         contrast = "", -- can be "hard", "soft" or empty string
--         palette_overrides = {},
--         overrides = {},
--         dim_inactive = false,
--         transparent_mode = false,
--       })
--     end
--   },
--   --
--
--   -- Highlight todo, notes, etc in comments
--   { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
--   --
--
--   -- Collection of various small independent plugins/modules
--   {
--     'echasnovski/mini.nvim',
--     config = function()
--       local statusline = require 'mini.statusline'
--       statusline.setup { use_icons = vim.g.have_nerd_font }
--       ---@diagnostic disable-next-line: duplicate-set-field
--       statusline.section_location = function()
--         return '%2l:%-2v'
--       end
--     end,
--   },
--   --
--
--   -- Colorize better, Highlight, edit, and navigate code
--   {
--     'nvim-treesitter/nvim-treesitter',
--     build = ':TSUpdate',
--     main = 'nvim-treesitter.configs', -- Sets main module to use for opts
--     -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--     opts = {
--       ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
--       -- Autoinstall languages that are not installed
--       auto_install = true,
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = { },
--       },
--       indent = { enable = true, disable = { } },
--     },
--   },
--   --
--
--   -- Custom Plugins
--
--   {
--     'kdheepak/lazygit.nvim',
--     dependencies = {
--       'nvim-telescope/telescope.nvim',
--       'nvim-lua/plenary.nvim',
--     },
--     config = function()
--       require('telescope').load_extension 'lazygit'
--       vim.keymap.set('n', '<leader>git', ':LazyGit<CR>', { desc = 'open LazyGit' })
--     end,
--   },
--   {
--     'mbbill/undotree',
--     config = function()
--       vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'open undotree' })
--     end,
--   },
--
--   {
--     'ThePrimeagen/harpoon',
--     branch = 'harpoon2',
--     dependencies = {
--       'nvim-lua/plenary.nvim',
--       'nvim-telescope/telescope.nvim',
--     },
--     config = function()
--       local harpoon = require 'harpoon'
--       harpoon:setup()
--
--       vim.keymap.set('n', '<leader>a', function()
--         harpoon:list():add()
--       end, { desc = 'append to harpoon list' })
--       vim.keymap.set('n', '<leader>A', function()
--         harpoon:list():prepend()
--       end, { desc = 'prepend to harpoon list' })
--       vim.keymap.set("n", "<C-0>", function()
--         harpoon.ui:toggle_quick_menu(harpoon:list())
--       end)
--
--       -- Toggle previous & next buffers stored within Harpoon list
--       vim.keymap.set('n', '<leader>p', function()
--         harpoon:list():prev()
--       end, { desc = 'previous in harpoon list' })
--       vim.keymap.set('n', '<leader>n', function()
--         harpoon:list():next()
--       end, { desc = 'next in harpoon list' })
--
--       vim.keymap.set("n", "<C-1>", function()
--         harpoon:list():select(1)
--       end)
--       vim.keymap.set("n", "<C-2>", function()
--         harpoon:list():select(2)
--       end)
--       vim.keymap.set("n", "<C-3>", function()
--         harpoon:list():select(3)
--       end)
--       vim.keymap.set("n", "<C-4>", function()
--         harpoon:list():select(4)
--       end)
--
--       -- basic telescope configuration
--       local conf = require('telescope.config').values
--       local function toggle_telescope(harpoon_files)
--         local file_paths = {}
--         for _, item in ipairs(harpoon_files.items) do
--           table.insert(file_paths, item.value)
--         end
--         require('telescope.pickers')
--           .new({}, {
--             prompt_title = 'Harpoon',
--             finder = require('telescope.finders').new_table {
--               results = file_paths,
--             },
--             previewer = conf.file_previewer {},
--             sorter = conf.generic_sorter {},
--           })
--           :find()
--       end
--
--       vim.keymap.set('n', '<C-e>', function()
--         toggle_telescope(harpoon:list())
--       end, { desc = 'Open harpoon window' })
--     end,
--   },
--
--
-- }, {
--   ui = {
--     -- If you are using a Nerd Font: set icons to an empty table which will use the
--     -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
--     icons = vim.g.have_nerd_font and {} or {
--       cmd = '⌘',
--       config = '🛠',
--       event = '📅',
--       ft = '📂',
--       init = '⚙',
--       keys = '🗝',
--       plugin = '🔌',
--       runtime = '💻',
--       require = '🌙',
--       source = '📄',
--       start = '🚀',
--       task = '📌',
--       lazy = '💤 ',
--     },
--   },
-- })
--
--
