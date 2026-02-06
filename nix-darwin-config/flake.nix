{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    home-manager.url = "github:nix-community/home-manager";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, mac-app-util }:
  let
    user = "ned";
    userHome = "/Users/${user}";
    dotfilesPath = "${userHome}/.dotfiles";
    configuration = { pkgs, ... }: {
      # Usage of determinate - avoid conflicts with self-nix of nix-darwin
      nix.enable = false;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        # _1password-cli
        # ansible
        # atuin
        # awscli
        # certbot
        # curl
        # lima
        # magic-wormhole
        # mas
        # neovim
        # nixd
        # tailscale
      ];

      networking.computerName = "onyx";

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      system.primaryUser = "${user}";
      # https://nix-darwin.github.io/nix-darwin/manual/
      system.defaults = {

        CustomUserPreferences = {
          # Disable siri
          "com.apple.Siri" = {
            "UAProfileCheckingStatus" = 0;
            "siriEnabled" = 0;
          };
          # Disable personalized ads
          "com.apple.AdLib" = {
            allowApplePersonalizedAdvertising = false;
          };
          "com.apple.desktopservices" = {
            # Avoid creating .DS_Store files on network or USB volumes
            DSDontWriteNetworkStores = true;
            DSDontWriteUSBStores = true;
          };
        };
      };

      # Needed for home-manager
      users.users.ned.home = "${userHome}";

      # The platform the configuration will be used on.
      nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config.allowUnfree = true;
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#onyx
    darwinConfigurations."onyx" = nix-darwin.lib.darwinSystem {
      # Pass those informations to the submodules
      specialArgs = { inherit user userHome dotfilesPath; };
      modules = [
        configuration
        # ./brew.nix
        mac-app-util.darwinModules.default
        home-manager.darwinModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit user userHome dotfilesPath; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [
            mac-app-util.homeManagerModules.default
          ];
          home-manager.users.${user} = import ./home.nix;
        }
      ];
    };
  };
}
