import os, sys
import subprocess

TOOLS_DIR = "tools"

def run_command(cmd):
	ret = 0
	script = "{}/{}/{}.py".format(os.getcwd(), TOOLS_DIR, cmd)
	if(os.path.exists(script)):
		print("Executing ", cmd)
		ret = subprocess.call(["python3", script])
	else:
		print("Invalid command: ", cmd)
		ret = -1

for i in range(1, len(sys.argv)):
	cmd = sys.argv[i]
	print("\n----------------------------------------")

	if run_command(cmd)!= 0:
		break