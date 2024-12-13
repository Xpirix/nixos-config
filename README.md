# NixOS Configuration Repository

This repository contains my NixOS configuration files using flakes, Home Manager, and dotfiles.

## Overview

- [Flakes](https://nixos.wiki/wiki/Flakes): Flakes provide a declarative and reproducible way to manage NixOS configurations.
- [Home Manager](https://github.com/nix-community/home-manager): Home Manager allows for easy management of user-specific configuration files.
- Dotfiles: This repository also includes my personal dotfiles for various applications and tools.

## Getting Started

To use this configuration repository, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/nixos-config.git`
2. Install Nix: Follow the instructions in the [Nix manual](https://nixos.org/manual/nix/stable/#chap-installation) to install Nix on your system.
3. Activate the Nix shell: `nix-shell`
4. Build and switch to the NixOS configuration: `sudo nixos-rebuild switch --flake .#hostname`
5. Set up Home Manager: `home-manager switch`

## Customization

Feel free to customize the configuration files to suit your needs. You can modify the `configuration.nix` file for system-wide configuration and the `home.nix` file for user-specific configuration.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Contributions are welcome!

## License

This repository is licensed under the [MIT License](LICENSE).
