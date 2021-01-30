#!/bin/bash

DIR=/tvheadendm3usync/stuff
CHANNELS=channels.m3u
CHANNELSS=/tvheadendm3usync/stuff/channels.m3u
CHANURL="YOUR_SECRET_URL_TOO_CHANNEL_LIST"
USER=TVHEADENDUSERNAME
PASS=TVHEADENDPASSWORD
TVHOST=http://IP_OF_TVHEADEND_SERVER:9981
NETWORK=IPTV
cd $DIR
wget -O $CHANNELS --user-agent=Mozilla --content-disposition $CHANURL

dotnet /tvheadendm3usync/bin/Debug/netcoreapp3.1/TVHeadEndM3USync.dll $TVHOST $CHANNELSS $NETWORK $USER $PASS
