#!/bin/sh
echo "Solving 08-obtain-container-image-label" >> /tmp/progress.log

# This module is a Satellite Web UI navigation exercise to locate the
# published container image label. There is no state to change, so we
# just confirm the label is present in the bootc product's repository.
hammer repository list --product "bootc" --organization "Acme Org"

echo "Solved 08-obtain-container-image-label" >> /tmp/progress.log
