function discover_system_info() {
	#if mac source osx
	#if linux source linux
	source osx/find_version_osx.sh
}


function get_package_version() {
	package_name=${1};
	case "$package_name" in
		'gcc') echo $(get_gcc_version);;
		*) echo "Not Installed"
	esac
}
