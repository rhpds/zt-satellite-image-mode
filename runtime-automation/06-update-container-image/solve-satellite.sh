#!/bin/sh
echo "Solving 06-update-container-image" >> /tmp/progress.log

# On rhel1, build an updated container image from the running rhel2
# image with a new message-of-the-day, tagged for Satellite's
# container registry.
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@rhel1 bash -s <<'EOF'
cat <<EOT > Containerfile
FROM quay.io/toharris/rhel-bootc:summit-2025
RUN echo "Welcome to Summit 2025" > /etc/motd
EOT

podman build -f Containerfile -t satellite.lab/acme_org/bootc/rhel10beta:summit-2025
EOF

echo "Solved 06-update-container-image" >> /tmp/progress.log
