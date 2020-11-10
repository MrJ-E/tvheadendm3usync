#!/bin/bash

DIR=/tvheadendm3usync/stuff
CHANNELS=channels.m3u
CHANNELSS=/tvheadendm3usync/stuff/channels.m3u
CHANURL="http://URL_TO_NEW_M3U"
USER=TVHEADENDUSERNAME
PASS=TVHEADENDPASSWORD
TVHOST=http://IP.OF.TVHEADEND.SERVER:9981
NETWORK=IPTV
cd $DIR
wget -O $CHANNELS --user-agent=Mozilla --content-disposition -x --load-cookies cookies.txt $CHANURL

dotnet /tvheadendm3usync/bin/Debug/netcoreapp3.1/TVHeadEndM3USync.dll $TVHOST $CHANNELSS $NETWORK $USER $PASS
