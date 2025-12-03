{config, lib, ... }:

{
  options.custom.xdg = {
    enable = lib.mkEnableOption "xdg module";
  };

  config = lib.mkIf config.custom.xdg.enable {
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
  };  
}
