set menuName_ToMp3=To mp3
set menuName_ToWav=To wav

set regRoot=HKEY_CLASSES_ROOT\*\shell\
set "regPath_ToMp3=%regRoot%%menuName_ToMp3%"
set "regPath_ToWav=%regRoot%%menuName_ToWav%"

reg delete "%regPath_ToMp3%" /f
reg delete "%regPath_ToWav%" /f
pause