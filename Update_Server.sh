#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin	#Sets the PATH for CRON
LogPath=/Scripts/ServerUpdatesLogs/`date +%F`_Server_UPDATES.log
#-------------------------------------------------------------------------------------
echo "-------------------------------------------------------------" &>> $LogPath
echo "starting update process at `date +%F_%H%M`" &>> $LogPath
echo "-------------------------------------------------------------" &>> $LogPath
sudo apt-get update &>> $LogPath
echo "-----------------------------------------------" &>> $LogPath
echo "stopping update process at `date +%F_%H%M`" &>> $LogPath
echo "-----------------------------------------------" &>> $LogPath
echo "-----------------------------------------------" &>> $LogPath
echo "starting upgrade process at `date +%F_%H%M`" &>> $LogPath
echo "-----------------------------------------------" &>> $LogPath
sudo apt-get upgrade -y &>> $LogPath
echo "-----------------------------------------------" &>> $LogPath
echo "removing unneeded packages... <--- `date +%F_%H%M`" &>> $LogPath
echo "-----------------------------------------------" &>> $LogPath
sudo apt-get autoremove &>> $LogPath
echo "-----------------------------------------------" &>> $LogPath
echo "cleaning update repo... <--- `date +%F_%H%M`" &>> $LogPath
echo "-----------------------------------------------" &>> $LogPath
sudo apt-get autoclean &>> $LogPath
echo "-------------------------------------------------------------" &>> $LogPath
echo "stopping upgrade process at `date +%F_%H%M`" &>> $LogPath
echo "-------------------------------------------------------------" &>> $LogPath
mail -s "Ark Server Info" email@address < $LogPath
exit 0
