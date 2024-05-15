FROM debian:latest

RUN printf '#!/usr/bin/env sh\nexec "$@"' > /usr/bin/sudo && chmod +x /usr/bin/sudo
RUN sudo apt update && sudo apt install -y git wget python3-venv
RUN git clone https://github.com/vmactions/openbsd-vm
RUN cd openbsd-vm && python3 -m venv venv && . venv/bin/activate && bash run.sh importVM

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
