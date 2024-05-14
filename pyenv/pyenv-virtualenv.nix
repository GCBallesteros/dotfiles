{ stdenv, fetchFromGitHub, git }:
stdenv.mkDerivation rec {
  name = "pyenv-virtualenv";
  version = "1.2.3";

  nativeBuildInputs = [ git ];

  src = fetchFromGitHub {
    owner = "pyenv";
    repo = "pyenv-virtualenv";
    rev = "refs/tags/v${version}";
    hash = "sha256-QTg/z4chIWb8ugZRb7uebuVbcHbTa1VMFhNewDsESgY=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out"
    cp -R "$src/."  "$out"
  '';
  system = builtins.currentSystem;
}

