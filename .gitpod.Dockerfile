FROM gitpod/workspace-full:2023-09-26-07-06-38

# https://cloud.google.com/sdk/docs/install-sdk#deb
RUN sudo apt-get update && \
    sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN sudo apt-get update && sudo apt-get install google-cloud-cli

# https://github.com/cloudflare/cfssl
RUN go get github.com/cloudflare/cfssl/cmd/cfssl
RUN go get github.com/cloudflare/cfssl/cmd/cfssljson