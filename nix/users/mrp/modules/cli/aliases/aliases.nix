{ config, lib, ... }:

{
  config = lib.mkIf config.programs.cliMod.aliases {
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
  };
}
