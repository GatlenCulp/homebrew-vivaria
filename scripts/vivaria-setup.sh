#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# Get the real path of the script, resolving symlinks
SCRIPT_PATH=$(readlink -f "${BASH_SOURCE[0]}")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")/vivaria"
cd "$PROJECT_ROOT/"
echo "Setting up Vivaria"

viv config set apiUrl http://localhost:4001
viv config set uiUrl https://localhost:4000

# Check if .env.server exists
if [ ! -f ".env.server" ]; then
    echo ".env.server not found. Running vivaria-setup..."
    "$SCRIPT_DIR/vivaria-setup"

    # Check again after running vivaria-setup
    if [ ! -f ".env.server" ]; then
        echo "Error: .env.server still not found after running vivaria-setup. Exiting." >&2
        exit 1
    fi
fi

(source .env.server && viv config set evalsToken $ACCESS_TOKEN---$ID_TOKEN)

viv config set vmHostLogin None
if [[ "$(uname)" == "Darwin" ]]; then
    viv config set vmHost '{"hostname": "0.0.0.0:2222", "username": "agent"}'
else
    viv config set vmHost None
fi

echo "Vivaria setup complete"
