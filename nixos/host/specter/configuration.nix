{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../users/woody.nix
    ../../common/cli.nix
    ../../desktop/xfce.nix
  ];
}
