#!/bin/bash

#Top level script that prompts users to install things

#colors
source ./colors.sh

#environments supported

ENVIRONMENTS=(
	"g++/gcc"
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
	"apache server"
	"apache tomcat"
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
    count=1;
    for i in "${ENVIRONMENTS[@]}"; do
#        printf "%-5s %5s\n" $(color $MAGENTA "${count}) ") $(color $YELLOW "$i")
        printf "$(color $MAGENTA '%-5s') $(color $YELLOW '%-25s') " "${count}) " "$i"       
        if ${CHOICE_STATUS[((count-1))]}; then
	    printf "$(color $GREEN '%-5s') " "[x]"
        else
	    printf "$(color $RED '%-5s') " "[ ]"
        fi

	if ${INSTALLED_STATUS[((count-1))]}; then
	    printf "$(color $GREEN '%-20s') \n" "Current Version:"
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
printf "$(color $CYAN '%-5s %-25s %-5s %-20s\n')" "#" "Package" "Y/N" "Current Version"

print_environment_list

