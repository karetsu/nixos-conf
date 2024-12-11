# user configuration
{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      g = {
        isNormalUser = true;
        description = "G";
        createHome = true;
        home = "/home/g";
        extraGroups = [ "wheel" "audio" "transmission" "plex" "dialout" ];
        packages = with pkgs; [
          # generic
          libvterm
          pamixer
          killall
          starship
          eza
          socat

          # glitz
          cliphist
          pyprland
          hypridle
          hyprlock
          hyprpicker
          hyprnotify
          hyprshot
          hyprsunset
          hyprpolkitagent
          grimblast
          hyprland-protocols
          hyprpolkitagent
          bemenu
          eww
          wmctrl
          wl-clipboard-rs
          wlogout
          swappy
          wireplumber
          swww
          playerctl
          xdg-desktop-portal-hyprland
          nwg-drawer
          nwg-look
          nwg-wrapper

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
        ];
        shell = pkgs.zsh;
        uid = 1000;
      };
    };
  };
}
