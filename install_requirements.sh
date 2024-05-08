#!/bin/bash

echo "Installing langchain..."
pip --quiet install langchain

# Check and install brew on macOS if it's not installed
if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v brew &>/dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # Check if ollama is installed on macOS
    if ! command -v ollama &>/dev/null; then
        echo "Installing ollama using Homebrew..."
        brew install ollama
    else
        echo "Ollama is already installed."
    fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Check if ollama is installed on Linux
    if ! command -v ollama &>/dev/null; then
        echo "Installing ollama for Linux..."
        curl -fsSL https://ollama.com/install.sh | sh
    else
        echo "Ollama is already installed."
    fi
else
    echo "Script supports only Linux and MacOS. Ollama is not installed."
    exit 1
fi

# Check if gemma:2b is already installed
if ollama list | grep -wq 'gemma:2b'; then
    echo "gemma:2b is already installed."
else
    echo "Installing gemma:2b..."
    ollama pull gemma:2b
fi

echo "Installation completed!"
