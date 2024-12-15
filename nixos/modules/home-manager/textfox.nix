{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.textfox.homeManagerModules.default ];

  textfox = {
    enable = true;
    profile = "default";
    config = {
      # background = {
      #   color = "1e1e2e";
      # };
      #  border = {
      #     color = "#cba6f7";
      #     width = "4px";
      #     transition = "1.0s ease";
      #     radius = "3px";
      #   };
      displayHorizontalTabs = true;
      displayNavButtons = true;
      newtabLogo = "   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";
      font = {
        family = "JetBrainsMono Nerd Font";
        size = "15px";
        # accent = "#c6a0f6";
      };
      sidebery = {
        margin = "1.0rem";
      };
    };
  };

}
