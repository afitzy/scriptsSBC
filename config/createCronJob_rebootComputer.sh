#!/bin/bash


doesCronRebootExist=$(sudo crontab -l 2>/dev/null | grep reboot 2>/dev/null)
if [ -z "$doesCronRebootExist" ]; then
  echo "cron reboot job does not exist. Adding job."
  (sudo crontab -l 2>/dev/null; echo "0 2 * * Mon,Wed,Fri /home/fitzy/scriptsSBC/reboot") | sudo crontab -
else
  echo "cron reboot job already exists. Not adding job."
fi
