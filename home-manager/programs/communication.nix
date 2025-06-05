{ pkgs, ... }:

{
  home.packages = with pkgs; [
    element-desktop
    teams-for-linux

    vesktop
    zapzap
    signal-desktop

    zoom-us

    thunderbird

    haguichi
  ];
}
