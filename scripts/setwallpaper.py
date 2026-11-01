#!/usr/bin/env python3
"""
setwall - sett samme bakgrunn i Hyprland, hyprlock og (valgfritt) SDDM.

Bruk:
    setwall bilde.jpg            # sett et bestemt bilde
    setwall ~/Bilder/wallpapers  # tilfeldig bilde fra mappe
    setwall --sddm bilde.jpg     # også innloggingsskjermen (krever sudo)
"""
import argparse
import random
import shutil
import subprocess
import sys
from pathlib import Path

# ---------- Innstillinger ----------
BACKEND = "hyprpaper"          # "hyprpaper" eller "swww"
LINK = Path.home() / ".cache/current_wallpaper"
COLOR_TOOL = "matugen"         # "matugen", "wallust" eller None
SDDM_THEME_DIR = Path("/usr/share/sddm/themes/DITT-TEMA")  # endre!
IMAGE_EXTS = {".jpg", ".jpeg", ".png", ".webp"}
# -----------------------------------


def run(cmd: list[str]) -> None:
    """Kjør en kommando, men ikke krasj hvis den feiler."""
    try:
        subprocess.run(cmd, check=True)
    except FileNotFoundError:
        print(f"Fant ikke programmet: {cmd[0]}", file=sys.stderr)
    except subprocess.CalledProcessError as e:
        print(f"Feilet: {' '.join(cmd)} (kode {e.returncode})", file=sys.stderr)


def pick_image(path: Path) -> Path:
    """Returner bildet, eller et tilfeldig bilde hvis path er en mappe."""
    if path.is_dir():
        images = [p for p in path.iterdir() if p.suffix.lower() in IMAGE_EXTS]
        if not images:
            sys.exit(f"Ingen bilder i {path}")
        return random.choice(images)
    if not path.is_file():
        sys.exit(f"Finner ikke {path}")
    return path


def update_link(wp: Path) -> None:
    LINK.parent.mkdir(parents=True, exist_ok=True)
    LINK.unlink(missing_ok=True)
    LINK.symlink_to(wp)


def set_desktop(wp: Path) -> None:
    if BACKEND == "hyprpaper":
        # Nyere hyprpaper-versjoner kan ha annen syntaks, se Hyprland-wikien
        run(["hyprctl", "hyprpaper", "reload", f",{wp}"])
    elif BACKEND == "swww":
        run(["swww", "img", str(wp), "--transition-type", "grow"])


def set_colors(wp: Path) -> None:
    if COLOR_TOOL == "matugen" and shutil.which("matugen"):
        run(["matugen", "image", str(wp)])
    elif COLOR_TOOL == "wallust" and shutil.which("wallust"):
        run(["wallust", "run", str(wp)])


def set_sddm(wp: Path) -> None:
    target = SDDM_THEME_DIR / f"background{wp.suffix}"
    run(["sudo", "cp", str(wp), str(target)])
    # Husk å sette Background=background.jpg (e.l.) i temaets theme.conf


def main() -> None:
    parser = argparse.ArgumentParser(description="Sett bakgrunn overalt")
    parser.add_argument("path", type=Path, help="bilde eller mappe")
    parser.add_argument("--sddm", action="store_true", help="oppdater også SDDM")
    parser.add_argument("--no-colors", action="store_true", help="hopp over fargetema")
    args = parser.parse_args()

    wp = pick_image(args.path.expanduser().resolve())

    update_link(wp)      # hyprlock leser denne neste gang den starter
    set_desktop(wp)
    if not args.no_colors:
        set_colors(wp)
    if args.sddm:
        set_sddm(wp)

    run(["notify-send", "Bakgrunn byttet", wp.name])
    print(f"Satt bakgrunn: {wp}")


if __name__ == "__main__":
    main()
