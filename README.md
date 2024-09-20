# SSL Certificate Generation

This project demonstrates how to generate SSL certificates using OpenSSL. The project consists of two parts: generating a root CA and generating a server certificate. You can use Docker to run the project on any platform, or if you have a Unix-based system, you can run the project directly.

## Prerequisites

- [Docker](https://www.docker.com/) (for running the project in a container)
- Bash (for Unix-based systems)
- PowerShell (for Windows systems)

## Usage

### Build and Run Docker Container

To build the Docker container, run the following command:

#### Unix-based Systems

```bash
chmod +x ./run-docker.sh # make the script executable
./run-docker.sh
```

#### Windows Systems

```powershell
.\run-docker.ps1
```

### Generate Root CA

To generate a root CA, run the following command:

```bash
/workspace/Certificate-Authority/rootCA.sh <Common Name (e.g. server FQDN or YOUR name)> <Country Code (2 letters)> <Locality Name (e.g. city)>
```

### Generate Server Certificate

> [!NOTE]  
> The server certificate generation process requires the root CA certificate and key. Ensure that the root CA certificate and key are present in the [SSL-Output](./SSL-Output/Certificate-Authority/) directory.

To generate a server certificate, run the following command:

#### 1. Generate Private Key

```bash
/workspace/Server-Certificate/1_Private-Key.sh <Common Name (e.g. domain)>
```

#### 2. Generate CSR

```bash
/workspace/Server-Certificate/2_Certificate-Signing-Request.sh <Common Name (e.g. domain)> <Country Code (2 letters)> <Locality Name (e.g. city)> <State or Province Name (full name)>
```

#### 3. Sign Certificate

```bash
/workspace/Server-Certificate/3_Certificate.sh <Common Name (e.g. domain)>
```

## Output

The generated certificates and keys will be stored in the [SSL-Output](./SSL-Output) directory.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Acknowledgements

This project uses the [OpenSSL](https://www.openssl.org/) library for generating SSL certificates.
