
#________________________________________________________________________________________________________________________________________________.
#
#																CHANGE BY SOURAV																|
#
#-----------------------------------------------------------------------------------------------------------------------------------------------'



export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#################### History Related ############################

#Non-numeric values and nu‐meric values less than zero inhibit truncation
#The shell sets the default value to the value of HISTSIZE after reading any  startup files.
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTTIMEFORMAT="%d/%m/%y %T "
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=erasedups:ignoredups:ignorespace
export HISTFILE=~/.bash_ext_history
#immidiate appednd share all history from all seassion
#PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# history -n : Read  the  history  lines not already read from the
#history file into the current history list.   These
#are  lines  appended  to the history file since the
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
# append to the history file, don't overwrite it
shopt -s histappend
#store multiline commands in one history entry
shopt -s cmdhist

#################### End of History Related ############################




# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=""
    fi
fi

if [ "$color_prompt" = yes ]; then

    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\W\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\] "
	
else

    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\W\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\] "

fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir

case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\W\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\] "
		;;
	*)
		;;
esac

# make less more friendly for non-text input files, see lesspipe(1) install it
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Load our dotfiles.
for file in ~/.{aliases,aliases_private,exports,functions,functions_private}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Bash completion.
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi
fi

# dircolors.
if [ -x "$(command -v dircolors)" ] && [ -r ~/.dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
else
	eval "$(dircolors -b)"
fi



# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'





#--------------------------------------- TILIX -----------------------------------------------------

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#alacricity-color-scheme path
export cmModPoly=$HOME/.config/polybar/modules

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

