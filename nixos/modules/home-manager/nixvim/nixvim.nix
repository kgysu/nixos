{ pkgs, inputs, ... }:

{
  imports = [
    # NOTE: The first thing you will want to do is uncommented on of the three imports below
    # depending on which module you chose to use to install Nixvim.
    #
    # Uncomment if you are using the home-manager module
    inputs.nixvim.homeManagerModules.nixvim
    # Uncomment if you are using the nixos module
    #inputs.nixvim.nixosModules.nixvim
    # Uncomment if you are using the nix-darwin module
    #inputs.nixvim.nixDarwinModules.nixvim

    # Plugins
    #./plugins/gitsigns.nix
    #./plugins/which-key.nix
    ./plugins/telescope.nix
    ./plugins/conform.nix
    ./plugins/lsp.nix
    ./plugins/nvim-cmp.nix
    ./plugins/mini.nix
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

  /*
    =====================================================================
    ==================== READ THIS BEFORE CONTINUING ====================
    =====================================================================
    ========                                    .-----.          ========
    ========         .----------------------.   | === |          ========
    ========         |.-""""""""""""""""""-.|   |-----|          ========
    ========         ||                    ||   | === |          ========
    ========         ||  KICKSTART.NIXVIM  ||   |-----|          ========
    ========         ||                    ||   | === |          ========
    ========         ||                    ||   |-----|          ========
    ========         ||:Tutor              ||   |:::::|          ========
    ========         |'-..................-'|   |____o|          ========
    ========         `"")----------------(""`   ___________      ========
    ========        /::::::::::|  |::::::::::\  \ no mouse \     ========
    ========       /:::========|  |==hjkl==:::\  \ required \    ========
    ========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
    ========                                                     ========
    =====================================================================
    =====================================================================

    What is Kickstart.nixvim?

      Kickstart.nixvim is a starting point for your own configuration.
        The goal is that you can read every line of code, top-to-bottom, understand
        what your configuration is doing, and modify it to suit your needs.

        Once you've done that, you can start exploring, configuring and tinkering to
        make Neovim your own!

        If you don't know anything about Nixvim, Nix or Lua, I recommend taking some time to read through.
          - https://nix-community.github.io/nixvim/
          - https://learnxinyminutes.com/docs/nix/
          - https://learnxinyminutes.com/docs/lua/

    Kickstart.nixvim Guide:

      TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

        If you don't know what this means, type the following:
          - <escape key>
          - :
          - Tutor
          - <enter key>

        (If you already know the Neovim basics, you can skip this step.)

      Once you've completed that, you can continue working through **AND READING** the rest
      of the nixvim.nix.

      Next, run AND READ `:help`.
        This will open up a help window with some basic information
        about reading, navigating and searching the builtin help documentation.

        This should be the first place you go to look when you're stuck or confused
        with something. It's one of my favorite Neovim features.

        MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
        which is very useful when you're not exactly sure of what you're looking for.

      I have left several `:help X` comments throughout the nixvim.nix and the plugin .nix files
        These are hints about where to find more information about the relevant settings,
        plugins or Neovim features used in Kickstart.nixvim.

       NOTE: Look for lines like this

        Throughout the file. These are for you, the reader, to help you understand what is happening.
        Feel free to delete them once you know what you're doing, but they should serve as a guide
        for when you are first encountering a few different constructs in your Nixvim Neovim config.

    If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

    I hope you enjoy your Neovim journey,
    - JMartJonesy

    P.S. You can delete this when you're done too. It's your config now! :)
  */
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard
      nixfmt-rfc-style
    ];

    # You can easily change to a different colorscheme.
    # Add your colorscheme here and enable it.
    # Don't forget to disable the colorschemes you arent using
    #
    # If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    colorschemes = {
      # https://nix-community.github.io/nixvim/colorschemes/tokyonight/index.html
      tokyonight = {
        enable = true;
        settings = {
          # Like many other themes, this one has different styles, and you could load
          # any other, such as 'storm', 'moon', or 'day'.
          style = "night";
        };
      };
      gruvbox = {
        enable = false;
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
        enable = false;
        settings = {
          dysable_background = true;
        };
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#globals
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };

    # [[ Setting options ]]
    # See `:help vim.opt`
    # NOTE: You can change these options as you wish!
    #  For more options, you can see `:help option-list`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#opts
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
        register = "unnamedplus";
      };
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      # See `:help hlsearch`
      hlsearch = true;
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
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
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          desc = "Go up and center view";
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
        action = ">+1<CR>gv=gv";
        options = {
          desc = "Move line down";
        };
      }
      {
        mode = "v";
        key = "K";
        action = "<-2<CR>gv=gv";
        options = {
          desc = "Move line up";
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
            else
              vim.cmd.colorscheme("tokyonight-night")
            end
          end
        '';
      }
    ];

    plugins = {
      # Adds icons for plugins to utilize in ui
      web-devicons.enable = true;

      # Detect tabstop and shiftwidth automatically
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

    # TODO: Figure out where to move this
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
