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
    emacs
    gcc
    gnumake
    clang
    vim
    ccls
    tidyp             # HTML code formatting
    stylelint         # CSS linter
    just

    # glitz
    font-awesome
    source-code-pro
    material-icons
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
    discord-canary
    firefox
    texlive.combined.scheme-medium
    poppler
    groff
    ghostscript
    graphviz 
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))
  ];

  programs = {
    zsh.enable = true;
    waybar.enable = true;
    hyprland.enable = true;
  };

  fonts = {
    enableGhostscriptFonts = true;
    packages = with pkgs; [ 
      mononoki 
      font-awesome 
      hasklig 
      fira-code 
      fira-code-symbols 
      agave
      roboto
    ];

    fontconfig = {
      defaultFonts = {
        monospace =
          [ "hasklig" "Iosevka Nerd Font" "Font Awesome" "Material Icons" ];
        sansSerif = [ "Mplus" ];
        serif = [ "Mplus" ];
      };
    };
  };
}

