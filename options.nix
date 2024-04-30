{ lib, ... }:

{
  options.dotfiles = lib.mkOption {
    type = lib.types.str;
    default = "/Users/guillem/.dotfiles";
  };
}
