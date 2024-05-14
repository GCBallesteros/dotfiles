let pkgs = import <nixpkgs> { };
in pkgs.stdenv.mkDerivation rec {
  name = "pyenv-virtualenv";
  version = "1.2.3";

  nativeBuildInputs = [ pkgs.git ];

  src = pkgs.fetchFromGitHub {
    owner = "pyenv";
    repo = "pyenv-virtualenv";
    rev = "refs/tags/v${version}";
    hash = "sha256-QTg/z4chIWb8ugZRb7uebuVbcHbTa1VMFhNewDsESgY=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out"
    cp -R "$src"  "$out"
  '';
  system = builtins.currentSystem;
}

