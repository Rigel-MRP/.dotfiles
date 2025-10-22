{ config, lib, ... }:

{
  options.programs.cliMod = {
    enable = lib.mkEnableOption "cli module";
    aliases = lib.mkEnableOption "activate aliases submodule";
    fastfetch = lib.mkEnableOption "activate fastfetch submodule";
    git = lib.mkEnableOption "activate git submodule";
    nh = lib.mkEnableOption "activate nh submodule";
    nvim = lib.mkEnableOption "activate nvim submodule";
    xdg = lib.mkEnableOption "activate xdg submodule";
    zsh = lib.mkEnableOption "activate zsh submodule";
  };

 imports = [
    ./aliases/aliases.nix
    ./fastfetch/fastfetch.nix
    ./git/git.nix
    ./nh/nh.nix
    ./nvim/nvim.nix
    ./zsh/zsh.nix
  ];
} 
