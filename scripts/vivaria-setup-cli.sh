#!/bin/bash
set -e

VIVARIA_PREFIX=$(brew --prefix vivaria)

# Run CLI setup script
"$VIVARIA_PREFIX/scripts/configure-cli-for-docker-compose.sh"

# Register SSH public key
"$VIVARIA_PREFIX/cli/viv register-ssh-public-key ~/.ssh/viv_rsa.pub"

echo "Vivaria CLI setup complete."
