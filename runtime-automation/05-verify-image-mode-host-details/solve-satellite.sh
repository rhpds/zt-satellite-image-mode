#!/bin/sh
echo "Solving 05-verify-image-mode-host-details" >> /tmp/progress.log

# Run the Bootc status job against rhel2 so its image mode details are
# populated and visible on the host's details page in Satellite.
hammer job-invocation create \
  --job-template "Bootc Action - Script Default" \
  --search-query "name = rhel2.lab" \
  --inputs "action=status"

echo "Solved 05-verify-image-mode-host-details" >> /tmp/progress.log
