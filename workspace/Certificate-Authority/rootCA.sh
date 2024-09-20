#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 3 ]; then
  echo "Error: Incorrect number of arguments provided"
  echo "Usage: $0 <Common Name (e.g. server FQDN or YOUR name)> <Country Code (2 letters)> <Locality Name (e.g. city)>"
  exit 1
fi

COMMON_NAME="$1"
COUNTRY="$2"
LOCALITY="$3"

# Define the output directory
OUTPUT_DIR="/SSL-Output/Certificate-Authority"

# Create the directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Generate root CA and Private key
openssl req -x509 \
            -sha256 -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/CN=${COMMON_NAME}/C=${COUNTRY}/L=${LOCALITY}" \
            -keyout "$OUTPUT_DIR/rootCA.key" -out "$OUTPUT_DIR/rootCA.crt"
