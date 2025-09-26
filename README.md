# G's Setup

Quick-start guide for setting up my desktop from a fresh [Endevour OS](https://endeavouros.com) i3wm install.

1. Update the system mirrors (see Maintenance guide below)
2. Do a full system update (see Maintenance guide below)

3. Install a bunch of software
```bash
sudo pacman -S \
  zsh \
  kitty \
  chezmoi \
  eza \
  zoxide \
  fzf \
  xclip \
  thunderbird \
  jq \
  fd \
  flameshot \
  zellij \
  neovim

 yay -S \
  tokyonight-gtk-theme-git \
  nerd-fonts \
  git-delta

# Change the default shell
chsh

# Zinit (ZSH plugin manager)
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Starship prompt
curl -sS https://starship.rs/install.sh | sh

# UV (Python project manager)
curl -LsSf https://astral.sh/uv/install.sh | sh

# NVM (Node.js version manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Rust (via rustup)
curl https://sh.rustup.rs -sSf | sh


# Install tokyo night theme for rofi
sudo cp /path/to/this/repo/root/tokyonight.rasi \
        /usr/share/rofi/themes

# Bring in the dotfiles
chezmoi init --apply GCBallesteros

# Build the bandwidth program for i3Blocks
cd .config/i3/scripts/bandwidth
make
```

# Generating ssh keys
```bash
ssh-keygen -t ed25519 -C "comment"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/privatekeyfile
```
# Maintenance guide
Adapted from the [endevour forums](https://forum.endeavouros.com/t/a-complete-idiots-guide-to-endeavour-os-maintenance-update-upgrade/25184)

1. (Frequently) Remember to update regularly with `eos-update --aur`. During the update you
   might find that [`pacnew` and `pacsave` files](https://wiki.archlinux.org/title/Pacman/Pacnew_and_Pacsave) are generated. `pacsave` are backups
while `pacnew` are created when a package upgrade would modify an existing config file. In the case of conflicts You will need to fix things manually.
2. (Monthly) Update the mirror list: `reflector --verbose -c FR -c DE -c LU -c PT -c ES --protocol https --sort age --latest 20 --download-timeout 5 --save /etc/pacman.d/mirrorlist`. This
   one is specific to my location.
   Immediately followed by: `yay -Syyu`
3. (Monthly) Update EOS mirrors: `eos-rankmirrors --verbose` again always followed immediately by `yay -Syyu`
4. Cleanup the [journal](https://wiki.archlinux.org/title/Systemd/Journal) logs. You can have `journalctl --rotate --vacuum-time=4weeks` on cronjob


