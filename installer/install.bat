@echo off
echo .
echo .
echo . This batch will install the map for Mapsource
echo .
echo .
echo . Press any key to accept the license or Ctrl-C to abort.
echo .
echo .
type openseamap_license.txt
echo .
echo .

pause

set KEY=HKLM\SOFTWARE\Garmin\MapSource
reg QUERY %KEY% 2>NUL >NUL
if not errorlevel 1 goto key_ok
set KEY=HKLM\SOFTWARE\Wow6432Node\Garmin\MapSource
reg QUERY %KEY% 2>NUL >NUL
if not errorlevel 1 goto key_ok
REM Mapsource not installed?
reg QUERY HKLM\SOFTWARE\Wow6432Node 2>NUL >NUL
if not errorlevel 1 goto key_ok
set KEY=HKLM\SOFTWARE\Garmin\MapSource
:key_ok

reg ADD %KEY%\Families\openseamap /v ID /t REG_BINARY /d 6022 /f
reg ADD %KEY%\Families\openseamap\1 /v Loc /t REG_SZ /d "%~dp0\" /f
reg ADD %KEY%\Families\openseamap\1 /v Bmap /t REG_SZ /d "%~dp0openseamap.img" /f
reg ADD %KEY%\Families\openseamap\1 /v Tdb /t REG_SZ /d "%~dp0openseamap.tdb" /f

pause
exit 0
