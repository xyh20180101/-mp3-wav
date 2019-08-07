cd /d %~dp0

::here change menu name
set menuName_ToMp3=To mp3
set menuName_ToWav=To wav

::choose your commonly used wavBitDepth,16/24/32
set wavBitDepth=16

set regRoot=HKEY_CLASSES_ROOT\*\shell\
set "regPath_ToMp3=%regRoot%%menuName_ToMp3%"
set "regPath_ToWav=%regRoot%%menuName_ToWav%"

reg add "%regPath_ToMp3%" /v SubCommands /t REG_SZ /f
reg add "%regPath_ToMp3%" /v AppliesTo /t REG_SZ /d .wav /f
	reg add "%regPath_ToMp3%\shell\44100Hz" /v SubCommands /t REG_SZ /f
		reg add "%regPath_ToMp3%\shell\44100Hz\shell\128kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" 44100 128k" /f
		reg add "%regPath_ToMp3%\shell\44100Hz\shell\192kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" 44100 192k" /f
		reg add "%regPath_ToMp3%\shell\44100Hz\shell\256kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" 44100 256k" /f
		reg add "%regPath_ToMp3%\shell\44100Hz\shell\320kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" 44100 320k" /f
	reg add "%regPath_ToMp3%\shell\48000Hz" /v SubCommands /t REG_SZ /f
		reg add "%regPath_ToMp3%\shell\48000Hz\shell\128kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" 48000 128k" /f
		reg add "%regPath_ToMp3%\shell\48000Hz\shell\192kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" 48000 192k" /f
		reg add "%regPath_ToMp3%\shell\48000Hz\shell\256kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" 48000 256k" /f
		reg add "%regPath_ToMp3%\shell\48000Hz\shell\320kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" 48000 320k" /f
	reg add "%regPath_ToMp3%\shell\Source sample rate" /v SubCommands /t REG_SZ /f
		reg add "%regPath_ToMp3%\shell\source sample rate\shell\128kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" source 128k" /f
		reg add "%regPath_ToMp3%\shell\source sample rate\shell\192kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" source 192k" /f
		reg add "%regPath_ToMp3%\shell\source sample rate\shell\256kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" source 256k" /f
		reg add "%regPath_ToMp3%\shell\source sample rate\shell\320kbps\command" /d "%cd%\convert_mp3.bat \"%%1\" source 320k" /f
reg add "%regPath_ToWav%" /v SubCommands /t REG_SZ /f
reg add "%regPath_ToWav%" /v AppliesTo /t REG_SZ /d .mp3 /f
	reg add "%regPath_ToWav%\shell\44100Hz\command" /d "%cd%\convert_wav.bat \"%%1\" 44100 %wavBitDepth%" /f
	reg add "%regPath_ToWav%\shell\48000Hz\command" /d "%cd%\convert_wav.bat \"%%1\" 48000 %wavBitDepth%" /f
	reg add "%regPath_ToWav%\shell\96000Hz\command" /d "%cd%\convert_wav.bat \"%%1\" 96000 %wavBitDepth%" /f
	reg add "%regPath_ToWav%\shell\Source sample rate\command" /d "%cd%\convert_wav.bat \"%%1\" source %wavBitDepth%" /f
pause