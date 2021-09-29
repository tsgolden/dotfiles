# dotfiles

My personal configuration. Barely functional. Mostly stolen. 

Managed with [GNU Stow](https://www.gnu.org/software/stow/), like so:

- Install `stow`, and probably other things
- Clone this repo into your home directory, then `cd` into it
- Remove any preexisting config files in your home directory that conflict with those in `dotfiles` (or move them into `dotfiles`!) because `stow` won't overwrite them 
- Install the config files for each directory in `dotfiles` with, for example, `stow zsh`, and watch as they magically appear in your home directory
    