with import <nixpkgs> {};

let
  texliveComb = texlive.combine {
    inherit (texlive)
      scheme-medium
      acronym beamer bigfoot pgfopts pgfplots xstring;
  };
in stdenv.mkDerivation rec {
  name = "dtn7-presentation";
  src = lib.cleanSource ./presentation;

  nativeBuildInputs = [ inkscape texliveComb ];

  installPhase = "cp presentation.pdf $out";
}
