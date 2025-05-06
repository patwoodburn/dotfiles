{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    pkgs.zsh
    pkgs.clang
    pkgs.clang-tools
    pkgs.unzip
    pkgs.stow
    pkgs.neovim
    pkgs.git
    pkgs.lshw
    pkgs.usbutils
    pkgs.pciutils
    pkgs.bolt
  ];
  programs.zsh = {
    enable = true;
    ohMyZsh= {
      enable = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
