{ config, pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.wrapObs {
      plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ]
    })
  ];
}
