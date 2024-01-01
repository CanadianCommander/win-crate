pushd "$(dirname $0)" >> /dev/null 

docker run -it -p 22:22 -v ./vm/disk/:/var/vm/disk/ -v ./vm/iso/:/var/vm/iso/ -v ./vm/data/:/var/vm/data/ -v ./vm/ssh/rsa.key.pub:/root/.ssh/authorized_keys --privileged win-crate:latest /bin/bash

popd >> /dev/null