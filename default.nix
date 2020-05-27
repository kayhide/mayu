{ pkgs ? import <nixpkgs> {}
}:

let
  inherit (pkgs) stdenv lib fetchurl autoconf boost systemd libusb1;
  inherit (lib) getLib optional;
in

stdenv.mkDerivation {
  pname = "mayu";
  version = "0.12.1";

  src = ./.;

  buildInputs = [ boost boost.out systemd libusb1 ];

  nativeBuildInputs = [ autoconf ];

  preConfigure = ''
    autoconf
  '';

  configureFlags = [
    "--with-boost=${boost.out}"
  ];
}
