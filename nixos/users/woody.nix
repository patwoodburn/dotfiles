{ config, pkgs, libs, ... }:


{
  users.users.woody = {
    isNormalUser = true;
    description = "woody";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # pkgs.zsh
      pkgs.zig
      pkgs.zellij
      pkgs.zsh
      pkgs.thefuck
      pkgs.tldr
    #  thunderbird
    ];
    shell = pkgs.zsh;
    
    # shell = pkgs.bash;
  };

  fonts.packages = with pkgs; [
    pkgs.font-awesome
    pkgs.open-dyslexic
    pkgs.nerdfonts
  ];

}
