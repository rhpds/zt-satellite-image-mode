#!/bin/bash
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

podman login registry.redhat.io --authfile ~/.config/containers/auth.json

podman pull registry.redhat.io/rhel10/rhel-bootc:10.1

rm ~/.config/containers/auth.json
