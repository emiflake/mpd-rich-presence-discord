{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
stdenv.mkDerivation rec {
  pname = "mpd-rich-presence";
  version = "0.0.0";

  src = ./.;

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    clang
    cmake
  ];

  buildInputs = with pkgs; [ 
    mpd_clientlib 
    discord-rpc
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp mpd_discord_richpresence $out/bin
  '';
}
