import os

PROPS_PATH = os.path.expanduser("~/.cache/wal/colors.properties")
OUTPUT_PATH = os.path.expanduser("~/.config/btop/themes/wal.theme")

TEMPLATE = """
theme[main_bg]="{background}"
theme[main_fg]="{foreground}"
theme[title]="{foreground}"
theme[hi_fg]="{color1}"
theme[selected_bg]="{color3}"
theme[selected_fg]="{foreground}"
theme[inactive_fg]="#44475a"
theme[graph_text]="{foreground}"
theme[meter_bg]="#44475a"
theme[proc_misc]="{color6}"
theme[cpu_box]="{color6}"
theme[mem_box]="{color6}"
theme[net_box]="{color6}"
theme[proc_box]="{color6}"
theme[div_line]="#44475a"

theme[temp_start]="{color3}"
theme[temp_mid]="{color4}"
theme[temp_end]="{color5}"

theme[cpu_start]="{color3}"
theme[cpu_mid]="{color4}"
theme[cpu_end]="{color5}"

theme[free_start]="{color3}"
theme[free_mid]="{color4}"
theme[free_end]="{color5}"

theme[cached_start]="{color3}"
theme[cached_mid]="{color4}"
theme[cached_end]="{color5}"

theme[available_start]="{color3}"
theme[available_mid]="{color4}"
theme[available_end]="{color5}"

theme[used_start]="{color3}"
theme[used_mid]="{color4}"
theme[used_end]="{color5}"

theme[download_start]="{color3}"
theme[download_mid]="{color4}"
theme[download_end]="{color5}"

theme[upload_start]="{color3}"
theme[upload_mid]="{color4}"
theme[upload_end]="{color5}"

theme[process_start]="{color3}"
theme[process_mid]="{color4}"
theme[process_end]="{color5}"
""".strip()


def load_properties(path):
    props = {}
    with open(path, "r") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            key, value = line.split("=", 1)
            props[key.strip()] = value.strip()
    return props


def main():
    if not os.path.exists(PROPS_PATH):
        print("Couldnt find properties file")
        return

    props = load_properties(PROPS_PATH)

    needed = [
        "background", "foreground", "cursor",
        *(f"color{i}" for i in range(16))
    ]
    missing = [k for k in needed if k not in props]
    if missing:
        print("Missing keys:", missing)
        return

    theme = TEMPLATE.format(**props)

    os.makedirs(os.path.dirname(OUTPUT_PATH), exist_ok=True)
    with open(OUTPUT_PATH, "w") as f:
        f.write(theme)

    print("All done", OUTPUT_PATH)


if __name__ == "__main__":
    main()
