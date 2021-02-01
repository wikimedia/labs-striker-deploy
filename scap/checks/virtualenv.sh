#!/usr/bin/env bash
# Create/update a python virtualenv using the wheel binaries
set -o errexit
set -o nounset
set -o pipefail

# We're going to need $VENV in the collectstatic stage
export VENV=/srv/deployment/striker/venv
DEPLOY_DIR=/srv/deployment/striker/deploy
WHEEL_DIR=${DEPLOY_DIR}/wheels
REQUIREMENTS=${DEPLOY_DIR}/requirements.txt

PIP=${VENV}/bin/pip

# Ensure that the virtual environment exists
mkdir -p $VENV
virtualenv --python python3 $VENV || /bin/true

# Install or upgrade all requirements from wheel cache
$PIP install \
    --no-index \
    --find-links ${WHEEL_DIR} \
    --upgrade \
    --force-reinstall \
    --requirement $REQUIREMENTS

cd ${DEPLOY_DIR}/striker && contrib/collectstatic.sh
cp -r ${DEPLOY_DIR}/striker/staticfiles/* ${DEPLOY_DIR}/public_html/static/
