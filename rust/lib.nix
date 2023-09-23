{ nixpkgs, fenix }:
with nixpkgs;
with fenix; {

  rust = with complete.toolchain; combine ([
    stable.cargo
    stable.rustc
    stable.rust-src
    stable.rust-std
    pkgconfig
    openssl

  ] ++ lib.optionals stdenv.isDarwin [ nixpkgs.darwin.Security libiconv ]);

}
