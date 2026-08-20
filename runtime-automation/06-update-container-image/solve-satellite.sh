#!/bin/sh
echo "Solving 06-update-container-image" >> /tmp/progress.log

# On rhel1, build an updated container image from the official RHEL
# 10.1 bootc image with a new happy-face message-of-the-day, tagged
# for Satellite's container registry.
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel1 bash -s <<'EOF'
cat <<'EOT' > Containerfile
FROM registry.redhat.io/rhel10/rhel-bootc:10.1
RUN printf '%s\n' '  _______' ' /       \' '|  o   o  |' '|    ^    |' '|  \___/  |' ' \_______/' > /etc/motd
EOT

podman build -f Containerfile -t satellite.lab/acme_org/bootc/rhel-bootc:satellite-image-mode-lab
EOF

echo "Solved 06-update-container-image" >> /tmp/progress.log
