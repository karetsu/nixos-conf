# user configuration
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      g = {
        isNormalUser = true;
        description = "Gareth";
        createHome = true;
        home = "/home/g";
        extraGroups = [ "wheel" "audio" "transmission" "plex" "dialout" ];
        packages = with pkgs; [
          # generic
          libvterm
          xorg.xwininfo # for emacs everywhere
          wordnet
          pamixer
          killall
          starship

          # glitz
          cliphist
          hypridle
          hyprlock
          hyprpicker
          hyprnotify
          hyprshot
          hyprsunset
          hyprpolkitagent
          grimblast
          hyprkeys
          hyprland-protocols
          bemenu
          eww
          fortune
          wmctrl
          wl-clipboard-rs
          swappy
          plasma5Packages.qt5ct
          wireplumber
          swww
          playerctl
          xdg-desktop-portal-hyprland
          remind

          # haskell packages
          haskellPackages.stylish-haskell
          haskellPackages.pandoc
          haskellPackages.hoogle
          ghcid
          treefmt

          # LSPs and linters
          shellcheck
          irony-server

          # maths libraries
          arpack
          gnuplot
          openblas
 
          # media
          blanket
          
          # office
          typst
          typst-fmt
          typst-live
          typst-lsp   
          whatsapp-for-linux
          pom
          gnome-pomodoro

          # networking
          varia

          # emacs everywhere
          xdotool
          xclip
        ];
        shell = pkgs.zsh;
        uid = 1000;
      };
    };
  };
}
