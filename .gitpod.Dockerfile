FROM gitpod/workspace-full:2023-09-26-07-06-38
USER root

# https://cloud.google.com/sdk/docs/install-sdk#deb
RUN apt-get update && \
    apt-get install apt-transport-https ca-certificates gnupg curl sudo
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /usr/share/keyrings/cloud.google.asc && \
    apt-get update -y && apt-get install google-cloud-cli -y
      


# https://github.com/cloudflare/cfssl
# https://go.dev/doc/go-get-install-deprecation
RUN go install github.com/cloudflare/cfssl/cmd/cfssl@latest
RUN go install github.com/cloudflare/cfssl/cmd/cfssljson@latest
