FROM ubuntu:19.10
RUN apt-get update && apt-get install -y \
      curl \
      git \
      vim-common \
      iputils-ping \
      net-tools \
      vim \
      dnsutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 
# IBMCloud CLI 
RUN curl -sL https://ibm.biz/idt-installer | bash
# Cleanup
RUN apt-get purge -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

CMD ["/bin/bash"]
