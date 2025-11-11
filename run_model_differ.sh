#!/bin/bash

# Unified model differ wrapper script for Continue config
# usage: ./run_model_differ.sh [config_file] [ollama_base] [--debug]

set -e

CONFIG_FILE="${1:-$HOME/.continue/config.yaml}"
OLLAMA_BASE="${2:-https://ollama.ldmathes.cc}"
DEBUG=false

# Check for --debug flag in any position
for arg in "$@"; do
    if [ "$arg" = "--debug" ]; then
        DEBUG=true
    fi
done

if [ "$DEBUG" = true ]; then
    echo "Debug mode enabled"
    echo "Config file: $CONFIG_FILE"
    echo "Ollama base: $OLLAMA_BASE"
fi

python3 Scripts/model_differ.py --format continue --config "$CONFIG_FILE" --api-base "$OLLAMA_BASE"