{ config, pkgs, ... }:

let
  home-manager = import <home-manager> {};
in
{
  home = {
    stateVersion = "24.05"; # Adjust to the appropriate version

    programs = {
      zsh.enable = true; # Example for Zsh
      gnome = {
        enable = true;
        extensions = [ "dash-to-dock@micxgx.gmail.com" ]; # Add GNOME extensions here
      };
    };

    # Include custom dotfiles
    # dotfiles = {
    #   enable = true;
    #   managedFiles = {
    #     bashrc = "./dotfiles/.bashrc";
    #     vimrc = "./dotfiles/.vimrc";
    #   };
    # };
  };
}
