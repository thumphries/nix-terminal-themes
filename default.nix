{ lib ? (import <nixpkgs> {}).lib }:
let
  dir = builtins.readDir ./themes;
  rnm = s : lib.replaceChars [" "] ["-"] (lib.removeSuffix ".nix" (lib.toLower s));
  xor = n : c : lib.nameValuePair (rnm n) (import (builtins.toPath (./themes + ("/" + n))));
in
  lib.mapAttrs' xor dir
