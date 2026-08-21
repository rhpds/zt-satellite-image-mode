#!/bin/bash

## Log into the terms-based registry using the pull token supplied by the platform
mkdir -p ~/.config/containers
cat <<EOF> ~/.config/containers/auth.json
{
    "auths": {
      "registry.redhat.io": {
        "auth": "${REGISTRY_PULL_TOKEN}"
      }
    }
  }
EOF

## Convert the system to Image Mode
podman run --rm --privileged -v /dev:/dev -v /var/lib/containers:/var/lib/containers -v /:/target --pid=host --security-opt label=type:unconfined_t registry.redhat.io/rhel10/rhel-bootc:10.1 bootc install to-existing-root --root-ssh-authorized-keys /target/root/.ssh/authorized_keys --acknowledge-destructive
