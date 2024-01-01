
if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
    echo "Usage: ./run.sh [mount points]"
    echo "Runs the windows in a box container"
    echo "Mount points are an optional list of directories to mount into the windows VM"
    echo "Example: ./run.sh /home/user/data /home/user/code/myproject"
    exit 0
fi

pushd "$(dirname $0)" >> /dev/null 

docker run -it -p 22:22 -v ./vm/disk/:/var/vm/disk/ -v ./vm/iso/:/var/vm/iso/ -v ./vm/data/:/var/vm/data/ -v ./vm/ssh/rsa.key.pub:/root/.ssh/authorized_keys --privileged win-crate:latest /bin/bash

popd >> /dev/null