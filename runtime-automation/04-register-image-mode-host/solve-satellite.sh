#!/bin/sh
echo "Solving 04-register-image-mode-host" >> /tmp/progress.log

ORG="Acme Org"

# Generate the host registration command for our activation key and
# register the image mode host rhel2 to Satellite.
export regscript=$(hammer host-registration generate-command \
  --activation-key "bootc-summit" \
  --organization "$ORG" \
  --setup-insights 0 \
  --insecure 1 \
  --setup-container-registry-certs true \
  --force 1)

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel2 $regscript

echo "Solved 04-register-image-mode-host" >> /tmp/progress.log
