import subprocess, os
import globals

config = "Debug"
exepath = "{}/bin/{}/{}/".format(os.getcwd(), config, globals.PROJECT_NAME, globals.PROJECT_NAME)
print(exepath)

if globals.is_windows():
	subprocess.call(["cmd.exe", "/c", "{}\\run.bat".format(globals.TOOLS_DIR), config, globals.PROJECT_NAME], cwd=os.getcwd())
