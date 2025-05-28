{
   inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        aagl = {
            url = "github:ezKEa/aagl-gtk-on-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        minegrub-world-sel-theme = {
            url = "github:Lxtharia/minegrub-world-sel-theme";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-matlab = {
            inputs.nixpkgs.follows = "nixpkgs";
            url = "gitlab:doronbehar/nix-matlab";
        };

        spicetify-nix = {
            url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = {self, nixpkgs, home-manager, ...} @inputs:

    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config = {
                allowUnfree = true;
            };
            overlays = with inputs; [
                # nixos-cosmic.overlays.default
            ];
        };
        lib = nixpkgs.lib;
    in

    {
        nixosConfigurations.laptop = lib.nixosSystem {
            modules = [
#                 ./configuration.nix
                ./hardware-configuration.nix

                #Modules
                ./system/boot.nix
                ./system/desktop.nix
                ./system/fonts.nix
                ./system/nix.nix
                ./system/services.nix
                ./system/users.nix
                ./system/virtualization.nix
                ./system/containers.nix

                #Home manager
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        extraSpecialArgs = { inherit inputs pkgs system; };

                        backupFileExtension = "old";

                        users.chloethefox666 = {
                            imports = [
                                ./home-manager/home.nix
                            ];
                        };
                    };
                }
            ];
            specialArgs = {inherit inputs pkgs system;};
        };
    };
}
