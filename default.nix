let
  nixpkgs = import <nixpkgs> {};
  inherit (nixpkgs) stdenv lib fetchurl autoconf boost systemd libusb1;
  inherit (lib) getLib optional;

  mayu = stdenv.mkDerivation {
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

  };

in
  mayu
