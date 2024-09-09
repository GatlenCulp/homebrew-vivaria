#!/bin/bash
set -e

# Possily a security issue generaing an RSA key like this??? Uncertain

VIVARIA_PREFIX=$(brew --prefix vivaria)

# Run setup scripts
"$VIVARIA_PREFIX/scripts/setup-docker-compose.sh"

# Generate SSH key
ssh-keygen -t rsa -b 4096 -f ~/.ssh/viv_rsa -N ""
chmod 600 ~/.ssh/viv_rsa
chmod 644 ~/.ssh/viv_rsa.pub

# Add SSH_PUBLIC_KEY_PATH to .env
echo "SSH_PUBLIC_KEY_PATH=~/.ssh/viv_rsa" >> "${VIVARIA_PREFIX}/.env"

echo "Vivaria setup complete."
echo "Please open ${VIVARIA_PREFIX}/.env.server and set your OPENAI_API_KEY."
