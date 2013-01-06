function discover_system_info() {
	#if mac source osx
	#if linux source linux
	source osx/find_version_osx.sh
}


function get_package_version() {
	package_name=${1};
	case "$package_name" in
		"gcc" | \
		"gpp" | \
		"gdb" | \
		"groovy" | \
		"grails" | \
		"gradle" | \
		"make" | \
		"maven" | \
		"python" | \
		"ruby" | \
		"svn" | \
		"git" | \
		"java" \
			) echo $("get_${package_name}_version") ;;
		*) echo "Not Installed" ;;
	esac
}
