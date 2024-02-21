@echo off
echo open 192.168.1.200 > ftp_commands.txt
echo anonymous >> ftp_commands.txt
echo binary >> ftp_commands.txt
echo cd QT >> ftp_commands.txt
echo lcd C:\QT >> ftp_commands.txt
echo mget *.* >> ftp_commands.txt
echo bye >> ftp_commands.txt

ftp -s:ftp_commands.txt