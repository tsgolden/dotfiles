# dotfiles

My personal configuration. Barely functional. Mostly stolen. 

Like the [rest of the internet](https://www.google.com/search?q=dotfiles+stow), I manage my dotfiles with [GNU Stow](https://www.gnu.org/software/stow/). Stow is a program that facilitates the installation and maintenance of arbitrary packages. 

## How It Works

In a `stow` directory (`dotfiles` is considered a `stow` directory), each subdirectory is considered a package. In the case of `dotfiles` these packages contain configuration files, but stow could just as well handle packages composed of software. `stow` installs packages into a target directory, which by default is the parent directory of the `stow` directory. Installation in this case simply involves the creaion of symlinks in the target directory that refer back to the files in the given package. Since dotfiles usually live in your home directory, `dotfiles` assumes that it too is in your home directory, making your home directory the parent directory of `dotfiles` (the `stow` directory), and therefor the target directory for installation. Nice and tidy.

## Getting Started

To get started, first install `stow` (and let's be honest, probably some other things too), then clone this repo into your home directory and navigate into it. From there, installing a package is as simple as, for example, `stow zsh`. 

### Conflicts

Stow won't overwrite existing files that it doesn't own (i.e. that aren't symlinks it created in the first place). If you already have a number of pre-existing config files in your home directory that conflict with those in `dotfiles`, either remove them if they aren't useful to you, manually move them into a new or existing `stow` package for versioning in `dotfiles`, or pass the `--adopt` flag to `stow` and it will automatically incorporate them into the given package. 

### Stowing In Bulk

To stow multiple packages at once, you can alwasy pass multiple package names when you call `stow`. But if that little bit of extra effort required to decide which packages need stowing is too much for you, take the easy road and use the `dotfiles` utility `stow-all.sh`. `stow-all.sh` does the heavy lifting for you by just... stowing all of it. `stow-all.sh` makes use of the `--restow` flag to prune old symlinks, and increases the verbosity. 

The only other caveat is that `stow-all.sh` expects to be passed one of two arguments: `work` or `personal`. Given that some packages in `dotfiles` are intended for different environments and would conflict with each other if installed simultaneously, stowing everything isn't as simple as stowing everything. But by appending the conflicting packages with `work` or `personal` (e.g. `git-work` and `git-personal`) and passing one of the other of those to `stow-all.sh`, stowing it all is still pretty easy.
