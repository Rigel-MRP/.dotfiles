{ config, lib, pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home = {

    username = "mrp";
    homeDirectory = "/home/mrp";

    stateVersion = "25.05";
    packages = with pkgs; [
    kitty
    nerd-fonts.jetbrains-mono
    ];
  };
  
  programs.git = {
    enable = true;
    userName = "Rigel-MRP";
    userEmail = "git@nullsun.net";
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraConfig = ''
      set number
      set relativenumber
    '';
  };

  programs.nh = {
    enable = true;
    flake = "/home/mrp/.dotfiles/nix/";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--delete-older-than 7d";
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "${config.home.homeDirectory}/desktop";
      download = "${config.home.homeDirectory}/downloads";
      templates = "${config.home.homeDirectory}/modelos";
      publicShare = "${config.home.homeDirectory}/public";
      documents = "${config.home.homeDirectory}/documents";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/images";
      videos = "${config.home.homeDirectory}/videos";
    };
  };

  programs.bash.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "colored-man-pages" ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k.zsh;
        file = "p10k.zsh";
      }
    ];

    initContent = lib.mkOrder 550 "
          if [[ -r \"\${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh\" ]]; then
            source \"\${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh\"
          fi
        ";
    initExtra = "
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    ";
  };

  home.file.".p10k.zsh".source = ./p10k.zsh;

  home.shellAliases = {
    ls = "ls --color";
    ll = "ls -lah --color";
    la = "ls -a --color";
    svi = "sudo nvim";
    ff = "fastfetch";

    e = "exit";
    clr = "clear";

    df = "df -h";
    free = "free -h";

    "..." = "../..";
    "...." = "../../..";

    power = ''echo "$(cat /sys/class/power_supply/BAT0/status): $(cat /sys/class/power_supply/BAT0/capacity)%"'';
};
}

