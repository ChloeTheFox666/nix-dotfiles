{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  services = {
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

    logmein-hamachi.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    printing.enable = true;

    udev = {
      packages = [
        pkgs.android-udev-rules
        pkgs.openrgb
      ];

      extraRules = ''
        SUBSYSTEM=="kvmfr", OWNER="chloethefox666", GROUP="kvm", MODE="0660"
      '';
    };

    xserver = {
      xkb = {
        layout = "ro";
        variant = "";
      };
    };

    fwupd.enable = true;

    flatpak.enable = true;
  };


  security = {
    # Pipewire
    rtkit.enable = true;
  };
}
