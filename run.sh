pushd "$(dirname $0)" >> /dev/null 

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
    echo "Usage: ./run.sh [mount points]"
    echo "Runs the windows in a box container"
    echo "Mount points are an optional list of directories to mount into the windows VM"
    echo "Example: ./run.sh /home/user/data /home/user/code/myproject"
    exit 0
fi

DATA_MOUNTS=""
for mount in "${@}"; do
    DATA_MOUNTS="${DATA_MOUNTS} -v ${mount}:/var/vm/data/$(basename ${mount})"
done

docker run -it -p 22:22 -p 8080:80 -p 8443:443  ${DATA_MOUNTS} -v ./vm/disk/:/var/vm/disk/ -v ./vm/iso/:/var/vm/iso/ -v ./vm/ssh/rsa.key.pub:/root/.ssh/authorized_keys --privileged ghcr.io/canadiancommander/win-crate:latest /bin/bash

popd >> /dev/null