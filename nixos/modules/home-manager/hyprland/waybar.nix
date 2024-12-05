{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        height = 34;
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        battery = {
          format = "{capacity}% {icon}";
          format-alt = "{time} {icon}";
          format-charging = "{capacity}% 🗲";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          format-plugged = "{capacity}% ";
          states = {
            critical = 15;
            warning = 30;
          };
        };
        "battery#bat2" = {
          bat = "BAT2";
        };
        clock = {
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        "custom/notification" = {
          escape = true;
          exec = "swaync-client -swb";
          exec-if = "which swaync-client";
          format = "{} {icon}";
          format-icons = {
            dnd-inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span> ";
            dnd-none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span> ";
            inhibited-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span> ";
            none = "";
            notification = "<span foreground='red'><sup></sup></span> ";
          };
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          return-type = "json";
          tooltip = false;
        };
        "custom/updates" = {
          exec = "waybar-module-pacman-updates --interval-seconds 5 --network-interval-seconds 300 --tooltip-align-columns 'Source Code Pro'";
          exec-if = "which waybar-module-pacman-updates";
          format = "{} {icon}";
          format-icons = {
            has-updates = "󱍷";
            updated = "󰂪";
          };
          return-type = "json";
        };
        "hyprland/language" = {
          format = "{}";
          max-length = 18;
        };
        "hyprland/window" = {
          max-length = 50;
          separate-outputs = true;
        };
        "hyprland/workspaces" = {
          disable-scroll = true;
          format = "{name}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            default = "";
            focused = "";
            urgent = "";
          };
          on-click = "activate";
          on-scroll-down = "hyprctl dispatch workspace m+1 > /dev/null";
          on-scroll-up = "hyprctl dispatch workspace m-1 > /dev/null";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        keyboard-state = {
          capslock = false;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
          numlock = false;
        };
        layer = "top";
        memory = {
          format = "{}% ";
        };
        modules-center = [ "hyprland/window" ];
        modules-left = [
          "hyprland/workspaces"
          "idle_inhibitor"
          "pulseaudio"
          "backlight"
          "network"
          "custom/updates"
        ];
        modules-right = [
          "hyprland/submap"
          "hyprland/language"
          "cpu"
          "memory"
          "temperature"
          "battery"
          "tray"
          "clock"
        ];
        mpd = {
          consume-icons = {
            on = " ";
          };
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          interval = 2;
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
          unknown-tag = "N/A";
        };
        network = {
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          format-disconnected = "Disconnected ⚠";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-linked = "{ifname} (No IP) ";
          format-wifi = "{essid} ";
          interface = "wlan0";
          tooltip-format = "{ifname} via {gwaddr} ";
        };
        position = "top";
        pulseaudio = {
          format = "{volume}%{icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-icons = {
            car = "";
            default = [
              ""
              ""
              ""
            ];
            hands-free = "";
            headphone = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
        spacing = 4;
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        "sway/scratchpad" = {
          format = "{icon} {count}";
          format-icons = [
            ""
            ""
          ];
          show-empty = false;
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };
        tray = {
          spacing = 0;
        };
      };
    };

    style = ''
      ${builtins.readFile ./waybar.css}
    '';

  };
}
