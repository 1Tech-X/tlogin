#!/bin/bash
# colors

green='\033[1;92m'
red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
reset='\033[0m'

echo "${red}[-]${blue}Removing Lock.....${reset}\n"
sleep 1
    sed -i 's/cd tlogin ; python login.py//g' $PREFIX/etc/bash.bashrc
    sed -i 's/cd tlogin ; python eslogin.py//g' $PREFIX/etc/bash.bashrc
    sed -i 's/cd \/data\/data\/com.termux\/files\/home//g' $PREFIX/etc/bash.bashrc
    echo "${green}[+]${blue}Lock Removed....${reset}\n"

deluser () {
if [ -e $PREFIX/lib/user.txt ]; then
echo "${red}[-]${blue}Removing user.....${reset}\n"
rm $PREFIX/lib/user.txt
sleep 1
echo "${green}[+]${blue}User Removed.....${reset}\n"

else

echo "${red}[!]${green}UserAlready Removed.....${reset}\n"
fi

}

delbackup () {
if [ -e /sdcard/user.txt ]; then
  echo "${red}[-]${blue}Removing Backup file.....${reset}\n"
  rm /sdcard/user.txt
  sleep 1
  echo "${green}[+]${blue}Backup file Removed.....${reset}\n"
else
   echo "${red}[!]${green}Backup file not exist.....${reset}\n"
fi
}

deluser
delbackup
echo "${green}[#]${yellow}Thanks for using tlogin....${reset}\n"
echo ""
echo "${green}[#]${red}Run tlogin.sh to set lock again....${reset}\n"

