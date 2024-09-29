#!/bin/bash
set -e

echo "Starting Vivaria..."

# Get the real path of the script, resolving symlinks
SCRIPT_PATH=$(readlink -f "${BASH_SOURCE[0]}")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")/vivaria"
echo "Project root: $PROJECT_ROOT"
cd "$PROJECT_ROOT/"

if ! docker compose up --wait 2>&1; then  # <--- [CHANGED] Removed the specific error check to catch all errors
    echo "Error: Docker compose failed to start."  # <--- [CHANGED] Updated to a more general error message
    echo "Please ensure you are running this command from the correct directory ($(pwd))."
    echo "Check the Docker logs for more details."  # <--- [NEW] Added to provide more guidance
    exit 1
else
    echo "Docker compose started successfully."
fi

echo "Checking if the UI is up..."
max_attempts=30
attempt=0
while ! curl -s http://localhost:4001/health > /dev/null; do
  attempt=$((attempt+1))
  if [ $attempt -eq $max_attempts ]; then
    echo "Error: UI did not come up after $max_attempts attempts. Please check the Docker logs."
    exit 1
  fi
  echo "Waiting for UI to come up... (attempt $attempt/$max_attempts)"
  sleep 2
done

echo "Vivaria is now running!"
echo "Please open https://localhost:4000 in your browser."
echo "Note: You may see a 'connection untrusted' warning. This is expected for local development."

# Open the URL in the default browser
if [[ "$OSTYPE" == "darwin"* ]]; then
  open "https://localhost:4000"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  xdg-open "https://localhost:4000"
else
  echo "Please open https://localhost:4000 in your browser manually."
fi
