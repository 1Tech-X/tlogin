import time
import os
import os.path
from getpass import getpass
os.system("clear")
def banner():
	print("\033[91m   ____________________________________\033[0m")
	print("")
	print("\033[92m     Ragister your username & password \033[0m")
	print("\033[91m   ____________________________________\033[0m")
	print("")
	print("")
banner()
if not os.path.exists("/data/data/com.termux/files/usr/lib/user.txt"):
	user=str(input("\033[96mSet Your Username :- \033[0m"))
	print("")
	password=getpass("\033[96mSet Your Password :- \033[0m")
	f=open("/data/data/com.termux/files/usr/lib/user.txt","w")
	f.write(f"{user}\n")
	f.write(password)
	f.close()
	print("")
	print("")
	print("\033[1;34m[\033[1;92m+\033[1;34m]creating...........")
	time.sleep(1)
	print("\033[1;34m[\033[1;92m+\033[1;34m]\033[1;91mCreated Successfully.......")
	print("")
	print("\033[1;34m[\033[1;92mNOTE\033[1;34m]\033[1;91mIF YOU WANT TO RESET YOUR Username & Password\nUSE PYTHON SCRIPT\033[1;34m[\033[1;92mreset.py\033[1;34m]\033[1;91mTO RESET\033[0m")

else:
    os.system("clear")
    print("")
    print("")
    print("\033[92m    Username & Password already exists\033[0m")
    print("\033[96m<--------------------------------------------->\033[0m")
    print("")
