## Current Theme

appletConfigDir="$HOME/.config/rofi/applets"

#type="$HOME/.config/rofi/applets/type-4"
#style='style-2.rasi'


has_args=$1
has_child_args=$2

types=( type-{1..5} )
size=${#types[@]}
type_t="${types[$(( $RANDOM % ${size} ))]}"

if [[ ! -z $has_args ]];then
    type_t="type-${has_args}"
fi

styles=( $(ls ${appletConfigDir}/${type_t}/) )
style_size=${#styles[@]}
style_t="${styles[$(( $RANDOM % ${style_size} ))]}"

if [[ ! -z $has_child_args ]];then
    style_t="style-${has_child_args}"
fi

echo -e "\e[1;31m[Selecting]\e[0m \e[1;32mapplet theme\e[0m \e[1;33m${type_t} ${style_t}\e[0m"

type=${appletConfigDir}/${type_t}
style=${style_t}

#${launchdir}/${type_t}/launcher.sh ${has_child_args}
