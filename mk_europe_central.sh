#!/bin/bash

cd $HOME/osm

./getplanet.sh
./getsea.sh

# Hier werden die einzelnen Karten erzeugt in der Form: 
# mkmymap.sh <Dateiname> "left=<x1> right=<x2> bottom=<y1> top=<y2>"

mkmymap.sh oseam_ng_europe_central "left=-8 right=25 bottom=38 top=61"
