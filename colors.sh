BLACK="\033[1;30m"
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
PINK="\033[0;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
GREY="\033[0;37m"
END="\033[0m"

echo_bold () {
  message=${1}
  echo -e "\033[1m${message}\033[0m"
}

echo_color() {
  color=${1}
  message=${2}
  echo -e "${color}${message}$END"
}

echo_colorn() {
  color=${1}
  message=${2}
  echo -en "${color}${message}$END"
}

function color() {
  color=${1}
  message=${2}
  echo -en "${color}${message}$END"
}
