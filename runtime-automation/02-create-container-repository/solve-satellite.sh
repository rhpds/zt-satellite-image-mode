#!/bin/sh
echo "Solving 02-create-container-repository" >> /tmp/progress.log

ORG="Acme Org"

# Create the bootc product that will provide a method for storing
# image mode container images.
hammer product create \
  --name "bootc" \
  --organization "$ORG"

echo "Solved 02-create-container-repository" >> /tmp/progress.log
