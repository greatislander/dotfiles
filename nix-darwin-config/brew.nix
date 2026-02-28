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
      "dot"
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
      "gramps"
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
      "lapce"
      "localsend"
      "logi-options+"
      "maestral"
      "menuwhere"
      "microsoft-excel"
      "microsoft-outlook"
      "microsoft-teams"
      "microsoft-word"
      "moom"
      "mullvad-vpn"
      "netnewswire"
      "nova"
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
      "One Thing" = 1604176982;
      "Pages" = 409201541;
      "Pure Paste" = 1611378436;
      "Refined GitHub" = 1519867270;
      "S3" = 6447647340;
      "ToothFairy" = 1191449274;
      "Velja" = 1607635845;
    };
  };
}
