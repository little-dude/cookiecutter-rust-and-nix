with import <nixpkgs> { };
stdenv.mkDerivation rec {
  name = "{{cookiecutter.project_name}}";
  buildInputs = [
    pkgs.rust-analyzer
    pkgs.latest.rustChannels.nightly.rust
    pkgs.cargo-edit
    pkgs.cargo-tree
    pkgs.cargo-license
    pkgs.rustfmt
  ];
  RUST_BACKTRACE = 1;
  src = null;
}
