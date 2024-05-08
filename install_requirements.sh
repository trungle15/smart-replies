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

# Check if llama3 is already installed
if ollama list | grep -wq 'llama3'; then
    echo "llama3 is already installed."
else
    echo "Installing llama3..."
    ollama pull llama3
fi

echo "Installation completed!"

echo "Serving ollama..."
ollama serve