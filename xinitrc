#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

isWM=0
cmn_progs(){
	[[ -e ~/.fehbg ]] && sh ~/.fehbg &

}

chsWm(){
	cmn_progs
	local session=${1:-i3}

	case $session in
	
	    i3|i3wm)
		   	exec i3
			;;
	    bspwm)
		   	exec bspwm
			;;
		dwm)
		   	exec dwm
			;; 
		awesome) 
			exec awesome
			;;
		openbox)
		   	exec openbox
			;;
		spectrwm)
		   	exec spectrwm
			;;
		xmonad) 
			exec xmonad
			;;
	    # No known session, try to run it as command
	    *)
			exec $1
			;;
	
	esac
	unset session
}

chsDE(){
	local session=${1:-xfce}
	case $session in

	    xfce|xfce4)
		   	exec startxfce4
			;;
		kde)
			exec startplasma-x11
			;;
		gnome)
			export XDG_SESSION_TYPE=x11
			export GDK_BACKEND=x11
			exec gnome-session
			;;
		lxde)
			exec startlxde
			;;
	    # No known session, try to run it as command
	    *)
			exec $1
		;;
	
	esac
	unset session
}



# starting 
[[ "$isWM" == "0" ]] && chsWm $1 || chsDE $1

