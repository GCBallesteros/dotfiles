# G's Setup

Brief installation guide. I assume I'm starting from afresh Endevour OS i3wm install.

1. Update the mirrors
2. Update the system fully

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

sudo yay -S \
  tokyonight-gtk-theme-git \
  nerd-fonts \
  git-delta

# Build the bandwidth program for i3Blocks
cd .config/i3/scripts/bandwidth
make

# Change the shell to  zsh
chsh

# Install zinit, staship, uv, nvm and rust
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
curl -sS https://starship.rs/install.sh | sh
curl -LsSf https://astral.sh/uv/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
curl https://sh.rustup.rs -sSf | sh

# Install tokyo night theme for rofi
sudo cp /path/to/this/repo/root/tokyonight.rasi \
        /usr/share/rofi/themes

# Bring in the dotfiles
chezmoi init --apply GCBallesteros
```

# Generating ssh keys
```bash
ssh-keygen -t ed25519 -C "comment"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/privatekeyfile
```
# Maintenance guide

# ToDo
- Maintenance guide
- Click on date and open thunderbird calendar

