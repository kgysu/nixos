{
  programs.nixvim = {
    # Highlight, edit, and navigate code
    # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
    plugins.treesitter = {
      enable = true;

      settings = {
        ensureInstalled = [
          "help"
          "bash"
          "c"
          "diff"
          "html"
          "lua"
          "luadoc"
          "markdown"
          "markdown_inline"
          "query"
          "vim"
          "vimdoc"
          "rust"
          "go"
        ];

        highlight = {
          enable = true;

          # Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          additional_vim_regex_highlighting = false;
        };

      };
    };
  };
}
