{ pkgs, ... }:

{
  stylix = {
	  enable = true;
		autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		polarity = "dark";
		targets = {
      # kitty.enable = true;
		};
  };	 
}
