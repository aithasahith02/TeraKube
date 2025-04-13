FROM hashicorp/terraform:light

RUN apk add --no-cache bash curl git openssh \
    && apk add --no-cache aws-cli \
    && curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl

WORKDIR /workspace

