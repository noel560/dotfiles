import os

PROPS_PATH = os.path.expanduser("~/.cache/wal/colors.properties")
OUTPUT_PATH = os.path.expanduser("~/.local/share/rofi/themes/spotlight-dark.rasi")

# Load wal colors
def load_colors(path):
    colors = {}
    with open(path, "r") as f:
        for line in f:
            if "=" in line:
                key, val = line.strip().split("=")
                colors[key] = val
    return colors

def add_alpha(hex_color, alpha):
    """Add alpha to a hex color. hex_color must be #RRGGBB."""
    hex_color = hex_color.strip()
    if len(hex_color) == 7:
        return hex_color + alpha
    return hex_color  # fallback

colors = load_colors(PROPS_PATH)

background = colors.get("background", "#000000")
foreground = colors.get("foreground", "#ffffff")
color4 = colors.get("color4", "#555555")
color8 = colors.get("color8", "#777777")
color15 = colors.get("color15", "#ffffff")

# Generate your variables
bg0 = add_alpha(background, "E6")
bg1 = add_alpha(color8, "80")
bg2 = add_alpha(color4, "E6")

fg0 = foreground
fg1 = color15
fg2 = add_alpha(foreground, "80")

# TEMPLATE with placeholders
template = f"""
* {{
    font:   "CaskaydiaMono Nerd Font 12";

    bg0:    {bg0};
    bg1:    {bg1};
    bg2:    {bg2};

    fg0:    {fg0};
    fg1:    {fg1};
    fg2:    {fg2};

    background-color:   transparent;
    text-color:         @fg0;

    margin:     0;
    padding:    0;
    spacing:    0;
}}

window {{
    background-color:   @bg0;

    location:       center;
    width:          640;
    border-radius:  8;
}}

inputbar {{
    font:       "CaskaydiaMono Nerd Font 20";
    padding:    12px;
    spacing:    12px;
    children:   [ icon-search, entry ];
}}

icon-search {{
    expand:     false;
    filename:   "/usr/share/icons/Papirus-Dark/24x24/actions/search.svg";
    size: 28px;
}}

icon-search, entry, element-icon, element-text {{
    vertical-align: 0.5;
}}

entry {{
    font:   inherit;

    placeholder         : "Search";
    placeholder-color   : @fg2;
}}

message {{
    border:             2px 0 0;
    border-color:       @bg1;
    background-color:   @bg1;
}}

textbox {{
    padding:    8px 24px;
}}

listview {{
    lines:      10;
    columns:    1;

    fixed-height:   false;
    border:         1px 0 0;
    border-color:   @bg1;
}}

element {{
    padding:            8px 16px;
    spacing:            16px;
    background-color:   transparent;
}}

element normal active {{
    text-color: @bg2;
}}

element alternate active {{
    text-color: @bg2;
}}

element selected normal, element selected active {{
    background-color:   @bg2;
    text-color:         @fg1;
}}

element-icon {{
    size:   1em;
}}

element-text {{
    text-color: inherit;
}}
"""

# Ensure directory exists
os.makedirs(os.path.dirname(OUTPUT_PATH), exist_ok=True)

# Write output theme
with open(OUTPUT_PATH, "w") as f:
    f.write(template)

print("Generated rofi theme:", OUTPUT_PATH)
