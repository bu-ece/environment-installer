function get_gcc_version() {
	echo $(gcc --version |grep "GCC" | sed -e "s_.*(GCC) \([0-9\.]*\).*_\1_g")
}

function get_gpp_version() {
	echo $(g++ --version |grep "GCC" | sed -e "s_.*(GCC) \([0-9\.]*\).*_\1_g")
}

function get_gdb_version() {
	echo $(gdb --version |grep gdb | sed "s_[^0-9]*\([0-9\.-]*\).*_\1_g")
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

function get_make_version() {
	echo $(make --version |grep Make |sed "s_[^0-9]\([0-9\.]*\)_\1_g")
}	

function get_maven_version() {
	echo $(mvn --version |grep "Apache Maven" |sed "s_Apache Maven \([0-9\.]*\).*_\1_g")
}

function get_python_version() {
	echo $(python --version 2>&1 |grep Python | sed -E "s:Python ([0-9\._]+):\1:g")
}

function get_ruby_version() {
	echo $(ruby --version | grep ruby |sed "s_ruby \([0-9\.]*\).*_\1_g")
}

function get_svn_version() {
	echo $(svn --version | grep -E "version [0-9\.]+" | sed -E "s_.*version ([0-9\.]+).*_\1_g")
}

function get_git_version() {
	echo $(git --version | grep version | sed -E "s_.+version ([0-9\.]+).*_\1_g")
}

function get_java_version() {
	echo $(java -version 2>&1 |grep version | sed -E 's_.*version "([0-9\._]+)"_\1_g')
}

function get_mysql_version(){
	echo $(mysql --version |sed -E "s:.*Distrib ([0-9\._]+).*:\1:g")
}
