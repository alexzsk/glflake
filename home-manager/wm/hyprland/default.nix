{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    plugins = [
    ];
    extraConfig = ''
      #variables
      $mainMod = SUPER
      $terminal = foot
      $fileManager = thunar
      $menu = rofi -show drun

      #monitors
      monitor=eDP-1, 1920x1080@60, 0x0, 1
      monitor=HDMI-A-1, 2560x1440@60, 1920x0, 1

      #env variables
      env = XCURSOR_SIZE,24
      env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
      env = WLR_NO_HARDWARE_CURSORS,1

      #start programs
      exec-once = dbus-update-activation-environment --systemd --all
      exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = swww-daemon & swww img ~/walls/wallpaper.jpg
      exec-once = waybar
      exec-once = nm-applet
      exec-once = wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store & wl-paste --watch cliphist store
      exec-once = systemd
      exec-once = hypridle

      # nvidia
      source=./land/nvidialand.conf

      #opacity window rules
      #workspaces window rules
      #workspace rules
      workspace=10, monitor:HDMI-A-1, default:true

      #keybindings
      bind = $mainMod, RETURN, exec, $terminal
      bind = $mainMod, D, exec, $menu
      bind = $mainMod, T, exec, $fileManager
      bind = $mainMod, S, exec, grim -g "$(slurp)" - | wl-copy

      bind = $mainMod, Q, killactive
      bind = $mainMod, ESC, exit
      bind = $mainMod, V, togglefloating
      bind = $mainMod, F, fullscreen
      bind = $mainMod, P, pseudo, dwindle

      bind = $mainMod, H, movefocus, l
      bind = $mainMod, J, movefocus, d
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, L, movefocus, r
      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, J, movewindow, d
      bind = $mainMod SHIFT, K, movewindow, u
      bind = $mainMod SHIFT, L, movewindow, r
      bind = ALT, Tab, cyclenext
      bind = ALT, Tab, bringactivetotop

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      bind = $mainMod, X, togglespecialworkspace, magic
      bind = $mainMod, Z, togglespecialworkspace, scratch
      bind = $mainMod SHIFT, X, movetoworkspace, special:magic
      bind = $mainMod SHIFT, Z, movetoworkspace, special:scratch

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow


      input {
        kb_layout = us

        follow_mouse = 1
        sensitivity = 0
        accel_profile = false

        touchpad {
          natural_scroll = true
          middle_button_emulation = true
          clickfinger_behavior = true
        }
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 3
      }

      general {
        gaps_in = 15
        gaps_out = 15
        border_size = 0
        col.active_border = #ffffff;
        col.inactive_border = #fffff;
        layout = dwindle
        allow_tearing = true
      }

      decoration {
        rounding = 0
        blur {
          enabled = true
          size = 2
          passes = 3
          xray = true
          new_optimizations = true
        }
        drop_shadow = true
        shadow_range = 140
        shadow_render_power = 4
        shadow_offset = 10 15
        shadow_scale = 0.9
        col.shadow = rgba(1a1a1aaf)
      }

      animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
      }

      dwindle {
        pseudotile = true
        preserve_split = true
      }

        misc {
        force_default_wallpaper = -1
      }

    '';
  };
}
