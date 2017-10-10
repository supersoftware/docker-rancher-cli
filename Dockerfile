FROM alpine:3.6

ENV CLI_VERSION v0.6.4

WORKDIR /cli

RUN apk add --update ca-certificates openssl && update-ca-certificates && \
  wget -qO- https://github.com/rancher/cli/releases/download/${CLI_VERSION}/rancher-linux-amd64-${CLI_VERSION}.tar.gz | tar xvz && \
  mv rancher-${CLI_VERSION}/rancher . && \
  rm -rf rancher-${CLI_VERSION} && \
  rm -f rancher-linux-amd64-${CLI_VERSION}.tar.gz && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["./rancher"]
