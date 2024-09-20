#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
  echo "Error: Incorrect number of arguments provided"
  echo "Usage: $0 <Common Name (e.g. domain)>"
  exit 1
fi

COMMON_NAME="$1"

# Define the output directory
OUTPUT_DIR="/SSL-Output/Server-Certificate"

# Create the directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Generate Private key
openssl genrsa -out "$OUTPUT_DIR/$COMMON_NAME.key" 2048
