{ pkgs, lib, makeWrapper,  ... }:

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

    brasero
    puddletag
  ];
}
