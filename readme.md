# Nix Docs


## Commands

rebuild system with flake: 
`sudo nixos-rebuild switch --flake /etc/nixos#default`


convert json to nix:
`nix-instantiate --eval -E 'builtins.fromJSON (builtins.readFile ./result)'`




## Help

nix config:
`man configuration.nix`

home-manager:
`man home-configuration.nix`


