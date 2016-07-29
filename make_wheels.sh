#!/usr/bin/env bash
# Build wheels for distribution
set -o errexit
set -o nounset
set -o pipefail

BASE=$(realpath $(dirname $0))
BUILD=${BASE}/_build
VENV=${BUILD}/venv
STRIKER=${BASE}/striker
REQUIREMENTS=${BASE}/requirements.txt

PIP=${VENV}/bin/pip

mkdir -p $VENV
virtualenv --python python3 $VENV || /bin/true
$PIP install -r ${STRIKER}/requirements.txt
$PIP freeze --local --requirement $REQUIREMENTS > $REQUIREMENTS
$PIP install wheel
$PIP wheel -r $REQUIREMENTS -w wheels
