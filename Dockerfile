FROM debian:latest

RUN apt update && apt install -y git wget
RUN git clone https://github.com/vmactions/openbsd-vm
RUN cd openbsd-vm && bash run.sh importVM
