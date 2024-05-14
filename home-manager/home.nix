{ config, pkgs, ... }:
let
  pyenv = with pkgs;
    (import ../pyenv/pyenv.nix {
      inherit lib stdenv fetchFromGitHub installShellFiles git;
    });

in {
  programs.home-manager.enable = true;

  home.username = "guillem";
  home.homeDirectory = "/Users/guillem";

  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    bottom
    curl
    cmake
    dust
    eza
    fd
    fzf
    gdal
    git
    git-crypt
    git-lfs
    htop
    imagemagick
    jq
    luajit
    nixfmt-classic
    nix-prefetch-github
    nmap
    nodejs
    poetry
    (import ./python-packages.nix { inherit pkgs; })
    pyenv
    qmk
    ripgrep
    rsync
    rustup
    stylua
    unzip
    wget
    whois
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "GCBallesteros";
    userEmail = "dev+github@maxwellrules.com";
    #extraConfig = {
    #  commit.gpgsign = true;
    #  gpg.format = "ssh";
    #  user.signingkey = "~/.ssh/github.pub";
    #};
  };

  programs.zoxide = { enable = true; };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/github";
        identitiesOnly = true;
      };
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      lua = { disabled = true; };
      c = { disabled = true; };
      rust = { disabled = true; };
      python = {
        version_format = "\${major}.\${minor}";
        format =
          "[\${symbol}\${pyenv_prefix}(\${version} )(\\($virtualenv\\) )]($style)";
      };
      nix-shell = {
        format = "[$symbol$state( \\($name\\))]($style)";

      };
      package = { disabled = true; };
    };
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "GitHub";
      italic-text = "always";
    };
  };

  #programs.pyenv = { enable = true; };

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  # Symlinking program configurations
  home.file."${config.xdg.configHome}/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/neovim";
    recursive = true;
  };

  home.file."${config.xdg.configHome}/zellij" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles}/zellij";
    recursive = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      sl = "eza --color=auto";
      ls = "eza --color=auto";
      ll = "eza -lh";
      la = "eza -a";
      lla = "eza -lah";
      mkdir = "mkdir -p";
      cat = "bat";
      update =
        "nix run ${config.dotfiles} -- switch --flake ${config.dotfiles}";
      cd = "z";
      cdi = "zi";
    };
    history = {
      size = 10000;
      save = 10000;
      ignorePatterns =
        [ "ls" "[bf]g" "exit" "reset" "clear" "cd" "cd .." "cd.." ];
      ignoreSpace = true;
      ignoreDups = true;
      share = true;
    };

    # Still need to remember to install pyenv-virtualenv manually
    # https://github.com/pyenv/pyenv-virtualenv
    initExtra = ''
      export PYENV_ROOT="${config.xdg.dataHome}/pyenv"
    '';
  };

  home.sessionVariables = {
    PYENV_VIRTUALENV_DISABLE_PROMPT = 1;
    OPENAI_API_KEY = (import ./secrets.nix).OPENAI_API_KEY;
  };
}
