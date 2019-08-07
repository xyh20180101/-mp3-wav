chcp 65001
cd /d %~dp0

set filepath=%~dp1
set filename=%~n1
set samplerate=%2
set bitrate=%3

if %samplerate%==source goto s

ffmpeg -i "%filepath%%filename%.wav" -ar %samplerate% -ab %bitrate% -acodec libmp3lame -f mp3 "%filepath%%filename%.mp3"
goto end

:s
ffmpeg -i "%filepath%%filename%.wav" -ab %bitrate% -acodec libmp3lame -f mp3 "%filepath%%filename%.mp3"
goto end