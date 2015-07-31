#!/bin/bash

RSSDIR=$HOME/Library/Mail/RSS
OUT=$HOME/RSS.txt

find $RSSDIR -name Info.plist -exec cat {} \; | \
grep "<string>http" | \
sed 's/\<string\>\(.*\)\<\/string\>/\1/' > $OUT
