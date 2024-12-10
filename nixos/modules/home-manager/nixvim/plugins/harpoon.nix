{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;

      keymaps = {
        addFile = "<leader>a";
        # cmdToggleQuickMenu = "<C-e>";
        navNext = "<C-e>";
        navPrev = "<C-n>";
        toggleQuickMenu = "<leader>h";
      };
    };
  };
}
