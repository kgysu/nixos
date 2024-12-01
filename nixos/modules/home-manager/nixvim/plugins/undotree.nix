{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        "<leader>u" = {
          mode = "n";
          action = "UndotreeToggle";
          options = {
            desc = "Toggle Undotree";
          };
        };
      };
    };
  };
}
