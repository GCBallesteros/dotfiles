{ lib, ... }:

{
  options.dotfiles = lib.mkOption {
    type = lib.types.path;
    default = "/Users/guillem/.dotfiles";
  };
}
