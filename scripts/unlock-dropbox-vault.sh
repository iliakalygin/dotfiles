#!/bin/bash

pass cryptomator/dropbox | cryptomator-cli unlock \
    /home/void/Dropbox/DropboxMainV \
    --mounter=org.cryptomator.frontend.fuse.mount.LinuxFuseMountProvider \
    --mountPoint=/mnt/Dropbox \
    --password:stdin

