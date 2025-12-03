{ config, lib, ... }:

let 
  color1 = "38;5;93";
  color2 = "magenta";
in
{
  config = lib.mkIf config.custom.cli.fastfetch { 
    programs.fastfetch = {
      enable = true;
      settings = {
        outputColor = "custom"; 
        logo = {
          type = "auto";
          source = "~/.dotfiles/nix/users/mrp/modules/fastfetch/lambda.txt";
          width = 65;
          height = 35;
          padding = {
            top = 0;
            left = 0;
            right = 2;
          };
          color = {
            "1" = color1;
            "2" = color1;
          };
        };

      
        display.separator = " : ";

        modules = [
          { type = "title"; color = { user = "${color2}"; host = "${color2}"; }; }
          { type = "custom"; format = "-----------"; }

          { type = "custom"; format = "╭──── SYSTEM ────────────────────────────────────────────╮"; }
          { type = "os"; key = "  OS"; keyColor = "${color2}"; }
          { type = "host"; key = "    HOST"; keyColor = "${color2}"; }
          { type = "kernel"; key = "    KERNEL"; keyColor = "${color2}"; }
          { type = "uptime"; key = "    UPTIME"; keyColor = "${color2}"; }
          { type = "custom"; format = "╰────────────────────────────────────────────────────────╯"; }

          { type = "custom"; format = "╭──── SOFTWARE ──────────────────────────────────────────╮"; }
          { type = "packages"; key = "  󰏗  PACKAGES"; keyColor = "${color2}"; }
          { type = "shell"; key = "    SHELL"; keyColor = "${color2}"; }
          { type = "terminal"; key = "    TERMINAL"; keyColor = "${color2}"; }
          { type = "de"; key = "    DE"; keyColor = "${color2}"; }
          { type = "wm"; key = "  󰍹  WM"; keyColor = "${color2}"; }
          { type = "theme"; key = "  󰔌  THEME"; keyColor = "${color2}"; }
          { type = "icons"; key = "    ICONS"; keyColor = "${color2}"; }
          { type = "font"; key = "    FONT"; keyColor = "${color2}"; }
          { type = "locale"; key = "    LOCALE"; keyColor = "${color2}"; }
          { type = "custom"; format = "╰────────────────────────────────────────────────────────╯"; }

          { type = "custom"; format = "╭──── HARDWARE ──────────────────────────────────────────╮"; }
          { type = "cpu"; key = "    CPU"; keyColor = "${color2}"; }
          { type = "gpu"; key = "    GPU"; keyColor = "${color2}"; }
          { type = "memory"; key = "    MEMORY"; keyColor = "${color2}"; }
          { type = "disk"; key = "    DISK"; keyColor = "${color2}"; }
          { type = "battery"; key = "    BATTERY"; keyColor = "${color2}"; }
          { type = "display"; key = "    DISPLAY"; keyColor = "${color2}"; }
          { type = "custom"; format = "╰────────────────────────────────────────────────────────╯"; }

          { type = "break"; key = "  "; }
          { type = "colors"; }
        ];
      };
    };  
  };  
}
