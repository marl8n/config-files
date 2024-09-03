#!/bin/bash

# Array of required programs
required_programs=( "tmux" "nvim" "git" "curl" "python3" "node" )

# Function to check if a program is installed
check_program() {
  local program=$1
  if command -v "$program" > /dev/null 2>&1; then
    echo -e "\e[32m✔ $program is installed\e[0m"
  else
    echo -e "\e[31m✘ $program is not installed\e[0m"
  fi
}

# Check all required programs
echo "Checking system requirements..."
for program in "${required_programs[@]}"; do
  check_program "$program"
done

echo -e "\nDoctor check complete!"
