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

sudo yay -S nerd-fonts

chsh to zsh

# Install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install node via nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Install rust
curl https://sh.rustup.rs -sSf | sh

# ToDo
improve config for zsh   zsh-tab and completions and zinit
bring nvim config
- shortcuts for floating terminal with ipython running
adjust thunar GTK theme

when click date open calendar it
should open thunderbird
