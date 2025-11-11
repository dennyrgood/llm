#!/usr/bin/env python3
"""
Compare ollama_llm_fetcher output with aichat config and output missing models.
Usage: ./ollama_llm_fetcher.py | python3 model_differ.py
"""

import sys
import re
from pathlib import Path

def parse_fetcher_output(text):
    """Extract model IDs from fetcher output."""
    models = set()
    # Match lines with model IDs (format: model-name:version or model-name:cloud)
    pattern = r'^([a-z0-9\-_.]+:[a-z0-9\-_.]+)\s+\|'
    
    for line in text.split('\n'):
        match = re.match(pattern, line.strip())
        if match:
            models.add(match.group(1))
    
    return models

def parse_config_models(config_path):
    """Extract model names from aichat config without YAML library."""
    models = set()
    
    try:
        with open(config_path, 'r') as f:
            content = f.read()
        
        # Look for lines with "name: " that represent model names
        # This matches the pattern in the config: "- name: model:version"
        pattern = r'^\s*-?\s*name:\s*["\']?([a-z0-9\-_.]+:[a-z0-9\-_.]+)["\']?'
        
        for line in content.split('\n'):
            match = re.match(pattern, line)
            if match:
                models.add(match.group(1))
    
    except FileNotFoundError:
        print(f"Warning: Config file not found at {config_path}", file=sys.stderr)
    except Exception as e:
        print(f"Warning: Error reading config: {e}", file=sys.stderr)
    
    return models

def format_model_entry(model_id):
    """Format a model ID into the YAML config format."""
    # Create a display name from the model ID
    # Remove quantization suffixes and format nicely
    base_name = model_id.replace(':latest', '').replace(':cloud', '')
    
    # Capitalize and format display name
    parts = base_name.split('-')
    display_parts = [p.capitalize() for p in parts]
    
    # Add cloud or version suffix
    if ':cloud' in model_id:
        display_name = f"{' '.join(display_parts)} (Cloud)"
    elif ':latest' in model_id:
        display_name = ' '.join(display_parts)
    else:
        # Extract version/variant
        name, variant = model_id.split(':', 1)
        display_name = f"{' '.join([p.capitalize() for p in name.split('-')])} ({variant})"
    
    return f"""      - name: {model_id}
        display_name: {display_name}
"""

def main():
    # Read from stdin (piped input)
    fetcher_output = sys.stdin.read()
    
    # Parse models from fetcher
    fetcher_models = parse_fetcher_output(fetcher_output)
    
    # Parse models from config
    config_path = Path.home() / "Library/Application Support/aichat/config.yaml"
    config_models = parse_config_models(config_path)
    
    # Find missing models
    missing_models = fetcher_models - config_models
    
    if not missing_models:
        print("# No missing models - config is up to date!", file=sys.stderr)
        sys.exit(0)
    
    # Sort models for consistent output
    # Prioritize cloud models, then alphabetically
    cloud_models = sorted([m for m in missing_models if ':cloud' in m])
    local_models = sorted([m for m in missing_models if ':cloud' not in m])
    
    print("# Missing models found. Add these to your config.yaml under clients -> ollama -> models:")
    print()
    
    if cloud_models:
        print("      # --- Cloud Models (Missing) ---")
        for model in cloud_models:
            print(format_model_entry(model), end='')
    
    if local_models:
        if cloud_models:
            print()
        print("      # --- Local Models (Missing) ---")
        for model in local_models:
            print(format_model_entry(model), end='')

if __name__ == "__main__":
    main()
