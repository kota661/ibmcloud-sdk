FROM ubuntu:16.04
RUN apt-get update && apt-get install -y \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
# bluemix cli
RUN curl -fsSL https://clis.ng.bluemix.net/install/linux | sh \
  && bx --version \
  && bx plugin install container-service -r Bluemix \
  && bx plugin install container-registry -r Bluemix \
  && bx plugin install Cloud-Functions -r Bluemix
# kubernetes cli
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl

CMD ["/bin/bash"]
