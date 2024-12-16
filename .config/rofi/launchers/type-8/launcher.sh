#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# style_1     style_2     style_3     style_4     style_5     style_6
# style_7     style_8     style_9     style_10    style_11    style_12

theme="style_1"
dir="$HOME/.config/rofi/launchers/type-8"

# dark
ALPHA="#00000000"
BG="#000000ff"
FG="#FFFFFFff"
SELECT="#101010ff"

# light
#ALPHA="#00000000"
#BG="#FFFFFFff"
#FG="#000000ff"
#SELECT="#f3f3f3ff"

# accent colors
#COLORS=('#EC7875' '#61C766' '#FDD835' '#42A5F5' '#BA68C8' '#4DD0E1' '#00B19F' \
		#'#FBC02D' '#E57C46' '#AC8476' '#6D8895' '#EC407A' '#B9C244' '#6C77BB')

COLORS=('#EC7875'  '#FDD835'  '#BA68C8' '#00B19F' \
		'#FBC02D' '#E57C46'   '#EC407A')

ACCENT="${COLORS[$(( $RANDOM % 7 ))]}ff"



# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF


has_args=$1
# comment these lines to disable random style
themes=( ribbon_top_round style_{1,5,7,9,11,12}.rasi )
size=${#themes[@]}
theme="${themes[$(( $RANDOM % ${size} ))]}"
if [[ ! -z $has_args ]];then
    theme="style_${has_args}"
fi
echo -e "\e[1;31m[Selecting]\e[0m \e[1;32mlauncher\e[0m \e[1;33mtype-8\e[0m \e[1;34m${theme}\e[0m"



rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
