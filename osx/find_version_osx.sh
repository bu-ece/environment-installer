function get_gcc_version() {
	echo $(gcc --version |grep "GCC" | sed -e "s_.*(GCC) \([0-9\.]*\).*_\1_g")
}

function get_g++_version() {
	echo $(gcc --version |grep "GCC" | sed -e "s_.*(GCC) \([0-9\.]*\).*_\1_g")
}

function get_groovy_version() {
	echo $(groovy --version |grep Version | sed "s_Groovy Version: \([0-9\.]*\).*_\1_g")
}

function get_grails_version() {
	echo $(grails --version |grep version | sed "s_Grails version: \([0-9\.]*\).*_\1_g")
}

function get_gradle_version()  {
	echo $(gradle --version | grep -e "Gradle [0-9]" |sed "s_Gradle \([0-9\.]*\)_\1_g")
}
