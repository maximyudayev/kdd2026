#!/bin/sh
# Activate the virtual environment
source .venv/bin/activate
export PYTHONPATH="$(pwd):$PYTHONPATH"

# Auto-increment the trial ID
FILE="trial_auto_id.txt"

if [ -f "$FILE" ]; then
    trial_id=$(cat "$FILE")
else
    trial_id=0
fi
trial_id=$((trial_id + 1))
echo "$trial_id" > "$FILE"

# Run the experiment
hermes-cli -o ./data -f wearable.yml project=Revalexo type=Transparent trial=$trial_id
