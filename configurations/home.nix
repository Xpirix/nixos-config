{ config, pkgs, ... }:

{
   home-manager.users.xpirix = {
    home.stateVersion = "24.05"; # Adjust to the appropriate version

    programs = {
      zsh.enable = true; # Example for Zsh
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
