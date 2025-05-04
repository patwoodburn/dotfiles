{ configs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgs.discord
    pkgs.alacritty
  ];

  # Install firefox.
  programs.firefox.enable = true;
}
