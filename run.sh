pushd "$(dirname $0)" >> /dev/null 

docker run -it -p 22:22 -v $(pwd)/vm/disk/:/var/vm/disk/ --privileged win-crate:0.0.5 /bin/bash

popd >> /dev/null
