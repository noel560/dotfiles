import os

PROPS_PATH = os.path.expanduser("~/.cache/wal/colors.properties")
OUTPUT_PATH = os.path.expanduser("~/.config/wlogout/style.css")

def load_colors(path):
    colors = {}
    with open(path, "r") as f:
        for line in f:
            if "=" in line:
                k, v = line.strip().split("=")
                colors[k] = v
    return colors

def rgba(hex_color, alpha):
    """Convert #RRGGBB + alpha(0-1 float) to CSS rgba(...)"""
    hex_color = hex_color.lstrip("#")
    r = int(hex_color[0:2], 16)
    g = int(hex_color[2:4], 16)
    b = int(hex_color[4:6], 16)
    return f"rgba({r}, {g}, {b}, {alpha})"

colors = load_colors(PROPS_PATH)

background = colors["background"]
foreground = colors["foreground"]
border = colors["color8"]
btn_bg = colors["color0"]
btn_hover = colors["color2"]
btn_active = colors["color4"]

template = f"""
window {{
  font-family: JetBrainsMono Nerd Font;
  font-size: 14pt;
  color: {foreground};
  background-color: {rgba(background, 0.75)};
}}

button {{
  background-repeat: no-repeat;
  background-position: center;
  background-size: 100px;
  border: 2px solid {border};
  border-radius: 25px;
  background-color: {btn_bg};
  margin: 2.5px;
  color: {foreground};
}}

button:hover {{
  border: 2px solid {border};
  background-color: {btn_hover};
  color: {foreground};
}}

button:active {{
  border: 2px solid {border};
  background-color: {btn_active};
  color: {foreground};
}}

button:focus {{
  border: 2px solid {border};
  background-color: {btn_hover};
  color: {foreground};
}}

#lock {{
  background-image: image(url("./lock.png"));
}}

#logout {{
  background-image: image(url("./logout.png"));
}}

#suspend {{
  background-image: image(url("./sleep.png"));
}}

#shutdown {{
  background-image: image(url("./power.png"));
}}

#reboot {{
  background-image: image(url("./restart.png"));
}}

#hibernate {{
  background-image: image(url("./restart.png"));
}}
"""

os.makedirs(os.path.dirname(OUTPUT_PATH), exist_ok=True)

with open(OUTPUT_PATH, "w") as f:
    f.write(template)

print("Generated wlogout theme:", OUTPUT_PATH)
