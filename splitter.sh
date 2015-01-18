#!/bin/bash

# java -XX:+UseCompressedOops -Xmx6500M -jar splitter/splitter.jar --max-nodes=1500000 --mixed=yes --no-trim --keep-complete --precomp-sea=sea --overlap=0 --resolution=16 --geonames-file=cities15000.zip --description=INT-Offshore --output=xml --output-dir=tiles planet/bbox.osm.pbf 2>err1.txt
java -XX:+UseCompressedOops -Xmx6500M -jar splitter/splitter.jar --max-nodes=2000000 --no-trim --precomp-sea=sea.zip --overlap=0 --geonames-file=cities15000.zip --description=INT-Offshore --output-dir=tiles planet/bbox.osm.pbf 2>err1.txt


# for %%i in (tiles\*.osm.gz) do (
# gzip\bin\gzip -d %%i

# gzip\bin\gzip tiles\%%~ni
# )
