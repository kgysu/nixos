{
  programs.nixvim = {
    # plugins.friendly-snippets = {
    #   enable = true;
    # };

    # Autocompletion
    # See `:help cmp`
    # https://nix-community.github.io/nixvim/plugins/cmp/index.html
    plugins.cmp = {
      enable = true;

      settings = {
        snippet = {
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };

        completion = {
          completeopt = "menu,menuone,noinsert";
          autocomplete = false;
        };

        mapping = {
          # Select the [n]ext item
          "<C-l>" = "cmp.mapping.select_next_item()";
          # Select the [p]revious item
          "<C-u>" = "cmp.mapping.select_prev_item()";
          # Scroll the documentation window [b]ack / [f]orward
          # "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          # "<C-f>" = "cmp.mapping.scroll_docs(4)";
          # Accept ([y]es) the completion.
          #  This will auto-import if your LSP supports it.
          #  This will expand snippets if the LSP sent a snippet.
          "<C-y>" = "cmp.mapping.confirm { select = true }";
          # If you prefer more traditional completion keymaps,
          # you can uncomment the following lines.
          # "<CR>" = "cmp.mapping.confirm { select = true }";
          # "<Tab>" = "cmp.mapping.select_next_item()";
          # "<S-Tab>" = "cmp.mapping.select_prev_item()";

          "<C-Space>" = "cmp.mapping.complete {}";
        };

        sources = [
          {
            name = "luasnip";
          }
          {
            name = "nvim_lsp";
          }
          {
            name = "path";
          }
        ];
      };
    };
  };
}
