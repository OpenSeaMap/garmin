#!/bin/bash

LOGFILE="${HOME}/mkoseam.log"
WORKDIR="${HOME}/osm/"
RUNFILE="${HOME}/mkoseam.run"

function logit()
{
	echo "`date` $1">>"${LOGFILE}"
}

function logerr()
{
	if [ -n "$1" ]; then
		logit "$1"
	fi
	exit 1
}

logit "Started."

if [ -e "$RUNFILE" ]; then
	logerr "Another instance is already running.\n If you are sure that not, delete ${RUNFILE}."
fi
touch "$RUNFILE"

cd "${WORKDIR}" || logerr "Homeswitch not possible."

logit "getplanet"
"${WORKDIR}/getplanet.sh"|tee -a "${LOGFILE}" || logerr "getplanet failed."

logit "getsea"
"${WORKDIR}/getsea.sh"|tee -a "${LOGFILE}" || logerr "getsea failed."

## Hier werden die einzelnen Karten erzeugt in der Form:
# "${WORKDIR}/mkmymap.sh <Dateiname> "left=<x1> right=<x2> bottom=<y1> top=<y2>"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"

"${WORKDIR}/mkmymap.sh" oseam_ng_europe_central "left=-8 right=25 bottom=38 top=61"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_europe_north "left=-12 right=31 bottom=47 top=67"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_europe_south "left=-33 right=45 bottom=26 top=53"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_arctic_european "left=-45 right=45 bottom=59 top=82"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_arctic_russian "left=45 right=180 bottom=66 top=82"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_northwest_passage_west "left=-180 right=-95 bottom=66 top=80"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_northwest_passage_east "left=-95 right=-45 bottom=50 top=80"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_north_sea "left=-06 right=15 bottom=48 top=72"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_baltic "left=08 right=31 bottom=53 top=66"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_atlantic_nw "left=-82 right=-45 bottom=31 top=65"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_atlantic_ne "left=-45 right=0 bottom=31 top=50"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_mediterranean "left=-06 right=37 bottom=30 top=46"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_carribean "left=-98 right=-50 bottom=05 top=31"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_atlantic_equatorial "left=-53 right=-14 bottom=-07 top=31"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_south_america_east_coast "left=-62 right=-05 bottom=-40 top=19"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_atlantic_south "left=-40 right=20 bottom=-68 top=07"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_pacific_nw "left=117 right=180 bottom=30 top=66"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_pacific_ne "left=-180 right=-120 bottom=47 top=66"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_us_west_coast "left=-180 right=112 bottom=30 top=49"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_pacific_nw_equatorial "left=130 right=180 bottom=0 top=30"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_pacific_ne_equatorial "left=180 right=-95 bottom=0 top=30"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_south_china_sea "left=99 right=130 bottom=0 top=30"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_indonesia "left=70 right=141 bottom=-22 top=08"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_south_america_southwest_coast "left=-120 right=-61 bottom=-60 top=02"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_pacific_south "left=180 right=-76 bottom=-70 top=10"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_tasman_sea "left=141 right=180 bottom=-70 top=0"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_australia_south "left=116 right=141 bottom=-65 top=-31"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_indian_ocean_north "left=42 right=99 bottom=0 top=26"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_indian_ocean_sw "left=20 right=90 bottom=-64 top=0"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_indian_ocean_se "left=90 right=116 bottom=-64 top=0"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_red_sea "left=32 right=42 bottom=13 top=32"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_black_sea "left=27 right=42 bottom=40 top=48"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_caspian_sea "left=45 right=55 bottom=36 top=48"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"
"${WORKDIR}/mkmymap.sh" oseam_ng_north_america_great_lakes "left=-93 right=-76 bottom=41 top=51"|tee -a "${LOGFILE}" || logerr "mkmymap 1 failed"


rm -f "$RUNFILE"

logit "Ended."

#EOF
