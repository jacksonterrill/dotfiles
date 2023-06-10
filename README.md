<div align="center">
  <a href="https://github.com/jacksonterrill/dotfiles">
    <img src="./assets/dotfiles-icon.png" alt="Dotfiles icon" height="60"/>
  </a>
  <h1>~/.dotfiles</h1>
  <p>My dotfiles collection for configuring frequently used programs. Managed via chezmoi.</p>
  <p>These dotfiles were primarily designed for my Wayland Arch Linux system, but should be mostly compatible with other Linux distributions and MacOS.</p>
  <div>
    <a href="https://github.com/jacksonterrill/dotfiles/actions/">
        <img alt="GitHub Actions CI Status" src="https://github.com/jacksonterrill/dotfiles/workflows/dotfiles-ci/badge.svg">
    </a>
    <a href="https://github.com/jacksonterrill/dotfiles">
      <img alt="Repository size" src="https://img.shields.io/github/repo-size/jacksonterrill/dotfiles?labelColor=2E3440&color=BF616A">
    </a>
    <a href="https://github.com/jacksonterrill/dotfiles/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/jacksonterrill/dotfiles?labelColor=2E3440&color=ECEFF4&style=flat">
    </a>
  </div>
</div>

## Usage
To install my dotfiles, simply install [chezmoi](https://www.chezmoi.io/) with any package manager and run the following command:
```bash
$ chezmoi init --apply jacksonterrill
```

Alternatively, install chezmoi and my dotfiles in one command with the following command:
```bash
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jacksonterrill
```
