# NixOS Configuration Repository

This repository contains my NixOS configuration files using flakes, Home Manager, and dotfiles.

## Overview

- [Flakes](https://nixos.wiki/wiki/Flakes): Flakes provide a declarative and reproducible way to manage NixOS configurations.
- [Home Manager](https://github.com/nix-community/home-manager): Home Manager allows for easy management of user-specific configuration files.
- Dotfiles: This repository also includes my personal dotfiles for various applications and tools.

## Utils Command

To check the flake:

```sh
nix flake check . --impure
```

To build and switch to the NixOs Configuration:

```sh
sudo nixos-rebuild switch --flake .#nixos --impure
```

To generate the `home.nix` file:
```sh
nix run home-manager/master -- init
```

## Customization

Feel free to customize the configuration files to suit your needs. You can modify the `configuration.nix` file for system-wide configuration and the `home.nix` file for user-specific configuration.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Contributions are welcome!

## License

This repository is licensed under the [MIT License](LICENSE).
