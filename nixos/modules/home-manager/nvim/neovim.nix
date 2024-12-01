{ config, lib, pkgs, ... }:

{
  programs.neovim = 
    let
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard

      lua-language-server
      stylua

      #rnix-lsp
      nil
      nixpkgs-fmt

      go
      gopls
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-cmp
      nvim-lspconfig
      cmp-path
      cmp-buffer
      cmp-nvim-lsp
      cmp-nvim-lua
      #nvim-lsp-installer

      plenary-nvim

      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugin/telescope.lua;
      }

      {
        plugin = nvim-treesitter;
        config = toLuaFile ./plugin/treesitter.lua;
      }

      {
        plugin = undotree;
        config = toLuaFile ./plugin/undotree.lua;
      }

      {
        plugin = harpoon2;
        config = toLuaFile ./plugin/harpoon.lua;
      }

      {
        plugin = tokyonight-nvim;
        config = toLuaFile ./plugin/tokyonight.lua;
      }

      {
        plugin = gruvbox-nvim;
        config = toLuaFile ./plugin/gruvbox.lua;
      }

      {
        plugin = rose-pine;
        config = toLuaFile ./plugin/rose-pine.lua;
      }

      {
        plugin = lsp-zero-nvim;
        config = toLuaFile ./plugin/lsp.lua;
      }

      {
        plugin = lazygit-nvim;
        config = toLuaFile ./plugin/lazygit.lua;
      }

        # {
        #   plugin = lazy-nvim;
        #   config = toLuaFile ./plugin/lazy.lua;
        # }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';

  };
}
