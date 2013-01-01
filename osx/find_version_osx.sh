function get_gcc_version() {
	echo $(gcc --version |grep "GCC" | sed -e "s_.*(GCC) \([0-9\.]*\).*_\1_g")
}
