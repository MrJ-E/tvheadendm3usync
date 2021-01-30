FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN apt-get update && apt-get install -y git && \
     git clone https://github.com/hagaygo/tvheadendm3usync.git && \
     dotnet build tvheadendm3usync/TVHeadEndM3USync.csproj && \
     mkdir -p /tvheadendm3usync/script /tvheadendm3usync/stuff
COPY script/gubbins.sh /tvheadendm3usync/script/gubbins.sh

ENTRYPOINT ["sh","/tvheadendm3usync/script/gubbins.sh"]
