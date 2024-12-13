# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cachix.nix
      ./home.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Indian/Antananarivo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "mg_MG.UTF-8";
    LC_IDENTIFICATION = "mg_MG.UTF-8";
    LC_MEASUREMENT = "mg_MG.UTF-8";
    LC_MONETARY = "mg_MG.UTF-8";
    LC_NAME = "mg_MG.UTF-8";
    LC_NUMERIC = "mg_MG.UTF-8";
    LC_PAPER = "mg_MG.UTF-8";
    LC_TELEPHONE = "mg_MG.UTF-8";
    LC_TIME = "mg_MG.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  #nix.settings.substituters = [ "https://cache.nixos.org/" "https://qgis-website.cachix.org/" ];
  #nix.settings.trusted-public-keys = [ "qgis-website.cachix.org-1:hB8M468vYZp/Wd+Y/PBrGfX0TO0QM9+wFi1hNuW1Teo=" ];
  # Overlay for hugo to use the v0.139.0
  nixpkgs.overlays = [
    (self: super: {
      hugo = let
	unstable = import (builtins.fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/2d8bfa3908fb9ed5d3c405645e73e5c494d04d0b.tar.gz";
          sha256 = "1crv53mh1av81kh3n23lf4af0ag06y1hhs2xf6izn8mlw481vgv3";
        }) { inherit (config.nixpkgs) config; };
      in unstable.hugo;
    })
  ];
  # Allow unfree pkgs like VSCode
  nixpkgs.config.allowUnfree = true; 
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xpirix = {
    isNormalUser = true;
    description = "Lova Andriarimalala";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
      vim
      git
      vscode
      gnomeExtensions.dash-to-dock
      terminator
      hugo
      cachix	
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
} 
