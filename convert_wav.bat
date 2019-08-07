chcp 65001
cd /d %~dp0

set filepath=%~dp1
set filename=%~n1
set samplerate=%2
set bitdepth=%3

if %samplerate%==source goto s

ffmpeg -i "%filepath%%filename%.mp3" -ar %samplerate% -acodec pcm_s%bitdepth%le -f wav "%filepath%%filename%.wav"
goto end

:s
ffmpeg -i "%filepath%%filename%.mp3" -acodec pcm_s%bitdepth%le -f wav "%filepath%%filename%.wav"
goto end