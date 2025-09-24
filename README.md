# G's Setup

Brief installation guide. I assume I'm starting from afresh Endevour OS i3wm install.

1. Update the mirrors
2. Update the system fully

pacman -S \
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
  neovim

cd .config/i3/scripts/bandwidth
make

sudo yay -S nerd-fonts
sudo yay -S tokyonight-gtk-theme-git 

chsh to zsh

# Install zinit, staship, uv, nvm and rus
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
curl -sS https://starship.rs/install.sh | sh
curl -LsSf https://astral.sh/uv/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
curl https://sh.rustup.rs -sSf | sh

# ToDo
- Update spacing on i3bar (today)
- Better rofi
- Click on date and open thunderbird calendar
- Improve colors of i3 (open multiple windows )

# Maintenance guide
