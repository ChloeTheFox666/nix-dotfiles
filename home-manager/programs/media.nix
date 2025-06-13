{ pkgs, lib,  ... }:

let
  puryfi-video-processor = pkgs.callPackage ../../packages/puryfi-video-processor.nix {
  tensorflow = pkgs.tensorflow;
#   inherit lib stdenv;
  fetchurl = lib.fetchurl;
  bash = pkgs.bash;
  makeWrapper = lib.makeWrapper;
  ffmpeg = pkgs.ffmpeg;
  };
in
{
  imports = [
    ./media/spicetify.nix
  ];

  home.packages = with pkgs; [
    vlc
    yt-dlp


    kdePackages.kdenlive
    gimp
    obs-studio


    onlyoffice-bin
    libreoffice

    floorp

    doublecmd

    tor-browser
    deluge

    librecad

    puryfi-video-processor
  ];
}
