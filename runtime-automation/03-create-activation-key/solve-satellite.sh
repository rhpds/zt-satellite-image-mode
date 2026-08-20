#!/bin/sh
echo "Solving 03-create-activation-key" >> /tmp/progress.log

ORG="Acme Org"

# Create an activation key that grants our image mode host access to
# the Default Organization View content view.
hammer activation-key create \
  --name "bootc-summit" \
  --organization "$ORG" \
  --lifecycle-environment "Library" \
  --content-view "Default Organization View"

echo "Solved 03-create-activation-key" >> /tmp/progress.log
