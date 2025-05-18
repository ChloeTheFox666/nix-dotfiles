{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      corefonts

      noto-fonts-color-emoji

      monocraft
    ] ++ builtins.filter (x: lib.isDerivation x) (builtins.attrValues pkgs.nerd-fonts);


    enableDefaultPackages = true;

    fontconfig = {

      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
