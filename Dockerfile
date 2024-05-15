FROM debian:latest

RUN printf '#!/usr/bin/env sh\nexec "$@"' > /usr/bin/sudo && chmod +x /usr/bin/sudo
RUN sudo apt update && sudo apt install -y git wget
RUN git clone https://github.com/vmactions/openbsd-vm
RUN cd openbsd-vm && PATH="$(pwd):$PATH" bash run.sh importVM
