This fork is only made to counter the tideous task of refreshing channels/EPG in Tvheadend. Thanks to https://github.com/hagaygo genious code, this was possible. Also big thanks to Roxedus over at https://www.linuxserver.io/ I had never tried docker before I entered their discord, mindblown! 

Goal is to be able to run this on any machine, and not have to deal with library-issues and compability.
This guide will not cover installing docker and get it up running.

1. Have a look at the script ```gubbins.sh``` customize it to your needs:
```#!/bin/bash

DIR=/tvheadendm3usync/stuff
CHANNELS=channels.m3u                         # This contains your channels
CHANNELSS=/tvheadendm3usync/stuff/channels.m3u
CHANURL="<URL TO CHANNELS>"                   # Url is given by your provider, usually contains username/password.
USER=MYTVUSER                                 # user you created in tvheadend.
PASS=MYPASSWD                                 # Passwd for your tvhead user. 
TVHOST=http://<IPOFTVHEADEND>:9981            # Replace with your tvheadendIP.
NETWORK=IPTV                                  # Your network in Tvheadend to scan/add channels 
cd $DIR
wget -O $CHANNELS --user-agent=Mozilla --content-disposition $CHANURL

dotnet /tvheadendm3usync/bin/Debug/netcoreapp3.1/TVHeadEndM3USync.dll $TVHOST $CHANNELSS $NETWORK $USER $PASS
```
2. Building the docker itself:
``` docker build -t tvheadendm3usync .```
Remember that if you modify gubbins.sh, image needs to be recreated to add the new file.

3. I automated the process with crontab:
```# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command
#6 4 * * * docker run --rm --name=tvsync tvheadendm3usync
#1 */12 * * * wget -O /path/to/dir/tvheadend/data/tv_grab_file.xml --user-agent=Mozilla --content-disposition --keep-session-cookies --save-cookies cookies.txt "http://url.to.your.epg"

Good luck and dont forgett to have funz!
