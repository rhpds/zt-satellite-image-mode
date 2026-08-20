#!/bin/sh
echo "Solving 07-push-container-image" >> /tmp/progress.log

# From rhel1, log into Satellite's container registry and push the
# updated container image.
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel1 bash -s <<'EOF'
podman login --tls-verify=false satellite.lab --username admin --password bc31c9a6-9ff0-11ec-9587-00155d1b0702
podman push satellite.lab/acme_org/bootc/rhel10beta:summit-2025 --tls-verify=false
EOF

echo "Solved 07-push-container-image" >> /tmp/progress.log
