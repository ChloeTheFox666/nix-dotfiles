{ pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];

      substituters = [
        "https://cosmic.cachix.org/"
        "https://cache.lix.systems"
        "https://cache.nixos.org/"
        "https://ezkea.cachix.org"
      ];
      trusted-public-keys = [
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      ];

      binary-caches-parallel-connections = 0;

      auto-optimise-store = true;
    };


    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than +5";
    };

    package = pkgs.lix;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
