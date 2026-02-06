{ config, pkgs, dotfilesPath, user, userHome, ... }: {

  home.stateVersion = "25.11";
  home.homeDirectory = "${userHome}";

  # Packages to install
  home.packages = with pkgs; [
    # Developer - install zsh in another scope
    ansible-lint
    atuin
    direnv
    dnscontrol
    gh
    git
    lazydocker
    lazygit
    mise
    php84Packages.composer
    pure-prompt
    python315
    trash-cli
    typst
    hurl
    uv
    yq
    zoxide
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    completionInit = "autoload -U compinit && compinit";

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "macos" "rsync" "mise" "docker"];
    };

    shellAliases = {
      artisan = "php artisan";
      gh-merge-review = "function _gh_merge_review() { gh pr merge --auto -sd \"$1\" && gh pr review --approve \"$1\"; }; _gh_merge_review";
      listnodemodules = "find . -type d -name 'node_modules' -prune -mtime +30 | xargs du -sh | gsort -rh | head -20";
      nixswitch = "sudo -i darwin-rebuild switch";
      nixclean = "nix-collect-garbage -d";
      prunenodemodules = "find . -type d -name 'node_modules' -prune -mtime +30 | xargs du -sh | gsort -rh | head -20 | cut -c 6- | xargs rm -r";
      sed = "gsed";
    };

    initContent = ''
      if [ -f "$HOME/.zprofile" ]; then
        source "$HOME/.zprofile"
      fi
    '';
  };

  # Symlink to my development folder
  # xdg.configFile = {
  #   "alacritty".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/config/alacritty";
  #   "nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/config/nvim";
  #   "zellij".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/config/zellij";
  # };

  home.file = {
    # ssh
    # ".ssh/".source = config.lib.file.mkOutOfStoreSymlink "${userHome}/System/sshkeys";
    # pgp
    # ".gnupg/".source = config.lib.file.mkOutOfStoreSymlink "${userHome}/System/gnupgkeys";
    ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/dot/dot_gitconfig";
    # configuration
    # ".config/.gtc_comm".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/dot/dot_gtc_comm";
    # ".config/.gtc_func".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/dot/dot_gtc_func";
    # ".config/.gtc_prog".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/dot/dot_gtc_prog";
    # ".config/.gtc_tool".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/dot/dot_gtc_tool";
    # ".zprofile".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/dot/dot_zprofile";
    # vscode
    "Library/Application Support/VSCodium/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/config/vscode/settings.json";
  };
}
