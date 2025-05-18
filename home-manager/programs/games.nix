{ inputs, pkgs, system, ...}:

{
    home.packages = with pkgs; [
        rpcs3

        inputs.aagl.packages.${system}.an-anime-game-launcher
        heroic
        itch
        prismlauncher
        steam

        lutris
        bottles
        winetricks
        protontricks

        gamescope
        goverlay
        mangohud
    ];
}
