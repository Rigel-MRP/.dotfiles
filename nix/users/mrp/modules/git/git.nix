{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Rigel-MRP";
    userEmail = "git@nullsun.net";
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };
}
