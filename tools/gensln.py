import subprocess
import globals

if(globals.is_windows()):
	subprocess.call(["cmd.exe", "/c", "premake\\premake5", "vs2022"])

if(globals.is_linux()):
	subprocess.call(["cmd.exe", "/c", "premake\\premake5.linux", "gmake2"])

if(globals.is_mac()):
	subprocess.call(["cmd.exe", "/c", "premake\\premake5.macosx", "gmake2"])
	subprocess.call(["cmd.exe", "/c", "premake\\premake5.macosx", "xcode4"])
