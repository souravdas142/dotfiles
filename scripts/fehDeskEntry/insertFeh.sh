#!/bin/bash

# set feh.desktop to ~/.local/share/applications/

desktop-file-install --dir=$HOME/.local/share/applications $PWD/feh.desktop && \
update-desktop-database ~/.local/share/applications
