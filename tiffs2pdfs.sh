#!/bin/bash

# This is a simple script to search a directory for TIFF images and convert them to PDF.
# It relies on find, tiff2pdf, and egrep to work its magic.
# Files ending in '.tiff' or '.tif' (in any case) are supported.
# Found this script here: http://www.neowin.net/forum/topic/1143030-need-helping-making-tiff2pdf-command-recursive/

tiffs=$(find '.' -type f -regextype 'posix-egrep' -iregex '.*\.tif[f]{0,1}')

for tiff in $tiffs; do

        echo $tiff | grep -qsiE '\.tif$'

        if [ $? -eq 0 ]; then
                extension_length=3
        else

                extension_length=4
        fi

        pdf="${tiff:0:$((${#tiff}-$extension_length))}pdf"

        echo "tiff2pdf -o \"$pdf\" \"$tiff\""

        tiff2pdf -o "$pdf" "$tiff"
done

exit 0

