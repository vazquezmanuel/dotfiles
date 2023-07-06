from libqtile import widget
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark", fontsize=37, padding=0):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-cod-triangle_left
        fontsize=fontsize,
        padding=padding
    )


def workspaces(icon_fontsize=19, window_name_font_size=14): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=icon_fontsize,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=window_name_font_size, padding=5),
        separator(),
    ]


def primary_widgets():
    return [
        *workspaces(),

        separator(),

        powerline('color4', 'dark'),

        icon(bg="color4", text=' '), # Icon: nf-fa-download

        widget.CheckUpdates(
            background=colors['color4'],
            colour_have_updates=colors['text'],
            colour_no_updates=colors['text'],
            no_update_string='0',
            display_format='{updates}',
            update_interval=1800,
            custom_command='checkupdates',
        ),

        powerline('color3', 'color4'),


        icon(bg="color3", text=' '),  # Icon: nf-fa-feed

        widget.Net(**base(bg='color3'),
                interface='wlp2s0'),

        powerline('color2', 'color3'),

        widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

        widget.CurrentLayout(**base(bg='color2')),

        powerline('color1', 'color2'),

        icon(bg="color1", text='󰃰 '), # Icon: nf-md-calendar_clock

        widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

        powerline('dark', 'color1'),

        widget.Systray(background=colors['dark']),
        
        widget.PulseVolume(
            **base(bg='dark', fg='light'),
            fmt="󰕾 {}", # Icon: nf-md-volume-high
            update_interval=0.1,
            volume_app="pavucontrol",
            step=5,
            padding=5
            ),

        widget.Battery(
            **base(bg='dark', fg='light'),
            format="{char}{percent:1.0%}",
            charge_char="󰢝 ", # Icon: nf-md-battery_charging_50
            discharge_char="󰁾 ", # Icon: nf-md-battery_50
            empty_char="󱃍 ", # Icon: nf-md-battery_alert_variant_outline
            full_char="󰁹 ", # Icon: nf-md-battery
            unknown_char="󰂑 ", # Icon: nf-md-battery_unknown
            low_foreground=colors['urgent'],
            low_percentage=0.15,
            show_short_text=False,
            notify_below=15,
            padding=5,
            ),
    ]


def secondary_widgets():
    return [
        *workspaces(),

        separator(),

        powerline('color1', 'dark'),

        widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

        widget.CurrentLayout(**base(bg='color1'), padding=5),

        powerline('color2', 'color1'),

        icon(bg="color2", text=' '), # Icon: nf-mdi-calendar_clock

        widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %H:%M '),

        powerline('dark', 'color2'),
    ]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
