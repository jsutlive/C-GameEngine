import subprocess, sys
import globals

ret = 0

if(globals.is_windows()):
	ret = subprocess.call(["cmd.exe", "/c", "premake\\premake5", "vs2022"])

if(globals.is_linux()):
	ret = subprocess.call(["premake/premake5.linux", "gmake2"])

if(globals.is_mac()):
	ret = subprocess.call(["premake/premake5.osx", "gmake2"])
	if(ret == 0):
		ret = subprocess.call(["premake/premake5.osx", "xcode4"])

sys.exit(ret)
