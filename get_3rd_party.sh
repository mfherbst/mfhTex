#!/bin/sh -e

for script in */get_3rd_party.sh; do
	if [ -x "$script" ]; then
		cd "`dirname "$script"`"
		./get_3rd_party.sh
	fi
done
