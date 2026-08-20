#!/bin/sh
echo "Solving 09-schedule-remote-job" >> /tmp/progress.log

# Schedule a Bootc switch job to point rhel2 at the newly published
# container image.
hammer job-invocation create \
  --job-template "Bootc Switch - Script Default" \
  --search-query "name = rhel2.lab" \
  --inputs "target=satellite.lab/acme_org/bootc/rhel10beta:summit-2025"

# Reboot rhel2 into the new image and confirm the switch completed.
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel2 reboot
sleep 60
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel2 bootc status

echo "Solved 09-schedule-remote-job" >> /tmp/progress.log
