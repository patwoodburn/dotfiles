{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.neovim
    pkgs.git
  ];
}
