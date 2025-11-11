#!/bin/bash

# copilot - Free GitHub Copilot CLI Alternative using Ollama
# Usage: 
#   copilot suggest "find large files"
#   copilot explain "git rebase -i HEAD~3"
#   copilot ask "how to use rsync"

OLLAMA_HOST="${OLLAMA_HOST:-http://localhost:11434}"
OLLAMA_MODEL="${OLLAMA_MODEL:-llama3.2:3b}"

# Colors for output
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if Ollama is available
check_ollama() {
    if ! curl -s "$OLLAMA_HOST/api/tags" > /dev/null 2>&1; then
        echo "❌ Error: Cannot connect to Ollama at $OLLAMA_HOST"
        echo "   Make sure Ollama is running: ollama serve"
        exit 1
    fi
}

# Function to call Ollama
call_ollama() {
    local prompt="$1"
    local system="${2:-You are a helpful command-line assistant.}"
    
    local response=$(curl -s "$OLLAMA_HOST/api/generate" \
        -H "Content-Type: application/json" \
        -d "{
            \"model\": \"$OLLAMA_MODEL\",
            \"prompt\": \"$system\n\n$prompt\",
            \"stream\": false,
            \"options\": {
                \"temperature\": 0.7
            }
        }")
    
    echo "$response" | jq -r '.response'
}

# Command: suggest
cmd_suggest() {
    local query="$*"
    
    if [ -z "$query" ]; then
        echo "Usage: copilot suggest <description>"
        echo "Example: copilot suggest find all log files older than 30 days"
        exit 1
    fi
    
    echo -e "${BLUE}🤖 Suggesting command for:${NC} $query"
    echo ""
    
    local system="You are a command-line expert. Generate a single, executable shell command for the user's request. Reply with ONLY the command, no explanation, no markdown, no quotes."
    local prompt="Generate a shell command for: $query"
    
    local command=$(call_ollama "$prompt" "$system")
    
    # Clean up the response
    command=$(echo "$command" | sed 's/^```.*//g' | sed 's/```$//g' | sed 's/^`//g' | sed 's/`$//g' | xargs)
    
    echo -e "${GREEN}Suggested command:${NC}"
    echo "  $command"
    echo ""
    
    # Ask if user wants to execute
    read -p "Execute this command? (y/N): " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Executing...${NC}"
        eval "$command"
    else
        echo "Command not executed."
    fi
}

# Command: explain
cmd_explain() {
    local command="$*"
    
    if [ -z "$command" ]; then
        echo "Usage: copilot explain <command>"
        echo "Example: copilot explain 'find . -name \"*.log\" -mtime +30 -delete'"
        exit 1
    fi
    
    echo -e "${BLUE}🤖 Explaining command:${NC} $command"
    echo ""
    
    local system="You are a command-line expert. Explain shell commands clearly and concisely. Break down each part of the command."
    local prompt="Explain this shell command in detail:\n\n$command"
    
    local explanation=$(call_ollama "$prompt" "$system")
    
    echo -e "${GREEN}Explanation:${NC}"
    echo "$explanation"
}

# Command: ask
cmd_ask() {
    local question="$*"
    
    if [ -z "$question" ]; then
        echo "Usage: copilot ask <question>"
        echo "Example: copilot ask how do I compress a directory"
        exit 1
    fi
    
    echo -e "${BLUE}🤖 Question:${NC} $question"
    echo ""
    
    local system="You are a helpful command-line assistant. Provide practical, actionable answers. Include example commands when relevant."
    local prompt="$question"
    
    local answer=$(call_ollama "$prompt" "$system")
    
    echo -e "${GREEN}Answer:${NC}"
    echo "$answer"
}

# Command: commit
cmd_commit() {
    echo -e "${BLUE}🤖 Generating commit message...${NC}"
    echo ""
    
    # Get staged changes
    if git diff --staged --quiet; then
        echo "❌ No staged changes. Stage changes first with: git add"
        exit 1
    fi
    
    local diff=$(git diff --staged | head -c 2000)  # Limit size
    
    local system="You are a git commit message expert. Generate concise, conventional commit messages."
    local prompt="Generate a git commit message for these changes. Reply with ONLY the commit message (max 72 chars), no explanation:\n\n$diff"
    
    local message=$(call_ollama "$prompt" "$system" | head -1 | xargs)
    
    echo -e "${GREEN}Suggested commit message:${NC}"
    echo "  $message"
    echo ""
    
    read -p "Use this message? (y/N): " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git commit -m "$message"
        echo "✓ Committed"
    else
        echo "Commit cancelled. Write your own:"
        git commit
    fi
}

# Command: debug
cmd_debug() {
    local error="$*"
    
    if [ -z "$error" ]; then
        echo "Usage: copilot debug <error message>"
        echo "Example: copilot debug 'bash: command not found: npm'"
        exit 1
    fi
    
    echo -e "${BLUE}🤖 Debugging error:${NC} $error"
    echo ""
    
    local system="You are a debugging expert. Explain errors and provide solutions. Be concise and actionable."
    local prompt="Help me debug this error:\n\n$error"
    
    local solution=$(call_ollama "$prompt" "$system")
    
    echo -e "${GREEN}Solution:${NC}"
    echo "$solution"
}

# Main command router
main() {
    check_ollama
    
    local subcommand="$1"
    shift
    
    case "$subcommand" in
        suggest|s)
            cmd_suggest "$@"
            ;;
        explain|e)
            cmd_explain "$@"
            ;;
        ask|a)
            cmd_ask "$@"
            ;;
        commit|c)
            cmd_commit "$@"
            ;;
        debug|d)
            cmd_debug "$@"
            ;;
        *)
            echo "copilot - Free GitHub Copilot CLI Alternative"
            echo ""
            echo "Usage: copilot <command> [arguments]"
            echo ""
            echo "Commands:"
            echo "  suggest (s)  Generate a shell command from description"
            echo "  explain (e)  Explain what a command does"
            echo "  ask (a)      Ask a general question"
            echo "  commit (c)   Generate a git commit message"
            echo "  debug (d)    Help debug an error message"
            echo ""
            echo "Examples:"
            echo "  copilot suggest find all PDF files"
            echo "  copilot explain 'tar -xzf archive.tar.gz'"
            echo "  copilot ask how to use rsync"
            echo "  copilot commit"
            echo "  copilot debug 'permission denied'"
            echo ""
            echo "Environment:"
            echo "  OLLAMA_HOST=$OLLAMA_HOST"
            echo "  OLLAMA_MODEL=$OLLAMA_MODEL"
            exit 1
            ;;
    esac
}

main "$@"
