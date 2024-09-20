FROM ubuntu:latest

RUN apt-get update && apt-get install -y bash sudo openssl
SHELL ["/bin/bash", "-c"]
WORKDIR /workspace
COPY ./workspace .

CMD ["bash"]