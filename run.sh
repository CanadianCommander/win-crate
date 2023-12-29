docker run -it -p 22:22 -v ./vm:/var/vm --privileged windows:0.0.4 /bin/bash

# -v /sys/fs/cgroup:/sys/fs/cgroup:ro
