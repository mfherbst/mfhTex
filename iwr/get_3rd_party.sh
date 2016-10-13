#!/bin/sh -e
# Get 3rd party logos and data

# Base url to get the stuff from
BASE="https://www.iwr.uni-heidelberg.de/fileadmin/IWR/Templates"

get() {
	if which wget 2> /dev/null 1>&2; then
		wget  "$1" -O "$2"
		return $?
	elif which curl 2> /dev/null 1>&2; then
		curl "$1" -o "$2"
		return $?
	fi
	return 1
}

if [ -L "logoIWR.pdf" ]; then
	rm logoIWR.pdf
	get "$BASE/logo_iwr.pdf" "logoIWR.pdf"
fi

if [ -L "logoUniHD.pdf" ]; then
	rm "logoUniHD.pdf"
	get "$BASE/logo_uni-hd_4c.eps" "/tmp/logoUniHD.eps"
	epstopdf "/tmp/logoUniHD.eps"
	mv "/tmp/logoUniHD.pdf"  .
fi
