#!/bin/bash

# ReVanced Builder Script by Sourav
# Supports: release (-r), devel (-d), offline (-o), custom (-c)
# CLI 5.0.0+ compatible (no deprecated --options)

# --------------------------
# Additional Usage:
#
# Generate all patch options for a package:
# java -jar revanced-cli.jar list-patches --with-packages --filter-package-name=com.google.android.youtube --with-versions --with-options patches.rvp
#
# Example Custom Patch Command:
# java -jar revanced-cli.jar patch -e "Change package name" -O change-package-name.packageName="app.revanced.android.youtube.alt"
#
# --------------------------


appName="YouTube ReVanced Alt"
iconPath="./rvxicons/red"
packageName="app.revanced.android.youtube.alt"
version="$(\cat ./version)"
YouTube_original_name="youtube_${version}.apk"
ver="v${version}"
revanced_name="ReVancedYT-${ver}-$(date "+%Y_%m_%d_%H_%M").apk"

# Print usage
function usage() {
    echo -e "Usage: $0 [option]\n"
    echo -e "Options:"
    echo -e "\t-r\tRelease build"
    echo -e "\t-d\tDevelopment build"
    echo -e "\t-o\tOffline build"
    echo -e "\t-c\tCustom patch options\n"
    exit 1
}

# Get latest release patch and CLI URLs
function release_dl() {
    patches_url=$(curl -s https://api.github.com/repos/revanced/revanced-patches/releases/latest | jq -r '.assets[] | select(.name | endswith("rvp")) | .browser_download_url')
    patches_name=$(basename "$patches_url")

    cli_url=$(curl -s https://api.github.com/repos/revanced/revanced-cli/releases/latest | jq -r '.assets[] | select(.name | endswith("jar")) | .browser_download_url')
    cli_name=$(basename "$cli_url")

    urls=("$patches_url" "$cli_url")
}

# Get latest devel patch and CLI URLs
function devel_dl() {
    patches_url=$(curl -s https://api.github.com/repos/revanced/revanced-patches/releases | jq -r 'map(select(.prerelease)) | first | .assets[] | select(.name | endswith("rvp")) | .browser_download_url')
    patches_name=$(basename "$patches_url")

    cli_url=$(curl -s https://api.github.com/repos/revanced/revanced-cli/releases | jq -r 'map(select(.prerelease)) | first | .assets[] | select(.name | endswith("jar")) | .browser_download_url')
    cli_name=$(basename "$cli_url")

    urls=("$patches_url" "$cli_url")
}

# Select local patch and CLI from offline files
function offline_dl() {
    patches_name_devel=$(ls revanced-patches*dev* 2>/dev/null)
    cli_name_devel=$(ls revanced-cli*dev* 2>/dev/null)
    patches_name_release=$(ls revanced-patches* 2>/dev/null | grep -v dev)
    cli_name_release=$(ls revanced-cli* 2>/dev/null | grep -v dev)

    if [[ -n "$patches_name_devel" && -n "$patches_name_release" ]]; then
        read -p "Both devel and release available. Choose one [r,d]: " input
        if [[ "$input" == "r" ]]; then
            patches_name=$patches_name_release
            cli_name=$cli_name_release
        elif [[ "$input" == "d" ]]; then
            patches_name=$patches_name_devel
            cli_name=$cli_name_devel
        else
            echo "Didn't understand input." && exit 1
        fi
    elif [[ -n "$patches_name_devel" ]]; then
        patches_name=$patches_name_devel
        cli_name=$cli_name_devel
    elif [[ -n "$patches_name_release" ]]; then
        patches_name=$patches_name_release
        cli_name=$cli_name_release
    else
        echo -e "No patches found offline.\n" && exit 1
    fi

    [[ ! -e "${YouTube_original_name}" ]] && echo "Missing original YouTube APK." && exit 1
}

# Download patches and CLI
function download_all() {
    case "$1" in
        -d)
            echo "Development build selected."
            devel_dl
            for url in "${urls[@]}"; do curl -LJO "$url"; done ;;
        -r)
            echo "Release build selected."
            release_dl
            for url in "${urls[@]}"; do curl -LJO "$url"; done ;;
        -o)
            echo "Offline build selected."
            offline_dl ;;
        *)
            usage ;;
    esac
}

# Define standard patch includes
include_patch=(
    -e "Custom branding"
    -e "Remove player controls background"
    -e "Change header"
    -e "Enable slide to seek"
    -e "Change package name"
    -e "Predictive back gesture"
)

# Optional excludes
# exclude_patch=(
#     -d "Alternative thumbnails"
#     -d "Always repeat"
# )
exclude_patch=()

# Custom patch includes with CLI options
include_patch_with_custom=(
    -e "Custom branding"
    -O appName="YouTube ReVanced Alt"
    -O iconPath="./rvxicons/red"
    -e "Remove player controls background"
    -e "Change header"
    -e "Enable slide to seek"
    -e "Change package name"
    -O packageName="app.revanced.android.youtube.alt"
    -e "Predictive back gesture"
)

# Construct the final patch command dynamically
function build_patch_args() {
    local -n includes=$1
    local -n excludes=$2
    cmd_args=()

    cmd_args+=(java -jar "$cli_name" patch)
    cmd_args+=(--patches "$patches_name")
    cmd_args+=("${includes[@]}")
    cmd_args+=("${excludes[@]}")
    cmd_args+=(--out "$revanced_name")
    cmd_args+=(--keystore "./prev_key.keystore")
    cmd_args+=(--keystore-entry-alias=alias)
    cmd_args+=(--keystore-entry-password=ReVanced)
    cmd_args+=(--keystore-password=ReVanced)
    cmd_args+=("${YouTube_original_name}")
}

# Main logic
download_all "$1"

# Determine patching style
if [[ "$2" == "-c" ]]; then
    build_patch_args include_patch_with_custom exclude_patch
else
    build_patch_args include_patch exclude_patch
fi

# Log and execute final patching command
#echo -e "\nExecuting:\n${cmd_args[@]}\n"
echo -e "\n"
printf "%q " "${cmd_args[@]}"
"${cmd_args[@]}"

