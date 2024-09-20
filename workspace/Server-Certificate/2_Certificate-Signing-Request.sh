#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 4 ]; then
  echo "Error: Incorrect number of arguments provided"
  echo "Usage: $0 <Common Name (e.g. domain)> <Country Code (2 letters)> <Locality Name (e.g. city)> <State or Province Name (full name)>"
  exit 1
fi

COMMON_NAME="$1"
COUNTRY="$2"
LOCALITY="$3"
STATE="$4"

# Create csf configuration file
cat > csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = ${COUNTRY}
ST = ${STATE}
L = ${LOCALITY}
CN = ${COMMON_NAME}

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = ${COMMON_NAME}
DNS.2 = *.${COMMON_NAME}

EOF

# Define the output directory
OUTPUT_DIR="/SSL-Output/Server-Certificate"

# Create the directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Create CSR request using private key
openssl req -new -key "$OUTPUT_DIR/$COMMON_NAME.key" -out "$OUTPUT_DIR/$COMMON_NAME.csr" -config csr.conf
