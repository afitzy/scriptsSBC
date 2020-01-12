#!/bin/bash


crontabDir="/var/spool/cron/crontabs"

doesCronRebootExist=$(sudo grep --no-messages "reboot" "${crontabDir}/{*,.*}" 2>/dev/null)
if [ "$doesCronRebootExist" ]; then
  echo "cron reboot job already exists. Not adding job."
else
  echo "cron reboot job does not exist. Adding job."
  (sudo crontab -l 2>/dev/null; echo "0 2 * * Mon,Wed,Fri /home/fitzy/scriptsSBC/reboot") | sudo crontab -
fi