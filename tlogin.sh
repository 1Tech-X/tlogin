#!/bin/bash
#created by tech-x
#www.mrtechx.com
red='\033[1;91m'
green='\033[1;92m'
blue='\033[1;34m'
yellow='\033[1;33m'
cyan='\033[1;96m'
reset='\033[0m'

#choice var
c=""
ch=""
choice=""
#Backup path
BACKUP="${HOME}/storage/shared/user.txt"

line () {
	printf "${cyan}<----------------------------------------------->${reset}\n"
}

echo "${green}____________________________________________________"
echo "${red}"
echo  " ████████╗██╗      ██████╗  ██████╗ ██╗███╗   ██╗ "
echo  " ╚══██╔══╝██║     ██╔═══██╗██╔════╝ ██║████╗  ██║ "
echo  "    ██║   ██║     ██║   ██║██║  ███╗██║██╔██╗ ██║ "
echo  "    ██║   ██║     ██║   ██║██║   ██║██║██║╚██╗██║ "
echo  "    ██║   ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║ "
echo  "    ╚═╝   ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝ "
echo "${reset}"
echo  "${green}_____________________${cyan}1.0v${green}__________________________"
echo  "${yellow}               Created by TECH-X "
echo  "                  www.mrtechx.com  "
echo  "${reset}"
# Chechking Reqyuirents

chechreq () {

	for i in python espeak; do
		  if [ -e ${PREFIX}/bin/$i ]; then
		  	printf "${green} \n$i is Already installed\n ${reset}"
		  else
		  	printf "${blue} [*]Installing ${i}....${reset}"
		  	apt install -y $i || {
		  		printf "${red}"
                                echo ""
		  		echo "ERROR: Check your internet connection"
		  		printf "$reset"
		  		exit 1
		  	}
		  fi
	done
}

#Create user name and password
create () {
	printf "${green}[-]${blue}Create Your Username and Password${reset}\n"
	sleep 1
	python ragister.py
}

#create backup file for username and password

backup () {

if [ -e ${BACKUP} ]; then
                echo ""
		printf "${green}     Backup is Already Created${reset}\n"
		line
else		

echo ""
printf "${yellow}Do you want to create backup for username and password into your internal storage?${reset}\n"
printf "${green}[y]${blue}-For create Backup${reset}\n"
echo ""
printf "${red}[n]${blue}-For Not create Backup${reset}\n"
echo ""
printf "${blue}Enter:-${reset}"
    read c
	if [ "${c}" = "y" ]; then
		printf "${green}[+]${blue}creating backup in your internal storage${reset}\n"
		cp $PREFIX/lib/user.txt /sdcard  || {
			printf "${red}Permission denied[!] ${yellow}allow the storage Permission${reset}\n"
			printf "${green}Execute command ${yellow}termux-setup-storage${reset}\n"
                        printf "${red}Not "
                }
         echo ""
         printf "${red}Successfully Created${reset}\n"
         echo ""

        elif [ "${c}" = "n" ]; then
                echo ""
        	printf "${red}[!]${green}Backup not created${reset}\n"
        	printf ""
        

       else
        echo ""
    	printf "${red}[!] ${yellow}Wrong Input${reset}\n"
    	exit 1
    fi
fi    
}

#Set lock in termux
setlock () {
        echo ""
 	printf "${yellow}Do you want to SetLock..?${reset}\n"
        echo ""
 	printf "${green}[y]${blue}For Set lock${reset}\n"
 	printf ""
 	echo ""
 	printf "${red}[n]${blue}For exit${reset}\n"
 	echo ""
 	printf "${blue}Enter:-${reset}"
 	read ch
 	printf ""
 	if [ "${ch}" = "y" ]; then

 	echo "cd tlogin ; python login.py" >> $PREFIX/etc/bash.bashrc
        echo "cd $HOME" >> $PREFIX/etc/bash.bashrc
        echo ""
 	printf "${cyan}Defalut lock is set...${reset}\n"
 	    elif [ "${ch}" = "n" ]; then
 			exit 1
 	else
 		printf "${red}[!]${yellow} Wrong Input ${reset}\n"
 		exit 1
      
    fi

 }

 #chose lock type

 locktype () {
        echo ""
 	printf "${yellow}Chose lock type${reset}\n"
 	echo ""
 	printf ""
 	printf "${green}[1]${blue}-Simple Login${reset}\n"
 	echo ""
 	printf "${green}[2]${blue}-Espeak Login${reset}\n"
        echo ""
 	printf "${red}[q]${blue}-Quit${reset}\n"
    echo ""
    printf "${blue}Enter:-${reset}"
    read choice
    echo ""
 	if [ "${choice}" = "1" ]; then
 		sed -i 's/cd tlogin ; python login.py/cd tlogin ; python login.py/g' $PREFIX/etc/bash.bashrc
 	    elif [ "${choice}" = "2" ]; then
 		sed -i 's/cd tlogin ; python login.py/cd tlogin ; python eslogin.py/g' $PREFIX/etc/bash.bashrc
 		elif [ "${choice}" = "q" ]; then
 			exit 1

 	else
       echo ""
        printf "${red}Wrong Input${reset}\n"
        exit 1

   fi
 }

chechreq
create
backup
setlock
locktype

printf "${red}[NOTE]\n${green}THE LOCK YOU SET IS FOR ONE TIME ONLY.\nIF YOU WANT TO SET ANOTHER LOCK TYPE.\nYOU HAVE REMOVE THE PREVIOUS LOCK\nOTHERWISE BOTH LOCK IS SET ON YOUR TERMINAL\n${yellow}USE removelock.sh SCRIPT TO REMOVE LOCK${reset}\n"
line
echo ""
printf "${red}YouTube ${blue}https://www.youtube.com/channel/UCnPFWOidyGah_idNVpOftEQ${reset}\n"
printf "${red}Website ${blue}https://www.mrtechx.com${reset}\n"
printf "${red}Instgram ${blue}https://www.instagram.com/t_e_c_h_x/${reset}\n"
line
echo ""
line
