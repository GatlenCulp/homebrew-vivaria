#!/usr/bin/env bash

# This script is used to set up a local development environment for Homebrew.
# Check Homebrew installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first."
  echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'
  exit 1
fi

mkdir -p "$(brew --repo)/Library/Taps/homebrew"
