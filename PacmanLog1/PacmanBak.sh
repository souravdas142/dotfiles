#!/bin/bash

echo "Backing up pacman.log..."
cp -v /var/log/pacman.log* ./ && echo "BAckup Completed" || echo "Error"
echo "Backing up pacman Database..."
ls /var/lib/pacman/local/ > pacmanDb && echo "BAckup Completed" || echo "Error"

pacman -Qq > AllPkgList
pacman -Qqe > AllPkgListExpli
pacman -Qqm > AllPkgsWthOpnUpgradeOrAUR
pacman -Qqn > AllPkgsWthOutAur
pacman -Qqt > AllPkgsWthOpnT
pacman -Qqtt > AllPkgsWthOpnTT


