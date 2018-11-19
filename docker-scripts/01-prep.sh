#!/bin/bash

set -e

echo
echo "Setting directory info in environment variables..."
echo

export HERE="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
export DATA_DIR=${HERE}/data

echo "HERE=${HERE}"
echo "DATA_DIR=${DATA_DIR}"
