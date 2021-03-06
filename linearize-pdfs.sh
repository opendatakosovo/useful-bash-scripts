#!/bin/bash
# Compresses all PDFs in current directory.
# Outputs compressed PDFs to a 'output' directory.
# Uses qpdf --linearize

pdfs=$(find '.' -type f -regextype 'posix-egrep' -iregex '.*\.pdf')

for pdf in $pdfs; do

        echo "qpdf --linearize \"$pdf\" \"output/$pdf\""

        qpdf --linearize "$pdf" "output/$pdf"
done

exit 0
