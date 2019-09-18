with import <nixpkgs> {};

let
  texliveComb = texlive.combine {
    inherit (texlive)
      scheme-medium
      beamer;
  };
in stdenv.mkDerivation rec {
  name = "dtn7-presentation";
  src = lib.cleanSource ./presentation;

  nativeBuildInputs = [ texliveComb ];

  installPhase = "cp presentation.pdf $out";
}
