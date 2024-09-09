#!/bin/bash
set -e

VIVARIA_PREFIX=$(brew --prefix vivaria)
cd "$VIVARIA_PREFIX/vivaria"
docker compose up -d

echo "Vivaria services have been started."
