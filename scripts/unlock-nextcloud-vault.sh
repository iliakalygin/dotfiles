#!/bin/bash

pass cryptomator/nextcloud | cryptomator-cli unlock \
    /home/void/Nextcloud/Nextcloud_cm \
    --mounter=org.cryptomator.frontend.fuse.mount.LinuxFuseMountProvider \
    --mountPoint=/mnt/Nextcloud \
    --password:stdin

