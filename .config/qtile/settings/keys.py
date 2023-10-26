# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod1"  # mod4

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Flip layout for monadtall/monadwide
    ([mod, "shift"], "f", lazy.layout.flip()),

    # Change window sizes
    ([mod, "control"], "j", lazy.layout.shrink()),
    ([mod, "control"], "k", lazy.layout.grow()),

    # Toggle floating
    ([mod, "shift"], "space", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    ([mod, "shift"], "l", lazy.layout.shuffle_right()),
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),
    ([mod], "f", lazy.window.toggle_fullscreen()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "x", lazy.shutdown()),

    ([mod], "q", lazy.spawn("archlinux-logout")),

    # ------------ App Configs ------------

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("brave")),

    # File Explorer
    ([mod], "e", lazy.spawn("thunar")),

    # Terminal
    ([mod], "Return", lazy.spawn("alacritty")),

    # Redshift
    ([mod], "r", lazy.spawn("redshift -O 3000")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    ([], "Print", lazy.spawn("scrot")),
    ([mod], "Print", lazy.spawn("scrot -s")),

    # ------------ Hardware Configs ------------

    # Audio
    # Controled by xfce4-volumed-pulse
 #   ([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
 #   ([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),
 #   ([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
    ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    ([], "XF86AudioStop", lazy.spawn("playerctl stop")),
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]
