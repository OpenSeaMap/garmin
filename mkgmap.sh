#!/bin/bash

cd img

java -XX:+UseCompressedOops -Xmx6500m -enableassertions -jar ../mkgmap/mkgmap.jar -c ../mkgmap_settings -c ../tiles/template.args 2>../err2.txt

for i in $( ls *.img ); do
	echo $i
	java -ea -jar ../gmarine/gmarine.jar $i
done

cd ..
