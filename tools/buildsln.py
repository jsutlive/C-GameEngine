import globals

import subprocess, sys
import os

ret = 0

if globals.is_windows():
	VS_BUILD_PATH = os.environ["VS_BUILD_PATH"][8:].replace("/", "\\")
	VS_BUILD_PATH = "\C:\\" + VS_BUILD_PATH
	print(VS_BUILD_PATH)

	ret = subprocess.call(["cmd.exe", "/c", VS_BUILD_PATH, "{}.sln".format(globals.ENGINE_NAME), "/property:Configuration={}".format(globals.CONFIG)])

if globals.is_linux():
	ret = subprocess.call(["make", "config={}".format(CONFIG)])

if globals.is_mac():
	ret = subprocess.call(["make", "config={}".format(CONFIG)])

sys.exit(ret)