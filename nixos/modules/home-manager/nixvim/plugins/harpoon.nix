{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;

      keymaps = {
        addFile = "<leader>a";
        cmdToggleQuickMenu = "<C-0>";
        navNext = "<leader>n";
        navPrev = "<leader>p";
        toggleQuickMenu = "<C-e>";
      };
    };
  };
}
