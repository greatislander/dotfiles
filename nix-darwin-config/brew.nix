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
      "actual"
      "atuin-desktop"
      "arq"
      "audio-hijack"
      "base"
      "cardhop"
      "colour-contrast-analyser"
      "dbngin"
      "discord"
      "epic-games"
      "fantastical"
      "fastmail"
      "figma"
      "firefox"
      "fission"
      "foks"
      "font-cormorant"
      "font-hack-nerd-font"
      "font-iosevka"
      "font-meslo-lg-nerd-font"
      "font-sf-pro"
      "font-zed-mono"
      "fontforge-app"
      "ghostty"
      "gitup-app"
      "google-chrome"
      "gpg-suite"
      "hammerspoon"
      "handbrake-app"
      "hazel"
      "helium-browser"
      "herd"
      "iina"
      "imageoptim"
      "imazing"
      "jordanbaird-ice"
      "kaleidoscope"
      "localsend"
      "logi-options+"
      "maestral"
      "menuwhere"
      "microsoft-teams"
      "moom"
      "mullvad-vpn"
      "netnewswire"
      "obsidian"
      "orbstack"
      "orion"
      "polypane"
      "ray"
      "resilio-sync"
      "retrobatch"
      "selfcontrol"
      "signal"
      "soundsource"
      "steam"
      "swiftbar"
      "tableplus"
      "tailscale-app"
      "transmission"
      "transmit"
      "utm"
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
