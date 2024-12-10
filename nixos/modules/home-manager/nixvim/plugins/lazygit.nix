{
  programs.nixvim = {
    plugins.lazygit = {
      enable = true;

      # keymaps = {
      #  "<leader>git" = {
      #    mode = "n";
      #    action = ":LazyGit<CR>";
      #    options = {
      #      desc = "Open LazyGit";
      #    };
      #  };
      # };
    };
  };
}
