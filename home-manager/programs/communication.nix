{ pkgs, ... }:

{
  home.packages = with pkgs; [
    element-desktop
    teams-for-linux
    vesktop
    zapzap
    zoom-us

    thunderbird

    haguichi
  ];
}
