BEGIN {
	while ((getline < "readfile.awk") > 0) {
		print $0
	}
}
