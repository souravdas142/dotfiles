#!/usr/bin/env bash

###############################################################################
# Interactive Tmux Theme Switcher
# Path: ~/.config/tmux/change-theme.sh
###############################################################################

# Set strict mode (exit on error, unset variable access)
set -euo pipefail

# Configurations
CONFIG_DIR="$HOME/.config/tmux"
TARGET_SYMLINK="$CONFIG_DIR/tmux.conf"

# Map menu options to actual files
declare -A THEMES=(
    ["Catppuccin"]="$CONFIG_DIR/tmux.conf.catppuccin-tmux"
    ["Tmux-Powerkit"]="$CONFIG_DIR/tmux.conf.tmux-powerkit"
)

# Colors for terminal output
BOLD="\033[1m"
GREEN="\033[32m"
CYAN="\033[36m"
RED="\033[31m"
RESET="\033[0m"

# Helper function to apply the theme symlink & reload tmux
apply_theme() {
    local theme_name="$1"
    local config_file="${THEMES[$theme_name]}"

    if [[ ! -f "$config_file" ]]; then
        echo -e "${RED}Error: Config file not found at: $config_file${RESET}"
        exit 1
    fi

    # Create/overwrite the ~/.tmux.conf symlink
    ln -sfn "$config_file" "$TARGET_SYMLINK"
    echo -e "${GREEN}✔ Symlink updated:${RESET} $TARGET_SYMLINK -> $config_file"

    # Live reload running tmux server (if active)
    if [ -n "${TMUX:-}" ] || pgrep -u "$USER" tmux >/dev/null 2>&1; then
        tmux source-file "$TARGET_SYMLINK" 2>/dev/null && \
            echo -e "${GREEN}✔ Live reloaded active Tmux session!${RESET}" || true
    fi
}

# -----------------------------------------------------------------------------
# Main Selection Logic
# -----------------------------------------------------------------------------

# Option A: Use FZF if installed (Interactive Fuzzy Finder)
if command -v fzf >/dev/null 2>&1; then
    SELECTED_THEME=$(printf "%s\n" "${!THEMES[@]}" | fzf \
        --height="30%" \
        --border="rounded" \
        --prompt="Select Tmux Theme > " \
        --header="Use ARROWS to move, ENTER to select")

    if [[ -z "$SELECTED_THEME" ]]; then
        echo -e "${RED}Selection cancelled.${RESET}"
        exit 0
    fi

    apply_theme "$SELECTED_THEME"
    exit 0
fi

# Option B: Fallback to standard numbered CLI menu
echo -e "${CYAN}${BOLD}=== Tmux Theme Switcher ===${RESET}"
echo "1) Catppuccin"
echo "2) Tmux-Powerkit"
echo "q) Quit"
echo "---------------------------"
read -rp "Select an option [1-2]: " choice

case "$choice" in
    1)
        apply_theme "Catppuccin"
        ;;
    2)
        apply_theme "Tmux-Powerkit"
        ;;
    [qQ])
        echo "Exiting."
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid option selected.${RESET}"
        exit 1
        ;;
esac
