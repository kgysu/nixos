{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    # Plugins
    ./plugins/gitsigns.nix
    #./plugins/which-key.nix
    ./plugins/telescope.nix
    ./plugins/conform.nix
    ./plugins/lsp.nix
    ./plugins/nvim-cmp.nix
    # ./plugins/mini.nix
    ./plugins/treesitter.nix

    # NOTE: Add/Configure additional plugins for Kickstart.nixvim
    #
    #  Here are some example plugins that I've included in the Kickstart repository.
    #  Uncomment any of the lines below to enable them (you will need to restart nvim).
    #
    # ./plugins/kickstart/plugins/debug.nix
    # ./plugins/kickstart/plugins/indent-blankline.nix
    # ./plugins/kickstart/plugins/lint.nix
    # ./plugins/kickstart/plugins/autopairs.nix
    # ./plugins/kickstart/plugins/neo-tree.nix
    #
    # NOTE: Configure your own plugins `see https://nix-community.github.io/nixvim/`
    # Add your plugins to ./plugins/custom/plugins and import them below
    ./plugins/lazygit.nix
    ./plugins/undotree.nix
    ./plugins/harpoon.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
      nixfmt-rfc-style
    ];

    colorschemes = {
      # https://nix-community.github.io/nixvim/colorschemes/tokyonight/index.html
      tokyonight = {
        enable = true;
        settings = {
          style = "night";
        };
      };
      gruvbox = {
        enable = true;
        settings = {
          terminal_colors = true;
          undercurl = true;
          underline = false;
          bold = true;
          italic = {
            strings = false;
            emphasis = false;
            comments = false;
            operators = false;
            folds = false;
          };
          strikethrough = true;
          invert_selection = false;
          invert_signs = false;
          invert_tabline = false;
          invert_intend_guides = false;
          inverse = true;
          contrast = "";
          palette_overrides = { };
          overrides = { };
          dim_inactive = false;
          transparent_mode = false;
        };
      };
      rose-pine = {
        enable = true;
        settings = {
          disable_background = true;
        };
      };
    };
    colorscheme = "rose-pine";

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#globals
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = true;
      clipboard = {
        providers = {
          wl-copy.enable = true; # For Wayland
          xsel.enable = true; # For X11
        };
        # register = "unnamedplus";
      };
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 50;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = false;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      # See `:help hlsearch`
      hlsearch = true;
      incsearch = true;
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      smartindent = true;
      termguicolors = true;
      colorcolumn = "80";
    };

    # [[ Basic Keymaps ]]
    #  See `:help vim.keymap.set()`
    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      # Clear highlights on search when pressing <Esc> in normal mode
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      # is not what someone will guess without a bit more experience.
      #
      # NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
      # or just use <C-\><C-n> to exit terminal mode
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
        };
      }
      # Keybinds to make split navigation easier.
      #  Use CTRL+<hjkl> to switch between windows
      #
      #  See `:help wincmd` for a list of all window commands
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {
          desc = "Move focus to the left window";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {
          desc = "Move focus to the right window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {
          desc = "Move focus to the lower window";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {
          desc = "Move focus to the upper window";
        };
      }
      # Personal Keymaps
      {
        mode = "n";
        key = "<C-s>";
        action = ":w<CR>";
        options = {
          desc = "Write / Save";
        };
      }
      {
        mode = "n";
        key = "<leader>eq";
        action = "@q<CR>";
        options = {
          desc = "Ecex recording";
        };
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          desc = "Go down and center view";
        };
      }
      {
        mode = "n";
        key = "<C-t>";
        action = "<C-u>zz";
        options = {
          desc = "Go up and center view";
        };
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options = {
          desc = "Next search and center view";
        };
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options = {
          desc = "Prev search and center view";
        };
      }
      {
        mode = "n";
        key = "<leader>ex";
        action = ":Explore<CR>";
        options = {
          desc = "Open file explorer";
        };
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          desc = "Move line down";
        };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          desc = "Move line up";
        };
      }
      {
        mode = "n";
        key = "<leader>git";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "Open Lazygit";
        };
      }
      {
        mode = "n";
        key = "<leader>u";
        action = "<cmd>UndotreeShow<CR>";
        options = {
          desc = "Open Undotree";
        };
      }
      {
        mode = "x";
        key = "<leader>p";
        action = "\"_dP";
        options = {
          desc = "Paste";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>y";
        action = "\"+y";
        options = {
          desc = "Copy to unnamedplus";
        };
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = "\"+Y";
        options = {
          desc = "Copy to unnamedplus";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>d";
        action = "\"_d";
        options = {
          desc = "Delete to void";
        };
      }
      {
        mode = "n";
        key = "Q";
        action = "<nop>";
        options = {
          desc = "-";
        };
      }
      {
        mode = "n";
        key = "<leader>r";
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
        options = {
          desc = "Replace Word";
        };
      }
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
      my-colorscheme = {
        clear = true;
      };
    };

    # [[ Basic Autocommands ]]
    #  See `:help lua-guide-autocommands`
    # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
    autoCmd = [
      # Highlight when yanking (copying) text
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
      # Set colorscheme based on file-type
      {
        event = [ "BufEnter" ];
        desc = "Set colorscheme based on file-type";
        group = "my-colorscheme";
        callback.__raw = ''
          function()
            if vim.bo.filetype == "zig" then
              vim.cmd.colorscheme("gruvbox")
            elseif vim.bo.filetype == "go" or vim.bo.filetype == "lua" then
              vim.cmd.colorscheme("tokyonight-night")
            else
              vim.cmd.colorscheme("rose-pine")
            end
          end
        '';
      }
    ];

    plugins = {
      web-devicons.enable = true;
      # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
      sleuth = {
        enable = true;
      };

      # Highlight todo, notes, etc in comments
      # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
      todo-comments = {
        settings = {
          enable = true;
          signs = true;
        };
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraplugins
    extraPlugins = with pkgs.vimPlugins; [
      # Useful for getting pretty icons, but requires a Nerd Font.
      nvim-web-devicons # TODO: Figure out how to configure using this with telescope
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapre
    extraConfigLuaPre = ''
      if vim.g.have_nerd_font then
        require('nvim-web-devicons').setup {}
      end
      vim.cmd("set notimeout")
      vim.cmd("set nottimeout")
    '';

    # The line beneath this is called `modeline`. See `:help modeline`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
    extraConfigLuaPost = ''
      -- vim: ts=2 sts=2 sw=2 et
    '';
  };
}
