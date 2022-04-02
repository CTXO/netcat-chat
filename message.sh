#!/bin/bash

PROMPTS="echo What is yout name?   1>&2 \n
read name \n
echo Type your messages 1>&2 \n
while true; do \n
read message \n
echo -e \"\e[2A\" 1>&2 \n
echo -e \"\e[2K\" 1>&2 \n
echo -e \"\e[2A\" 1>&2 \n

MY_COLOR=\"\e[1;34m\" \n
YOUR_COLOR=\"\e[1;32m\" \n
NORMAL_COLOR=\"\e[0m\" \n
echo -e \"\$YOUR_COLOR[\$name \$(date +%r)\b]: \$message\$NORMAL_COLOR\" \n
echo -e \"\$MY_COLOR[You \$(date +%r)\b]: \$message\$NORMAL_COLOR\" 1>&2\n

done\n"

function handle() {
	rm prompts_client.sh prompts_server.sh 2> /dev/null
}

trap handle INT

if [ $1 == "-s" ]; then
	echo -ne $PROMPTS > prompts_server.sh
	chmod +x prompts_server.sh
	./prompts_server.sh | nc -l 1234
elif [ $1 == "-c" ]; then
	echo -ne $PROMPTS > prompts_client.sh
	chmod +x prompts_client.sh
	if [ -z $2 ]; then
		./prompts_client.sh | nc localhost 1234    
	else
		./prompts_client.sh | nc $2 1234
	fi	
else
	echo "Please provide the right arguments" 1>&2
fi

