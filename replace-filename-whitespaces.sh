#!/bin/bash
# Just replaces whitespaces of all filenames with underscores.

for file in *; do mv "$file" `echo $file | tr ' ' '_'` ; done
