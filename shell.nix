{ pkgs ? import <nixpkgs> { } }:

let
  settings = { ... }: {
    haskell = {
      enable = true;
      haskellPackages = pkgs.haskell.packages.ghc810;
      cabal.enable = true;
      packages = hp: with hp; [ haskell-language-server ];
    };
    buildInputs = with pkgs; [ z3 cvc4 stack ];
  };
in import ~/.config/venv-manager { inherit pkgs settings; }
