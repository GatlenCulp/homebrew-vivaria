#!/bin/bash

# viv-bash-init.sh
# This script initializes the shell environment for the Vivaria project.
# This script is intended to be sourced by the user's shell to set up the environment.

# Check if the script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  echo "Error: This script should be sourced, not executed."
  exit 1
fi

# Set up project-specific environment
VIV_BREW_PREFIX="$(brew --prefix vivaria)"
VIV_PROJECT_ROOT="$(dirname "${VIV_BREW_PREFIX}")"
export PATH="${VIV_PROJECT_ROOT}/bin:${PATH}"

# Change to the project root directory
cd "${VIV_PROJECT_ROOT}" || exit

# Source the original .bashrc to maintain standard Bash functionality
# if [[ -f "${HOME}/.bashrc" ]]; then
#   . "${HOME}/.bashrc"
# fi

# Print a welcome message
echo "Vivaria development environment initialized."
echo "Project root: ${VIV_PROJECT_ROOT}"

# Execute the passed command or start an interactive shell
if [[ $# -eq 0 ]]
then
  exec bash --norc
else
  exec "$@"
fi
