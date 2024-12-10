{
  programs.nixvim = {
    plugins.undotree = {
      enable = true;

      # keymaps = {
      #   "<leader>u" = {
      #     mode = "n";
      #     action = "UndotreeToggle";
      #     options = {
      #       desc = "Toggle Undotree";
      #     };
      #   };
      # };
    };
  };
}
