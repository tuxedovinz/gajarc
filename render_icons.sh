#!/bin/bash
# gajarc - Arc-Limon icons based iconset for Gajim
# (c) 2017 Vinzenz Vietzke <vinz@vinzv.de>
#
# Adapted from https://github.com/eti0/arc-limon-icon-theme/blob/master/src/render_icons.sh

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"
THEMEDIR="gajarc"
SRCDIR="src"
ICONSIZE=$(ls src/)

for SIZE in $ICONSIZE
do

	mkdir -p $THEMEDIR/$SIZE

	for FILENAME in $SRCDIR/$SIZE/*.svg
	do 
		$INKSCAPE --export-png=$FILENAME.png $FILENAME >/dev/null
		$OPTIPNG -o7 --quiet $FILENAME.png
		mv $FILENAME.png $THEMEDIR/$SIZE/
	done

	for FILENAME in $THEMEDIR/$SIZE/*.svg.png
	do
		mv "$FILENAME" "${FILENAME/.svg.png/.png}"
	done

done
