#!/bin/bash

#Top level script that prompts users to install things

#colors
source ./colors.sh

#load functions to get package versions
source ./find_versions.sh
source ./osx/find_version_osx.sh

discover_system_info
#environments supported
ENVIRONMENTS=(
	"g++"
	"gcc"
	"gdb"
	"groovy"
	"grails"
	"gradle"
	"make"
	"maven"
	"python"
	"ruby"
	"svn"
	"git"
	"java"
	"mysql"
#	"apache server"
#	"apache tomcat"
)

INSTALLED_STATUS=()
CHOICE_STATUS=()
function init() {
    local total=${#ENVIRONMENTS[@]}
    for ((ii=0 ; ii < total; ii++)); do
	    INSTALLED_STATUS+=(false)    
    done
    for ((ii=0 ; ii < total; ii++)); do
            CHOICE_STATUS+=(false)
    done
    
}

function print_environment_list() {
    clear
    echo_colorn $MAGENTA "(Package #) "
    echo -n "choose a package to be installed, "
    echo_colorn $MAGENTA "(Q)uit, "
    echo_color $MAGENTA "(S)tart Installation"
    printf "$(color $CYAN '%-5s %-25s %-5s %-20s\n')" "#" "Package" "Y/N" "Current Version"

    count=1;
    for i in "${ENVIRONMENTS[@]}"; do
	if [ "$i" == "g++" ] ; then
		i="gpp"
	fi
        printf "$(color $MAGENTA '%-5s') $(color $YELLOW '%-25s') " "${count}) " "$i"       
        if ${CHOICE_STATUS[((count-1))]}; then
            printf "$(color $GREEN '%-5s') " "[x]"
        else
    	    printf "$(color $RED '%-5s') " "[ ]"
        fi
	
	var=$(eval "echo \${${i}_version}")
	if [ -z "$var" ] ; then 
	        version=$(get_package_version "$i")
		eval "${i}_version='$version'"
    else
		version=$var
	fi
	if [ "$version" != "Not Installed" ] ; then
	    printf "$(color $GREEN '%-20s') \n" "$version"
	else
	    printf "$(color $RED '%-20s') \n" "Not Installed"
	fi	
        ((count++))
	done
}

#Prompt

echo_bold "Welcome to the environment installer!"
echo "Please select what development tools and environments to install"

init
INSTALLED_STATUS[2]=true
CHOICE_STATUS[3]=true
print_environment_list

doInstall=false

#Have the user select what packages to install
while read choice
do
   if [[ $choice == q* ]] || [[ $choice == Q* ]]; then
        break
   fi
   if [[ $choice == s* ]] || [[ $choice = S* ]]; then
        doInstall=true
        break
   fi
   if [[ "$choice" =~ ^[0-9]+$ ]] ; then        
        current=${CHOICE_STATUS[(($choice-1))]}
        if $current; then
           CHOICE_STATUS[(($choice-1))]=false
        else
           CHOICE_STATUS[(($choice-1))]=true
        fi          
    fi
   print_environment_list
done 

#do the actual installation of packages
if $doInstall; then
    echo "Installing selected packages"
fi
