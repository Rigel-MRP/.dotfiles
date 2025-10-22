{ config, pkgs, ... }:

{
  imports = [
    ./modules/audio.nix
    ./modules/dewm/default.nix
    ./modules/keyboard.nix
    ./modules/locale.nix
    ./modules/syspkgs.nix
    ./modules/users/mrp.nix
  ];

  networking.networkmanager.enable = true;

  programs = {
    dewm = {
      enable = true;
      desktop = "cosmic";
    };
    keyboard = {
      enable = true;
      layout = "ibm";
    };
  };  

  services.printing.enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchExternalPower = "ignore";
  services.logind.lidSwitchDocked = "ignore";
  
  services.openssh = {
  enable = true;
  settings ={
    PermitRootLogin = "no";
    PasswordAuthentication = true;
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  networking.firewall.enable = true;

  system.stateVersion = "25.05";
}
