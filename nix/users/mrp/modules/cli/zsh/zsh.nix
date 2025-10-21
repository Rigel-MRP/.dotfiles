{ config, lib, pkgs, ... }:

{  
  config = lib.mkIf config.programs.cliMod.zsh {
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
  };  
}
