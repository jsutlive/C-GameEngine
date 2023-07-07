ENGINE_NAME = "newton"
PROJECT_NAME = "newtoneditor"

CONFIG = "debug"
TOOLS_DIR = "tools"

V_MAJOR = 1
V_MINOR = 0

import sys, platform
PLATFORM = sys.platform

for x in platform.uname():
	if "microsoft" in x.lower():
		PLATFORM = "windows"
		break

def is_windows():
	return PLATFORM == "windows"

def is_linux():
	return PLATFORM == "linux"

def is_mac():
	return PLATFORM == "mac"