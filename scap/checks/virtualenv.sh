#!/usr/bin/env bash
# Create/update a python virtualenv using the wheel binaries
set -o errexit
set -o nounset
set -o pipefail

VENV=/srv/deployment/striker/venv
DEPLOY_DIR=/srv/deployment/striker/deploy

PIP=${VENV}/bin/pip

# Ensure that the virtual environment exists
mkdir -p $VENV
virtualenv --python python3 --system-site-packages $VENV

# Remove all existing packages from the venv
$PIP freeze | xargs $PIP uninstall -y

# Install all of the packaged wheels
$PIP install --use-wheel --no-deps ${DEPLOY_DIR}/wheels/*.whl
