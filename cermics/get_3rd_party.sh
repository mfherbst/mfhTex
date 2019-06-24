#!/bin/sh -e

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

if [ -L "logoENPC.pdf" ]; then
	rm logoIWR.pdf
	get "http://www.enpc.fr/sites/all/themes/enpc/images/logo.svg" logoENPC.svg
	# convert logoENPC.svg to logoENPC.pdf
fi

#https://inria.fr/extension/site_inria/design/site_inria/images/logos/logo_INRIA_FR.svg


# http://sorbonne-universite.fr/themes/sorbonne/logo.svg
