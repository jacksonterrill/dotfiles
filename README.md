# .dotfiles
My dotfile configurations for customizing frequently used programs. These dotfiles were designed for my Wayland Arch Linux system, but the configurations should be mostly compatible with other Linux distributions and MacOS. Utilizing modular management scripts, users can choose to install only compatibile dotfiles and easily remove problematic configurations. The management scripts should be compatible with all POSIX-compliant shells.

## Usage
To install my dotfiles, simply clone the repository and execute the `./manage.sh` script in the main directory with the `-s` or `--sync` flag. This operation will install all available dotfiles in the repository by utilizing symlinks.
```bash
git clone git://github.com/jacksonterrill/.dotfiles ~/.dotfiles
cd ~/.dotfiles
./manage.sh -s
```

Alternatively, choose which dotfiles to install by specifying the names of their directories. For example, the following script will install the dotfiles for bash, vim, and sway
```bash
./manage.sh -s bash vim sway
```

To remove the installed dotfiles, simply use the `-r` or `--remove` flag. By default, this removes all installed dotfiles, but you can also specify individual configurations to remove.
```bash
./manage.sh -r
```
For more help, utilize the `-h` or `--help` flag.
```bash
./manage.sh -h
```
