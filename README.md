# dotfiles
My dotfile configurations for customizing frequently used programs.
These dotfiles were primarily designed for my Wayland Arch Linux system, but the configurations should be mostly compatible with other Linux distributions and MacOS.

## Usage
To install my dotfiles, simply install [chezmoi](https://www.chezmoi.io/) with any package manager and run the following command:
```bash
$ chezmoi init --apply jacksonterrill
```

Alternatively, install chezmoi and my dotfiles in one command with the following command:
```bash
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jacksonterrill
```
