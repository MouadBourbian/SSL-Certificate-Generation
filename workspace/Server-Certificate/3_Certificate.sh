#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
  echo "Error: Incorrect number of arguments provided"
  echo "Usage: $0 <Common Name (e.g. domain)>"
  exit 1
fi

COMMON_NAME="$1"

# Create a external config file for the certificate
cat > cert.conf <<EOF

authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = ${COMMON_NAME}
DNS.2 = *.${COMMON_NAME}

EOF

# Define the output directory
OUTPUT_DIR="/SSL-Output/Server-Certificate"

# Define the root CA directory
ROOT_CA_DIR="/SSL-Output/Certificate-Authority"

# Create the directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Create SSl with self signed CA
openssl x509 -req \
    -in "$OUTPUT_DIR/$COMMON_NAME.csr" \
    -CA "$ROOT_CA_DIR/rootCA.crt" -CAkey "$ROOT_CA_DIR/rootCA.key" \
    -CAcreateserial -out "$OUTPUT_DIR/$COMMON_NAME.crt" \
    -days 365 \
    -sha256 -extfile cert.conf
