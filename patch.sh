#!/usr/bin/bash

/usr/bin/docker exec -it seafile bash -c "sed -i 's/mirrors\.tuna\.tsinghua\.edu\.cn/us\.archive\.ubuntu\.com/g' /etc/apt/sources.list"
/usr/bin/docker exec -it seafile apt-get update -y
/usr/bin/docker exec -it seafile apt-get install -y mpv
/usr/bin/docker exec -it seafile rm -f /opt/seafile/seafile-server-latest/seahub/seahub/thumbnail/utils.py
/usr/bin/docker exec -it seafile wget https://raw.githubusercontent.com/liamdemafelix/seafile-patches/main/thumbnail-utils.py -O "/opt/seafile/seafile-server-latest/seahub/seahub/thumbnail/utils.py"
/usr/bin/docker restart seafile
