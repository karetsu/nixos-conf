# software choices
{ config, pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # basics
    bat
    binutils
    curl
    coreutils
    dfc
    direnv
    editorconfig-core-c
    jansson
    jq
    git
    gnupg
    imagemagick
    zsh
    zsh-autosuggestions
    zsh-command-time
    zsh-completions
    zlib
    p7zip
    unzip
    fd
    pass
    openssl
    ripgrep
    trash-cli
    shfmt
    cmake
    libtool
    bc

    # dev
    devenv
    emacs30-pgtk
    gcc
    gnumake
    clang
    vim
    ccls
    tidyp             # HTML code formatting
    stylelint         # CSS linter
    just

    # glitz
    kitty
    paper-icon-theme
    vanilla-dmz

    # haskell
    ghc
    cabal-install
    hlint
    haskell-language-server
    haskellPackages.fourmolu
    pandoc

    # lisps
    # clisp
    # sbcl

    # media
    # playerctl
    ffmpeg
    spotify

    # web office
    languagetool
    webcord-vencord
    firefox
    thunderbird
    texlive.combined.scheme-medium
    poppler
    groff
    ghostscript
    graphviz 
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))
  ];

  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
          xdg-desktop-portal-hyprland
      ];
  };

  programs = {
    zsh.enable = true;
    waybar.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  fonts = {
    enableGhostscriptFonts = true;
    packages = with pkgs; [ 
      font-awesome 
      source-sans-pro
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      noto-fonts-emoji
      noto-fonts-extra
      iosevka
      hasklig
      victor-mono
    ];

    fontconfig = {
      defaultFonts = {
        monospace =
          [ "JetBrains Mono" "Iosevka" "Hasklig" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Sans" ];
      };
    };
  };
}

