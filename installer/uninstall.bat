echo off
echo -
echo -
echo -  This batch will uninstall map from Mapsource.
echo -
echo -  Press Enter to continue or Ctrl-C to abort.
echo -
pause

set KEY=HKLM\SOFTWARE\Wow6432Node\Garmin\MapSource
reg QUERY %KEY% 2>NUL >NUL
if not errorlevel 1 goto key_ok
set KEY=HKLM\SOFTWARE\Garmin\MapSource
:key_ok

reg DELETE %KEY%\Families\openseamap /f

pause
exit 0
