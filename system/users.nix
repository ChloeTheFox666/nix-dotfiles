{ pkgs, ... }:

{
  config = {
    programs = {
      zsh = {
        enable = true;

        enableCompletion = true;
        autosuggestions.enable = true;

        enableGlobalCompInit = false;
        syntaxHighlighting.enable = true;
      };

      direnv.enable = true;
    };

    users.users.chloethefox666 = {
      isNormalUser = true;
      useDefaultShell = true;
      description = "chloethefox666";
      extraGroups = [ "networkmanager" "wheel" "dialout" "plugdev" "adbusers" "gamemode" "docker" "kvm" "libvirtd" "cdrom" ];
      shell = pkgs.zsh;
    };

    security.sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };
}
