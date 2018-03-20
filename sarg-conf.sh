#!/usr/bin/env bash

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "0 * * * * root sarg" >> mycron
#install new cron file
crontab mycron
rm mycron