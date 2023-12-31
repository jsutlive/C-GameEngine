import subprocess, sys, os
import globals

config = "Debug"
exepath = "{}/bin/{}/{}/".format(os.getcwd(), config, globals.PROJECT_NAME, globals.PROJECT_NAME)
ret = 0

if globals.is_windows():
	ret = subprocess.call(["cmd.exe", "/c", "{}\\run.bat".format(globals.TOOLS_DIR), config, globals.PROJECT_NAME], cwd=os.getcwd())

else: 
	ret = subprocess.call(["{}{}".format(exepath, globals.PROJECT_NAME)], cwd=exepath)

sys.exit(ret)