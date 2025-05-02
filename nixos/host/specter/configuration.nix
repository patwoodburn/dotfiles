{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../common/cli.nix
    ../../desktop/xfce.nix
  ];
}
