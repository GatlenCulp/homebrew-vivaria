#!/bin/bash
set -euo pipefail

# Get the real path of the script, resolving symlinks
SCRIPT_PATH=$(readlink -f "${BASH_SOURCE[0]}")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")/vivaria"

# Change to the project root directory
cd "$PROJECT_ROOT"

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: docker is not installed or not in PATH" >&2
    exit 1
fi

# Run docker command with all arguments passed to this script
docker "$@"
