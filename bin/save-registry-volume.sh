#/bin/bash

#
# This takes the volume from registry and mounts it in the same place as the
# registry container has it. Then it mounts the local directory as /backup
# and we create a tar of all of /var/lib/registry as backup.tar.
#

docker run \
--rm \
--volumes-from registry \
-v $(pwd):/backup ubuntu \
tar cvf /backup/backup.tar /var/lib/registry
