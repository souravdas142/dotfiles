#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#https://wiki.archlinux.org/index.php/Activating_numlock_on_bootup

if [ -x /usr/bin/numlockx ]; then
      /usr/bin/numlockx on
fi

if systemctl -q is-active graphical.target &&  [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
