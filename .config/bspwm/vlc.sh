#! /bin/sh

# This script has dependecies on :
# xtitle (AUR : xtitle-git)

wid=$1
class=$2
instance=$3

if [ "$instance" = vlc ] ; then
    title=$(xtitle "$wid")
    case "$title" in
        vlc)
            echo "layer=above border=off"
            ;;
    esac
fi
