{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../users/woody.nix
    ../../common/cli.nix
    ../../common/sound.nix
    ../../desktop/xfce.nix
    #../../sway.nix
    ../../desktop/gameable.nix

  ];

  environment.systemPackages = with pkgs; [
    pkgs.arandr
    pkgs.mons
  ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "specter"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "woody";

  # Configure console keymap
  console.keyMap = "dvorak";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  # bellow is this is some nvidia config that should be moved 
  #  # Enable OpenGL
  #hardware.graphics = {
  #  enable = true;
  #};

  ## Load nvidia driver for Xorg and Wayland
  #services.xserver.videoDrivers = ["nvidia"];

  #hardware.nvidia = {

  #  # Modesetting is required.
  #  modesetting.enable = true;

  #  # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
  #  # Enable this if you have graphical corruption issues or application crashes after waking
  #  # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
  #  # of just the bare essentials.
  #  powerManagement.enable = false;

  #  # Fine-grained power management. Turns off GPU when not in use.
  #  # Experimental and only works on modern Nvidia GPUs (Turing or newer).
  #  powerManagement.finegrained = false;

  #  # Use the NVidia open source kernel module (not to be confused with the
  #  # independent third-party "nouveau" open source driver).
  #  # Support is limited to the Turing and later architectures. Full list of 
  #  # supported GPUs is at: 
  #  # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
  #  # Only available from driver 515.43.04+
  #  open = false;

  #  # Enable the Nvidia settings menu,
  #  # accessible via `nvidia-settings`.
  #  nvidiaSettings = true;

  #  # Optionally, you may need to select the appropriate driver version for your specific GPU.
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  #};
}
