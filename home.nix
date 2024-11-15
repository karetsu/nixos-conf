{ config, pkgs, ... }:

let colours = import ./themes/horizon.nix;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "g";
  home.homeDirectory = "/home/g";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    pkgs.bash-language-server
    pkgs.hyprlandPlugins.hyprexpo

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/aloysius/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "emacs";
    BROWSER = "firefox";
    LC_CTYPE = "en_GB.UTF-8";
    PAGER = "less";
    TERM = "kgx";
  };
  home.keyboard.layout = "uk";
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ"; 

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    size = 14;
  };

  services = {
    #-- Gnome keyring -----------------------------------------------------------
    gnome-keyring.enable = true;


    #-- EMACS -------------------------------------------------------------------
    emacs = {
      enable = true;
      startWithUserSession = "graphical";
      socketActivation.enable = true;
    };

    #-- Dunst -------------------------------------------------------------------
    dunst = {
      enable = true;

      iconTheme = {
        name = "Paper";
        package = pkgs.paper-icon-theme;
      };

      settings = {
        global = {
          font = "Rounded Mplus 1c 12";
          markup = "full";
          format =
            "<b><span foreground='${colours.base11}'>%a</span></b>\\n<b>%s</b>\\n<span style='font-style=italic;'>%b</span>";
          sort = "yes";
          indicate_hidden = "yes";
          alignment = "left";
          bounce_freq = 5;
          show_age_threshold = 60;
          word_wrap = "no";
          ignore_newline = "no";
          geometry = "600x6+2060+72";
          transparency = 0;
          idle_threshold = 120;
          sticky_history = "yes";
          icon_position = "left";
          max_icon_size = 24;
          line_height = 8;
          separator_height = 2;
          padding = 24;
          horizontal_padding = 24;
          separator_color = "frame";
          startup_notification = false;
          show_indicators = "yes";
          frame_width = 0;
          corner_radius = 2;

          shadow-exclude = [
            "name = 'Notification'"
            "class_g ?= 'Dunst'"
            # disable shadows for hidden windows:
            "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
            #  "_GTK_FRAME_EXTENTS@:c",
            # disables shadows on sticky windows:
            "_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
          ];
        };

        shortcuts = {
          close = "ctrl+space";
          close_all = "ctrl+shift+space";
          history = "ctrl+grave";
          context = "ctrl+shift+period";
        };

        urgency_low = {
          background = colours.base00; # bg-alt;
          foreground = colours.basefg;
          frame_color = colours.basebg;
          timeout = 4;
        };

        urgency_normal = {
          background = colours.base00; # bg-alt;
          foreground = colours.basefg;
          frame_color = colours.basebg;
          timeout = 6;
        };

        urgency_critical = {
          background = colours.base00; # bg;
          foreground = colours.basefg;
          frame_color = colours.base11;
          timeout = 0;
          frame_width = 1;
        };
      };
    };
  };


  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    emacs = {
      enable = true;
      extraPackages = epkgs: [ epkgs.vterm epkgs.shfmt epkgs.djvu ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    firefox = { enable = true; };
  };

  # Enable XDG integration
  xdg.enable = true;
}
