import globals

import subprocess
import os

if globals.is_windows():
	VS_BUILD_PATH = os.environ["VS_BUILD_PATH"][8:].replace("/", "\\")
	VS_BUILD_PATH = "\C:\\" + VS_BUILD_PATH
	print(VS_BUILD_PATH)

	subprocess.call(["cmd.exe", "/c", VS_BUILD_PATH, "{}.sln".format(globals.ENGINE_NAME), "/property:Configuration={}".format(globals.CONFIG)])