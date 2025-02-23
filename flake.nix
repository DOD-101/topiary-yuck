{
  description = "topiary-yuck flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        inherit (pkgs) lib;
      in
      rec {
        packages.default = pkgs.stdenv.mkDerivation (finalAttrs: {
          pname = "topiary-yuck";
          version = "0.1.0";

          src = ./.;

          nativeBuildInputs = with pkgs; [
            makeWrapper
          ];

          buildInputs = with pkgs; [
            topiary
          ];

          installPhase = ''
            mkdir -p $out/bin
            cp ./topiary-yuck.sh $out/bin/topiary-yuck
            chmod ugo+x $out/bin/topiary-yuck
            wrapProgram $out/bin/topiary-yuck \
              --prefix PATH : ${lib.makeBinPath [ pkgs.topiary ]}

            cp ./languages.ncl $out/bin/languages.ncl
            cp -r ./languages $out/bin/languages
          '';

          meta = {
            description = "Simple shell script wrapper around topiary to format yuck files more easily";
            homepage = "https://github.com/dod-101/topiary-yuck";
            license = lib.licenses.mit;
          };
        });

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            topiary
            graphviz
            packages.default
          ];
        };
      }
    );
}
