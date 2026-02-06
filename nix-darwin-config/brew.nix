# brew.nix
{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = false;
    onActivation.upgrade = true;

    # GUIs
    casks = [
      "1password"
      "acorn"
      "affinity"
      "atuin-desktop"
      "colour-contrast-analyser"
      "dbngin"
      "figma"
      "firefox"
      "ghostty"
      "gpg-suite"
      "hammerspoon"
      "helium-browser"
      "herd"
      "jordanbaird-ice"
      "kaleidoscope"
      "localsend"
      "logi-options+"
      "microsoft-teams"
      "moom"
      "obsidian"
      "orbstack"
      "polypane"
      "prince"
      "ray"
      "tableplus"
      "tailscale-app"
      "tower"
      "transmit"
      "vscodium"
      "zed"
      "zoom"
      "zulip"
    ];

    # Mac App Store apps
    masApps = {
      "1Password for Safari" = 1569813296;
      "Folder Quick Look" = 6753110395;
      "GitNotifier" = 1494640093;
      "JSON Peep" = 1458969831;
      "Microsoft Excel" = 462058435;
      "Microsoft Outlook" = 985367838;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
      "One Thing" = 1604176982;
      "OneDrive" = 823766827;
      "Pages" = 409201541;
      "Pure Paste" = 1611378436;
      "Refined GitHub" = 1519867270;
      "S3" = 6447647340;
      "ToothFairy" = 1191449274;
      "Velja" = 1607635845;
    };
  };
}
