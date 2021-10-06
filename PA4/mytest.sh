#!/usr/bin/tcsh

echo `ls temperature* | cut -c1-11 | xargs expr -1 +`