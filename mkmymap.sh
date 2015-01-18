#!/bin/bash

cd $HOME/osm

#./getplanet.sh
#./getsea.sh

rm tiles/*
rm img/*.img

read="planet/planet-latest.osm.pbf"
write="planet/bbox.osm.pbf omitmetadata=true"

zipname=$1
bbox=$2

# Europe Central:
#zipname=oseam_ng_europe_central
#bbox="left=-8 right=25 bottom=38 top=61"

JAVACMD_OPTIONS="-Djava.io.tmpdir=$HOME/tmp -Xmx6G"
osmosis/bin/osmosis --read-pbf $read --tee 1 outPipe.0=a --bounding-box inPipe.0=a completeWays=yes $bbox --write-pbf $write

./splitter.sh

./mkgmap.sh

cd img
zip $HOME/osm/maps/$zipname.zip gmapsupp.img
rm gmapsupp.img
mkdir openseamap
mv * openseamap
cp ../installer/* openseamap
zip $HOME/osm/maps/"$zipname"_ms.zip openseamap/*
rm openseamap/*
rmdir openseamap
cd ..

ncftpput -u ftp -p rheinskipper1000@gmx.de ftp5.gwdg.de /pub/incoming maps/$zipname.zip
ncftpput -u ftp -p rheinskipper1000@gmx.de ftp5.gwdg.de /pub/incoming maps/"$zipname"_ms.zip
