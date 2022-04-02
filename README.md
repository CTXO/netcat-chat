# netcat-chat
A one-to-one chat using a bash script with netcat

## Description
This script allows two users using it to communicate with each other through TCP using netcat.

## How to use
Grant execution permission to the file

``` bash
chmod +x ./message.sh
```

- Then, the first user needs to run the command as the server
```bash
./message.sh -s
```
- The program will then ask for your name and then you can start sending messages.

- To connect the client to the server run the following command on another terminal
```bash
./message.sh -c <SERVER'S IP ADDRESS>
```
- If you don't provide an IP address, the script will use "localhost" as the default.

- If you want to use this chat outside your LAN, the server user will have to port forward or use a tool like [ngrok](https://ngrok.com/)


