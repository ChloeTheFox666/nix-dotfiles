{ pkgs, inputs, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Bucharest";

#   services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  environment = {
    systemPackages = with pkgs; [
      cosmic-player
      cosmic-applets
      # cosmic-ext-applet-clipboard-manager
      # cosmic-ext-applet-emoji-selector
      # cosmic-ext-applet-external-monitor-brightness
      # examine
      cosmic-ext-tweaks
    ];

    sessionVariables = {
      COSMIC_DATA_CONTROL_ENABLED = 1;
    };
  };

  programs.steam.enable = true;

}
