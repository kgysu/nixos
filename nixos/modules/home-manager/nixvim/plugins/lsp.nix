{pkgs, ...}: 

{
  programs.nixvim = {
    # Dependencies
    # { 'Bilal2453/luvit-meta', lazy = true },
    #
    #
    # Allows extra capabilities providied by nvim-cmp
    # https://nix-community.github.io/nixvim/plugins/cmp-nvim-lsp.html
   plugins.cmp-nvim-lsp = {
      enable = true;
    };

    # Useful status updates for LSP.
    # https://nix-community.github.io/nixvim/plugins/fidget/index.html
    plugins.fidget = {
      enable = true;
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugi#extraplugins
    extraPlugins = with pkgs.vimPlugins; [
      # NOTE: This is where you would add a vim plugin that is not implemented in Nixvim, also see extraConfigLuaPre below
      #
      # TODO: Add luvit-meta when Nixos package is added
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      "kickstart-lsp-attach" = {
        clear = true;
      };
    };

    # https://nix-community.github.io/nixvim/plugins/lsp/index.html
    plugins.lsp = {
      enable = true;

      servers = {
        clangd = {
         enable = true;
        };
        
	gopls = {
         enable = true;
        };

        lua_ls = {
          enable = true;
          settings = {
            completion = {
              callSnippet = "Replace";
            };
            # diagnostics = {
            #  disable = [
            #    "missing-fields"
            #  ];
            # };
          };
        };

        nixd = {
          enable = true;
        };
      };

      keymaps = {
        # Diagnostic keymaps
        diagnostic = {
          # "<leader>ql" = {
          #   #mode = "n";
          #   action = "setloclist";
          #   desc = "Open diagnostic [Q]uickfix [L]ist";
          # };
          "<leader>vd" = {
            #mode = "n";
            action = "open_float";
            desc = "Open float";
          };
          "[d" = {
            #mode = "n";
            action = "goto_next";
            desc = "Diagnostic: Goto next";
        };
          "]d" = {
            #mode = "n";
            action = "goto_prev";
            desc = "Diagnostic: Goto prev";
          };
        };

        extra = [
          # Jump to the definition of the word under your cusor.
          #  This is where a variable was first declared, or where a function is defined, etc.
          #  To jump back, press <C-t>.
          # {
          #   mode = "n";
          #   key = "gd";
          #   action.__raw = "require('telescope.builtin').lsp_definitions";
          #   options = {
          #     desc = "LSP: [G]oto [D]efinition";
          #   };
          # }
          # # Find references for the word under your cursor.
          # {
          #   mode = "n";
          #   key = "gr";
          #   action.__raw = "require('telescope.builtin').lsp_references";
          #   options = {
          #     desc = "LSP: [G]oto [R]eferences";
          #   };
          # }
          # # Jump to the implementation of the word under your cursor.
          # #  Useful when your language has ways of declaring types without an actual implementation.
          # {
          #   mode = "n";
          #   key = "gI";
          #   action.__raw = "require('telescope.builtin').lsp_implementations";
          #   options = {
          #     desc = "LSP: [G]oto [I]mplementation";
          #   };
          # }
          # # Jump to the type of the word under your cursor.
          # #  Useful when you're not sure what type a variable is and you want to see
          # #  the definition of its *type*, not where it was *defined*.
          # {
          #   mode = "n";
          #   key = "<leader>D";
          #   action.__raw = "require('telescope.builtin').lsp_type_definitions";
          #   options = {
          #     desc = "LSP: Type [D]efinition";
          #   };
          # }
          # # Fuzzy find all the symbols in your current document.
          # #  Symbols are things like variables, functions, types, etc.
          # {
          #   mode = "n";
          #   key = "<leader>ds";
          #   action.__raw = "require('telescope.builtin').lsp_document_symbols";
          #   options = {
          #     desc = "LSP: [D]ocument [S]ymbols";
          #   };
          # }
          # # Fuzzy find all the symbols in your current workspace.
          # #  Similar to document symbols, except searches over your entire project.
          # {
          #   mode = "n";
          #   key = "<leader>ws";
          #   action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
          #   options = {
          #     desc = "LSP: [W]orkspace [S]ymbols";
          #   };
          # }
        ];

        lspBuf = {
          "gd" = {
            #mode = "n";
            action = "definition";
            desc = "LSP: [G]oto [D]efinition";
          };
          "K" = {
            #mode = "n";
            action = "hover";
            desc = "LSP: Hover";
          };
          "<leader>vws" = {
            #mode = "n";
            action = "workspace_symbol";
            desc = "LSP: [W]orkspace [S]ymbol";
          };
          # Rename the variable under your cursor.
          #  Most Language Servers support renaming across files, etc.
          "<leader>vrn" = {
            action = "rename";
            desc = "LSP: [R]e[n]ame";
          };
          # Execute a code action, usually your cursor needs to be on top of an error
          # or a suggestion from your LSP for this to activate.
          "<leader>vca" = {
            #mode = "n";
            action = "code_action";
            desc = "LSP: [C]ode [A]ction";
          };
          # WARN: This is not Goto Definition, this is Goto Declaration.
          #  For example, in C this would take you to the header.
          # "gD" = {
          #   action = "declaration";
          #   desc = "LSP: [G]oto [D]eclaration";
          # };
          "<leader>vrr" = {
            #mode = "n";
            action = "references";
            desc = "LSP: [R]eferences";
          };
          "<C-h>" = {
            #mode = "i";
            action = "signature_help";
            desc = "LSP: signature help";
          };
        };
      };

      onAttach = ''
        -- The following two autocommands are used to highlight references of the
        -- word under the cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end
      '';
    };
  };
}

